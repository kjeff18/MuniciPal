
import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:websafe_svg/websafe_svg.dart';

void _LoginFunc ()
      {
        print("login");
      }
void _ForgotPasswordFunc ()
{
  print("forgetPassword");
}

void _SignUpFunc ()
{
  print("Sign up");
}
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Center(
                  child: WebsafeSvg.asset(
                    logoPath,
                    height: 150, // Adjust height as needed
                    width: 150, // Adjust width as needed
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Text(
                  "Sign in",
                  style: Theme.of(context).primaryTextTheme.headlineMedium,
                  ),
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: _EmailTextField(context),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:defaultPadding),
                child: _PasswordTextField(context),
              ),
              SizedBox(height:defaultPadding*2),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: _LoginButton(context),
              ),
              _ForgetPasswordButton(context),
              const Spacer(),
              _SignUpButton(context),

            ],
          ),
        ),
      ),
    );
  }
}

  Widget _EmailTextField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "Enter",
          hintStyle: Theme.of(context).primaryTextTheme.displaySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          // Handle the email input change
          print("Email: $value"); // Replace this with your logic
        },
      ),
    );
  }
  Widget _PasswordTextField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        enableSuggestions: false,
        obscureText: true,
        autocorrect: false,
        
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: Theme.of(context).primaryTextTheme.displaySmall,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {

          print("Password: $value");
        },
      ),
    );
  }

Widget _LoginButton(BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width, // Full width of the screen
    height: MediaQuery.of(context).size.width * 0.13, // Adjust height as needed
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentColor, // Use your defined color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
      ),
      onPressed: _LoginFunc, // Function to be called on press
      child: Text(
        'Log In',
        style: Theme.of(context).primaryTextTheme.displaySmall, // Use theme text style
      ),
    ),
  );
}

Widget _ForgetPasswordButton (BuildContext context)
{
  return TextButton(

      onPressed: _ForgotPasswordFunc,
    child: Text(
      'Forget Password?',
      style: textFont.copyWith(
        color: accentColor,
        fontWeight: FontWeight.bold, // Makes the text bold
        decoration: TextDecoration.underline, // Underlines the text
      ),
    ),
  );
}

Widget _SignUpButton (BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width, // Full width of the screen
    height: MediaQuery.of(context).size.width * 0.13, // Adjust height as needed
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentColor, // Use your defined color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
      ),
      onPressed: _SignUpFunc, // Function to be called on press
      child: Text(
        'Sign Up to become a Pal',
        style: Theme.of(context).primaryTextTheme.displaySmall, // Use theme text style
      ),
    ),
  );
}


