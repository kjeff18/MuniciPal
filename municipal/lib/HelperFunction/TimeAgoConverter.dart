import 'package:intl/intl.dart';

class TimeAgoConverter {
  static String calculateTimeAgo(String timestamp) {
    final now = DateTime.now().toUtc();
    final createdTime = DateTime.parse(timestamp).toUtc();
    final difference = now.difference(createdTime);

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes}min";
    } else if (difference.inHours < 24) {
      return "${difference.inHours}h";
    } else if (difference.inDays < 7) {
      return "${difference.inDays}d";
    } else {
      final weeks = (difference.inDays / 7).floor();
      return "${weeks}w";
    }
  }
}
