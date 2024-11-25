import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:municipal/widgets/SecondaryBackground.dart';
import 'package:municipal/widgets/TextField.dart';
import 'package:municipal/Page/LandingPage.dart';
import 'package:municipal/CustomBottomNavigationBar.dart';
import 'package:municipal/Service/SignInService.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loginFunc(BuildContext context) async {
    final signInService = Provider.of<SignInService>(context, listen: false);
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter both email and password")),
      );
      return;
    }

    final result = await signInService.signIn(email, password);

    result.fold(
      (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error)),
        );
      },
      (success) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const CustomBottomNavigationBar()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<SignInService>(context).isLoading;

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
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Text(
                      "Welcome Back,",
                      style: textFont.copyWith(
                          color: textColor, fontSize: HeadlineSize),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      'Pal',
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
                  padding: const EdgeInsets.all(
                      defaultPadding), // Padding for text fields
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      CustomTextField(
                        hintText: 'Email',
                        controller: _emailController,
                        icon: Icon(Icons.mail),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        hintText: 'Password',
                        controller: _passwordController,
                        icon: Icon(Icons.lock),
                        obscureText: true,
                      ),
                      Spacer(),
                      CustomButton(
                        text: isLoading ? 'Logging in...' : 'Login',
                        onPressed: isLoading ? () {} : () => loginFunc(context),
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
