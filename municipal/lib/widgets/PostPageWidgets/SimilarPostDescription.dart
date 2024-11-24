import 'package:flutter/cupertino.dart';
import 'package:municipal/DesingContstant.dart';

class SimilarPostDescription extends StatelessWidget {
  String username;
  String description;
   SimilarPostDescription({super.key, required this.username, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Aligning items to the start of the row
        children: [
          const Icon(CupertinoIcons.profile_circled, size: iconSize),
          
          const SizedBox(width: defaultPadding),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(
                username,
                style: textFont.copyWith(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: bodyTextSize, 
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7, 
                child: Text(
                description,
                  style: textFont.copyWith(fontSize: bodyTextSize -2), 
                  maxLines: 3, 
                  overflow: TextOverflow.ellipsis, 
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
