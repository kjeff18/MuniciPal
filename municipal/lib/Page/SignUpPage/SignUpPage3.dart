import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:municipal/widgets/SecondaryBackground.dart';
import 'package:municipal/widgets/CustomTextField.dart';
import 'package:municipal/Page/LoginPage.dart';

final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();
final TextEditingController _confirm = TextEditingController();

void loginFunc(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LogInPage()),
  );
}


class SignUpPage3 extends StatelessWidget {
  const SignUpPage3({super.key});

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
                      tween: Tween<double>(begin: 0.66, end: 1.0),
                      duration: Duration(seconds: 1),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: 2.5,
                          child: CircularProgressIndicator(
                            strokeWidth: 4.0,
                            valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                            backgroundColor: Colors.lightBlue[100],
                            value: value,
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
                        hintText: 'Email',
                        controller: _email,
                        icon: Icon(Icons.email),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Password',
                        controller: _password,
                        icon: Icon(Icons.visibility_off),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Confirm Password',
                        controller: _confirm,
                        icon: Icon(Icons.visibility_off),
                        obscureText: true,
                      ),
                      Spacer(),
                      CustomButton(
                        text: 'Finish',
                        onPressed: () => loginFunc(context),
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