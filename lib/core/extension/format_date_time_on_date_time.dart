extension FormatDateTimeOnDateTime on DateTime {
  String formatTime() {
    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
  }

  String get formatDate => '$day/$month/$year';

  String since() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.isNegative) {
      return 'just now';
    } else if (difference.inSeconds < 60) {
      return '${difference.inSeconds.abs()} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes.abs()} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours.abs()} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays.abs()} days ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor().abs()} weeks ago';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor().abs()} months ago';
    } else {
      return '${(difference.inDays / 365).floor().abs()} years ago';
    }
  }
}
