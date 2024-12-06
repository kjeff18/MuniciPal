import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:municipal/widgets/ReportPageWidgets/DescriptionSection.dart';
import 'package:municipal/widgets/ReportPageWidgets/ImagePickerSections.dart';
import 'package:municipal/widgets/ReportPageWidgets/ReportHeader.dart';
import 'package:municipal/CustomBottomNavigationBar.dart';
import 'package:municipal/Helper/UserLocation.dart';
import 'package:geohash_plus/geohash_plus.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:aws_common/vm.dart';
import 'package:provider/provider.dart';
import 'package:municipal/model/UserState.dart';

class ReportPage extends StatefulWidget {
  final String iconPath;
  final String reportName;

  const ReportPage({
    super.key,
    required this.iconPath,
    required this.reportName,
  });

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ImagePicker _picker = ImagePicker();
  File? _image;
  bool _isSubmitting = false;

  final UserLocation _userLocation = UserLocation();

  void _dismissKeyboard() {
    FocusScope.of(context).unfocus(); // Dismisses the keyboard
  }

  Future<void> _showCupertinoImagePicker() async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              child: Text('Take a Photo',
                  style: textFont.copyWith(
                      color: accentColor, fontSize: bodyTextSize)),
              onPressed: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context); // Close the action sheet
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Choose from Photo',
                  style: textFont.copyWith(
                      color: accentColor, fontSize: bodyTextSize)),
              onPressed: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context); // Close the action sheet
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel',
                style: textFont.copyWith(
                    color: accentColor, fontSize: hintTextSize)),
            onPressed: () {
              Navigator.pop(context); // Close the action sheet
            },
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<String> _uploadImageToS3(File imageFile) async {
    try {
      final authUser = Provider.of<UserState>(context, listen: false).authUser;
      if (authUser == null) {
        throw Exception("User not logged in.");
      }

      // Define the S3 storage path for the uploaded file
      final fileName =
          'reports/${DateTime.now().millisecondsSinceEpoch}_${imageFile.path.split('/').last}';

      // Upload the file to S3
      final result = await Amplify.Storage.uploadFile(
        localFile: AWSFilePlatform.fromFile(imageFile),
        path: StoragePath.fromString(fileName),
      ).result;

      safePrint('Uploaded file: ${result.uploadedItem.path}');

      // Get the public URL for the uploaded file
      final getUrlResult = await Amplify.Storage.getUrl(
        path: StoragePath.fromString(result.uploadedItem.path),
      ).result;

      return getUrlResult.url.toString();
    } on StorageException catch (e) {
      safePrint('Error uploading image to S3: ${e.message}');
      throw Exception('Failed to upload image: ${e.message}');
    }
  }

  Future<void> _submitReport() async {
    if (_isSubmitting) return;
    print("Starting report submission...");
    if (_controller.text.isEmpty || _image == null) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error, 
        autoCloseDuration: Duration(seconds: 2),
        title: 'Error', 
        titleTextStyle: textFont.copyWith(color: accentColor, fontSize: HeadlineSize),
        text: 'Please provide a description and an image.', 
        textTextStyle: textFont.copyWith(color: accentColor, fontSize: bodyTextSize),
        confirmBtnText: 'OK',
        confirmBtnColor: accentColor, 
        backgroundColor: secondaryColor, 
        onConfirmBtnTap: () {},
        barrierDismissible: false,  
      );
      return;
    }

    // Fetch authenticated user
    print("Fetching authenticated user...");
    final authUser = Provider.of<UserState>(context, listen: false).authUser;
    if (authUser == null) {
      throw Exception("User not logged in.");
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      print("Fetching user location...");
      // Get user's current location
      final position = await _userLocation.getCurrentLocation();
      if (position == null) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error, 
          title: 'Error', 
          titleTextStyle: textFont.copyWith(color: accentColor, fontSize: HeadlineSize),
          text: 'Unable to get location. Please enable location services.', 
          textTextStyle: textFont.copyWith(color: accentColor, fontSize: bodyTextSize),
          confirmBtnText: 'OK',
          confirmBtnColor: accentColor, 
          backgroundColor: secondaryColor, 
          onConfirmBtnTap: () {},
          barrierDismissible: false,  
        );
        return;
      }

      print("User location: ${position.latitude}, ${position.longitude}");

      final latitude = position.latitude;
      final longitude = position.longitude;

      // Calculate geohash
      String geoHash = GeoHash.encode(latitude, longitude, precision: 7).hash;

      // Upload image to S3
      print("Uploading image...");
      String imageUrl = await _uploadImageToS3(_image!);
      print("Image uploaded: $imageUrl");

      // Prepare mutation
      const mutation = '''
        mutation HandleReport(\$input: HandleReportInput!) {
          handleReport(input: \$input)
        }
      ''';

      final variables = {
        "input": {
          "citizenId": authUser.userId,
          "citizenName":
              Provider.of<UserState>(context, listen: false).getUserName(),
          "latitude": latitude,
          "longitude": longitude,
          "geoHash": geoHash,
          "description": _controller.text,
          "imageUrl": imageUrl,
          "category": widget.reportName.replaceAll(' ', ''),
        },
      };

      // Call AppSync mutation
      print("Submitting GraphQL mutation... $variables");
      final response = await Amplify.API
          .mutate(
            request: GraphQLRequest<String>(
              document: mutation,
              variables: variables,
            ),
          )
          .response;

      if (response.errors.isNotEmpty) {
        throw Exception('GraphQL Error: ${response.errors.first.message}');
      }

      CoolAlert.show(
        context: context,
        type: CoolAlertType.success,
        title: 'Success!',
        titleTextStyle: textFont.copyWith(color: accentColor, fontSize: HeadlineSize),
        text: 'Your report has been submitted successfully.',
        textTextStyle: textFont.copyWith(color: accentColor, fontSize: bodyTextSize),
        confirmBtnText: 'OK',
        confirmBtnColor: accentColor,
        backgroundColor: secondaryColor,
        onConfirmBtnTap: () {
          Future.delayed(Duration(milliseconds: 300), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CustomBottomNavigationBar(initialIndex: 0),
              ),
            );
          });
        },
        barrierDismissible: false,
      );
      // Clear form
      _controller.clear();
      setState(() {
        _image = null;
      });
    } catch (e) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error, 
        title: 'Error', 
        titleTextStyle: textFont.copyWith(color: accentColor, fontSize: HeadlineSize),
        text: 'Error submitting report: $e', 
        textTextStyle: textFont.copyWith(color: accentColor, fontSize: bodyTextSize),
        confirmBtnText: 'OK',
        confirmBtnColor: accentColor, 
        backgroundColor: secondaryColor, 
        onConfirmBtnTap: () {},
        barrierDismissible: false,  
      );
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }
@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: _dismissKeyboard, // Dismiss the keyboard when tapping outside
    child: Scaffold(
      appBar: const CustomAppBar(
        title: 'Report',
        showBackButton: true,
      ),
      body: Stack(
        children: [
          // Main content inside the body
          SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReportHeader(
                    iconPath: widget.iconPath,
                    reportName: widget.reportName,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: textFont.copyWith(
                          fontSize: bodyTextSize,
                          color: accentColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '(${_controller.text.length}/200)',
                        style: textFont.copyWith(
                          fontSize: bodyTextSize,
                          color: accentColor,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: accentColor, width: 2),
                        borderRadius: BorderRadius.circular(textFieldBorderRadius),
                      ),
                      width: double.infinity,
                      height: 300, // You can make this dynamic if needed
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _controller,
                        maxLines: null,
                        expands: true,
                        maxLength: 200,
                        textAlignVertical: TextAlignVertical.top,
                        onSubmitted: (value) => _dismissKeyboard(),
                        decoration: const InputDecoration(
                          hintText: "Enter your text here...",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(defaultPadding),
                          counterText: "",
                        ),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  ImagePickerSection(onTap: _showCupertinoImagePicker, selectedImage: _image),
                  CustomButton(
                    text: "Submit",
                    onPressed: _submitReport,
                    blueButton: true,
                  ),
                ],
              ),
            ),
          ),
          // Show loading indicator while submitting
          if (_isSubmitting)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
}
