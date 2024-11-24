import 'dart:io';
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

class ReportPage extends StatefulWidget {
  final String iconPath;
  final String reportName;
  const ReportPage({super.key, required this.iconPath, required this.reportName});

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image; 

  Future<void> _showCupertinoImagePicker() async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Choose an Option', style: textFont.copyWith(color: accentColor, fontSize: hintTextSize)),
          actions: [
            CupertinoActionSheetAction(
              child: Text('Take a Photo', style: textFont.copyWith(color: accentColor, fontSize: hintTextSize)),
              onPressed: () {
                _pickImage(ImageSource.camera);
                Navigator.pop(context); // Close the action sheet
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Choose from Gallery', style: textFont.copyWith(color: accentColor, fontSize: hintTextSize)),
              onPressed: () {
                _pickImage(ImageSource.gallery);
                Navigator.pop(context); // Close the action sheet
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel', style: textFont.copyWith(color: accentColor, fontSize: hintTextSize)),
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

  void SubmitButton() {
    // Handle submit action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Report', showBackButton: true,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding *2 ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ReportHeader(iconPath: widget.iconPath, reportName: widget.reportName),
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
                    border: Border.all(
                      color: accentColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(textFieldBorderRadius),
                  ),
                  width: double.infinity,
                  height: 300, // Container height
                  child: TextField(
                    controller: _controller,
                    maxLines: null,  // Allow infinite lines
                    expands: true,    // Expands to take up all available space
                    maxLength: 200,
                    textAlignVertical: TextAlignVertical.top, // Align text to the top
                    decoration: const InputDecoration(
                      hintText: "Enter your text here...",
                      border: InputBorder.none, // Remove the default border
                      contentPadding: EdgeInsets.all(defaultPadding), // Padding inside the TextField
                      counterText: "", // Hide the maxLength counter
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
              ),
              ImagePickerSection(onTap: _showCupertinoImagePicker),
              CustomButton(text: "Submit", onPressed: SubmitButton, blueButton: true),
            ],
          ),
        ),
      ),
    );
  }
}





