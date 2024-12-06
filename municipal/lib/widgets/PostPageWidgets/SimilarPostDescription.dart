import 'package:flutter/cupertino.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/HelperFunction/TimeAgoConverter.dart';

class SimilarPostDescription extends StatelessWidget {
  String username;
  String description;
  String createdAt;

  SimilarPostDescription(
      {super.key,
      required this.username,
      required this.description,
      required this.createdAt});
  @override
  Widget build(BuildContext context) {
    final timeAgo = TimeAgoConverter.calculateTimeAgo(createdAt);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(CupertinoIcons.profile_circled, size: iconSize),
          const SizedBox(width: defaultPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    username,
                    style: textFont.copyWith(
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: bodyTextSize,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    timeAgo,
                    style: textFont.copyWith(
                      color: hintTextColor,
                      fontSize: bodyTextSize,
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  description,
                  style: textFont.copyWith(fontSize: bodyTextSize - 2),
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
