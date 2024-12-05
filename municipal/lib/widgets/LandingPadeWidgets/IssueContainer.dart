import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/ReportType.dart';
import 'package:municipal/models/ModelProvider.dart';
import 'package:municipal/Page/PostPage.dart';
import 'package:cached_network_image/cached_network_image.dart';

class IssueContainer extends StatefulWidget {
  Issue issue;
  final double destination;
  final VoidCallback onPressed;

  IssueContainer({
    super.key,
    required this.issue,
    required this.destination,
    required this.onPressed,
  });

  @override
  State<IssueContainer> createState() => _IssueContainerState();
}

class _IssueContainerState extends State<IssueContainer> {
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
              offset: const Offset(0, 2),
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
                  child: widget.issue.imageUrls != null &&
                          widget.issue.imageUrls!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: widget.issue.imageUrls!.first,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                          placeholder: (context, url) => Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            width: double.infinity,
                            height: 200,
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(Icons.broken_image, size: 50),
                            ),
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey[200],
                          child: const Center(
                            child: Text(
                              "No Image Available",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
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
                      onPressed: widget.onPressed,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostPage(
                      issue: widget.issue,
                      onIssueUpdated: (updatedIssue) {
                        setState(() {
                          widget.issue = updatedIssue;
                        });
                      },
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: const BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(textFieldBorderRadius),
                    bottomRight: Radius.circular(textFieldBorderRadius),
                  ),
                ),
                padding: const EdgeInsets.all(textFieldBorderRadius),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.issue.category.toString().split('.').last ??
                              "Unknown Category",
                          style: textFont.copyWith(
                              color: textColor, fontSize: HeadlineSize),
                        ),
                        Text(
                          '${widget.destination} miles away',
                          style: textFont.copyWith(
                              color: hintTextColor, fontSize: bodyTextSize),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: hintTextColor,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
