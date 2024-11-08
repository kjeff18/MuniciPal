import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/widgets/CustomBottomNavigationBar.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:municipal/widgets/SecondaryBackground.dart';
import 'package:municipal/widgets/TextField.dart'; // Ensure you have this file created with CustomTextField

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  
     void loginFunc(BuildContext context) {
    // Navigate to LogInPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>CustomBottomNavigationBar()),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Text(
                      "Welcome Back,",
                      style: textFont.copyWith(color: textColor, fontSize: HeadlineSize),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Text(
                      'Pal',
                      style: textFont.copyWith(color: textColor, fontSize: HeadlineSize),
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
                      padding: const EdgeInsets.all(defaultPadding), // Padding for text fields
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

                          CustomButton(text: 'Login',  onPressed: () => loginFunc(context), blueButton: true)
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

  
