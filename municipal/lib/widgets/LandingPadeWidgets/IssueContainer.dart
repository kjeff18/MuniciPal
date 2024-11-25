import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Helper/IssueCategory.dart';
import 'package:municipal/models/ModelProvider.dart';

class IssueContainer extends StatelessWidget {
  final Issue issue;
  final double destination;
  final VoidCallback onPressed;

  const IssueContainer({
    super.key,
    required this.issue,
    required this.destination,
    required this.onPressed,
  });

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
                  child: issue.imageUrl != null && issue.imageUrl!.isNotEmpty
                      ? Image.network(
                          issue.imageUrl!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return Container(
                              width: double.infinity,
                              height: 200,
                              color: Colors.grey[200],
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              height: 200,
                              color: Colors.grey[200],
                              child: const Center(
                                child: Icon(Icons.broken_image, size: 50),
                              ),
                            );
                          },
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
                      onPressed: onPressed,
                    ),
                  ),
                ),
              ],
            ),
            Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    issue.category.toString().split('.').last ??
                        "Unknown Category",
                    style: textFont.copyWith(
                        color: textColor, fontSize: HeadlineSize),
                  ),
                  Text(
                    '${destination} miles away',
                    style: textFont.copyWith(
                        color: hintTextColor, fontSize: bodyTextSize),
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
