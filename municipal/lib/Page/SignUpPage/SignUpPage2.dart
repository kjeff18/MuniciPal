import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:municipal/widgets/SecondaryBackground.dart';
import 'package:municipal/widgets/TextField.dart';
import 'SignUpPage3.dart';
class SignUpPage2 extends StatelessWidget {
  SignUpPage2({super.key});

  final TextEditingController _address = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _zip = TextEditingController();

  void signup3Func(BuildContext context) {
    // Navigate to SignUpPage3
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage3()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Text(
                            "Welcome,",
                            style: textFont.copyWith(color: textColor, fontSize: HeadlineSize),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Text(
                            'sign up to',
                            style: textFont.copyWith(color: textColor, fontSize: HeadlineSize),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: Text(
                            'become a pal',
                            style: textFont.copyWith(color: textColor, fontSize: HeadlineSize),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-40.0, 0.0),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.33, end: 0.66),
                      duration: Duration(seconds: 1),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: 2.5,
                          child: CircularProgressIndicator(
                            strokeWidth: 4.0,
                            valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                            backgroundColor: Colors.lightBlue[100],
                            value: value, // Animated value
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Secondarybackground(),
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      CustomTextField(
                        hintText: 'Address',
                        controller: _address,
                        icon: Icon(Icons.location_on),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'City',
                        controller: _city,
                        icon: Icon(Icons.location_city),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: 'State',
                              controller: _state,
                              icon: Icon(Icons.map),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'ZIP Code',
                              controller: _zip,
                              icon: Icon(Icons.pin_drop),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CustomButton(
                        text: 'Next',
                        onPressed: () => signup3Func(context),
                        blueButton: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
