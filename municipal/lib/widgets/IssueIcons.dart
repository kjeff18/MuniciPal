import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Issueicons extends StatelessWidget {
  final String iconPath;
  final String iconName;
  final VoidCallback onPressed;

  Issueicons({
    super.key,
    required this.iconPath,
    required this.iconName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return
       Column(
        children: [
           GestureDetector(
            onTap: onPressed,
             child: WebsafeSvg.asset(
                iconPath,
                width: 82,
                height: 82,
              ),
           ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding / 4),
            child: Text(
              iconName,
              textAlign: TextAlign.center,
              softWrap: true,
              style: textFont.copyWith(
                color: accentColor,
                fontSize: IssueCategoryTextSize,
              ),
            ),
          ),
        ],
      );
    
  }
}
