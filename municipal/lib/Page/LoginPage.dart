import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:municipal/widgets/SecondaryBackground.dart';
import 'package:municipal/widgets/CustomTextField.dart';
import 'package:municipal/CustomBottomNavigationBar.dart';
import 'package:municipal/Service/SignInService.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginFunc(BuildContext context) async {
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
            builder: (context) => const CustomBottomNavigationBar(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<SignInService>(context).isLoading;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
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
                          const SizedBox(height: 40),
                          CustomTextField(
                            hintText: 'Email',
                            controller: _emailController,
                            icon: const Icon(Icons.mail),
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            hintText: 'Password',
                            controller: _passwordController,
                            icon: const Icon(Icons.lock),
                            obscureText: true,
                          ),
                          const Spacer(),
                          CustomButton(
                            text: 'Login',
                            onPressed:
                                isLoading ? null : () => loginFunc(context),
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
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5), // Gray overlay
                child: const Center(
                  child: CircularProgressIndicator(), // Loading spinner
                ),
              ),
            ),
        ],
      ),
    );
  }
}
