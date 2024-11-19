import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:municipal/DesingContstant.dart';

class ReportHeader extends StatelessWidget {
  final String iconPath;
  final String reportName;

  const ReportHeader({
    Key? key,
    required this.iconPath,
    required this.reportName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 120),
        Container(
          width: 100,
          height: 100,
          child: SvgPicture.asset(iconPath, width: 100, height: 100),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              reportName,
              textAlign: TextAlign.center,
              style: textFont.copyWith(
                fontSize: HeadlineSize,
                color: accentColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}