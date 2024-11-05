import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon icon; 
  final bool obscureText;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.icon, 
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding), 
      child: TextField(
        obscureText: obscureText  ,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          
          prefixIcon: Icon(
            icon.icon,
            color: TextFieldIconColor,
          ), 
          filled: true,
          fillColor: BackgroundColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: TextFieldBorer), 
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: TextFieldBorer ), 
          ),
        ),
      ),
    );
  }
}
