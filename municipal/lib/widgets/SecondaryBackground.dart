import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class Secondarybackground extends StatelessWidget {
  const Secondarybackground({super.key});

  @override
  Widget build(BuildContext context) {
    return  
      Expanded(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(secondaryBackgroundBorderRadius)
            )
          ),
          
            ),
      );
  }
}