import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:municipal/widgets/SecondaryBackground.dart';
import 'package:municipal/widgets/CustomTextField.dart';
import 'package:municipal/Service/SignUpService.dart';
import 'package:municipal/Page/LoginPage.dart';
import 'package:provider/provider.dart';

class ConfirmSignUpPage extends StatelessWidget {
  final String email;
  final TextEditingController _codeController = TextEditingController();

  ConfirmSignUpPage({super.key, required this.email});

  void confirmSignUp(BuildContext context) async {
    final signUpService = Provider.of<SignUpService>(context, listen: false);
    final code = _codeController.text;

    final result = await signUpService.confirmSignUp(email: email, code: code);
    result.fold(
      (error) {
        // Show error to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
      (isComplete) {
        if (isComplete) {
          // Navigate to login page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LogInPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Confirmation incomplete.')),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final signUpService = Provider.of<SignUpService>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      "One Last Step,",
                      style: textFont.copyWith(
                          color: textColor, fontSize: HeadlineSize),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      'Confirm your account',
                      style: textFont.copyWith(
                          color: textColor, fontSize: HeadlineSize),
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
                        hintText: 'Confirmation Code',
                        controller: _codeController,
                        icon: Icon(Icons.verified),
                      ),
                      const SizedBox(height: 16),
                      if (signUpService.isLoading)
                        CircularProgressIndicator(), // Show loading spinner
                      Spacer(),
                      CustomButton(
                        text: 'Confirm',
                        onPressed: () => confirmSignUp(context),
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
