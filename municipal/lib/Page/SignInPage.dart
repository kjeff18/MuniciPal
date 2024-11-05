
import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:municipal/widgets/WelcomeButton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'LoginPage.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

   void loginFunc(BuildContext context) {
    // Navigate to LogInPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogInPage()),
    );
  }


// Design and Placements
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset(logo,width: 150,)),
          SvgPicture.asset(logoText),

          const SizedBox(height: 30),

          Text('Get Started',
          style: textFont.copyWith(color: ButtonColor,fontSize: 15)),
           
           const SizedBox(height: 30),
    
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: defaultPadding*4, vertical: defaultPadding/2),
             child: Welcomebutton(
                text: 'Login',
               onPressed: () => loginFunc(context), 
               blueButton: true,
               ),
           ),

           Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding*4, vertical: defaultPadding/2),
            child: Welcomebutton(text: 'Sign Up', 
            onPressed: () => loginFunc(context),
             blueButton: false
             ), 
           )
          
        ],
      )
    );

  }
      
}


