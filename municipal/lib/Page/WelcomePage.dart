import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:municipal/Page/SignUpPage/SignUpPage.dart';
import 'package:municipal/widgets/CustomAppBar.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'LoginPage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void loginFunc(BuildContext context) {
    // Navigate to LogInPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogInPage()),
    );
  }

  void SignUpFunc(BuildContext context) {
    // Navigate to LogInPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

// Design and Placements
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Image.asset(
              logo,
              width: 150,
            )),
            SvgPicture.asset(logoText),
            const SizedBox(height: 30),
            Text('Get Started',
                style: textFont.copyWith(color: accentColor, fontSize: 15)),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Login',
              onPressed: () => loginFunc(context),
              blueButton: true,
            ),
            CustomButton(
                text: 'Sign Up',
                onPressed: () => SignUpFunc(context),
                blueButton: false),
          ],
        ));
  }
}
