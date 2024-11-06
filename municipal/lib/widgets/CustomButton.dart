import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.blueButton,
  });

  final VoidCallback onPressed; 
  final String text;
  final bool blueButton;

  @override
  Widget build(BuildContext context) {
    Color textColor = blueButton ? Colors.white : ButtonColor;
    Color buttonColor = blueButton ? ButtonColor : Colors.white;
    return GestureDetector(
      onTap: onPressed, 
      child: Container(
        decoration:  BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(secondaryBackgroundBorderRadius)), 
          color: buttonColor,
         boxShadow: const [
          BoxShadow(
            color: Colors.black26, 
            blurRadius: 4.0, 
            offset: Offset(2.0, 2.0), 
            spreadRadius: 1.0,
          ),
        ],
        border: Border.all(
          color: ButtonColor,
          width: 2.0
          )
        ), 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding,vertical: defaultPadding/2),
          child: Center(
            child: Text(
              text,
              style: textFont.copyWith(color: textColor
              , fontSize:30 )
              )
            ),
          ),
        ),
      );
  }
}
