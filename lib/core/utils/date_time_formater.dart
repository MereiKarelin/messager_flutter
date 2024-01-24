String formatDateTime(int timestamp) {
  DateTime now = DateTime.now();
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  Duration difference = now.difference(dateTime);

  if (difference.inHours == 1) {
    return "час назад";
  } else if (difference.inHours > 1 && difference.inHours <= 23) {
    return "${difference.inHours} часа назад";
  } else if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day - 1) {
    return "Вчера";
  } else if (difference.inDays == 2) {
    return "два дня назад";
  } else {
    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String year = dateTime.year.toString();
    return "$day.$month.$year";
  }
}
