import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Issueicons extends StatelessWidget {
  final String iconPath;
  final String iconName;
  final double size;

  const Issueicons({
    super.key,
    required this.iconPath,
    required this.iconName,
    this.size = issueCatergoryIconSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WebsafeSvg.asset(
          iconPath,
          width: size,
          height: size,
        ),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(iconName,
          textAlign: TextAlign.center,
          softWrap: true,
              style: textFont.copyWith(
                  color: accentColor, fontSize: IssueCategoryTextSize)),
        )
      ],
    );
  }
}
