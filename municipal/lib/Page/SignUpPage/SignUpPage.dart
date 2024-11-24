import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:municipal/widgets/SecondaryBackground.dart';
import 'package:municipal/widgets/TextField.dart';
import 'SignUpPage2.dart';
import 'package:municipal/model/SignUpData.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final SignUpData signUpData = SignUpData();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  void signup2Func(BuildContext context) {
    signUpData.firstName = _firstnameController.text;
    signUpData.lastName = _lastnameController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SignUpPage2(signUpData: signUpData)),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          child: Text(
                            "Welcome,",
                            style: textFont.copyWith(
                                color: textColor, fontSize: HeadlineSize),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          child: Text(
                            'sign up to',
                            style: textFont.copyWith(
                                color: textColor, fontSize: HeadlineSize),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          child: Text(
                            'become a pal',
                            style: textFont.copyWith(
                                color: textColor, fontSize: HeadlineSize),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-40.0, 0.0),
                    child: Transform.scale(
                      scale: 2.5,
                      child: CircularProgressIndicator(
                        strokeWidth: 4.0,
                        valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                        backgroundColor: Colors.lightBlue[100],
                        value: 0.33,
                      ),
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
                        hintText: 'First Name',
                        controller: _firstnameController,
                        icon: Icon(Icons.account_box_rounded),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Last Name',
                        controller: _lastnameController,
                        icon: Icon(Icons.account_box_rounded),
                      ),
                      Spacer(),
                      CustomButton(
                        text: 'Next',
                        onPressed: () => signup2Func(context),
                        blueButton: true,
                      )
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
