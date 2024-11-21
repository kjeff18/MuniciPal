import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class IssueContainer extends StatelessWidget {
  final VoidCallback onPressed; 
  const IssueContainer({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(textFieldBorderRadius), 
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: textFieldBorderRadius,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(textFieldBorderRadius),
                    topRight: Radius.circular(textFieldBorderRadius),
                  ),
                  child: Image.asset(
                    "assets/IssueIcons/image.png",
                    fit: BoxFit.cover, 
                    width: double.infinity,
                    height: 200, 
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.005,
                  right: MediaQuery.of(context).size.width * 0.02,
                  child: Material( 
                    color: Colors.transparent, 
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey, 
                      ),
                      onPressed: onPressed
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 100 ,
              decoration: const BoxDecoration(
                color: backgroundColor, 
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(textFieldBorderRadius),
                  bottomRight: Radius.circular(textFieldBorderRadius),
                ),
              ),
              padding: const EdgeInsets.all(textFieldBorderRadius),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pedestrian Crossing',
                    style: textFont.copyWith(color: textColor, fontSize: HeadlineSize),
                  ),
                  Text(
                    '3 miles away',
                    style: textFont.copyWith(color: hintTextColor, fontSize: bodyTextSize),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
