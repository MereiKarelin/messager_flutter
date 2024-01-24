String formatDateTime(int timestamp) {
  DateTime now = DateTime.now();
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  if (dateTime.year == now.year &&
      dateTime.month == now.month &&
      dateTime.day == now.day - 1) {
    return "Вчера";
  } else {
    Duration difference = now.difference(dateTime);

    if (difference.inHours == 1) {
      return "час назад";
    } else if (difference.inHours > 1 && difference.inHours <= 23) {
      return "${difference.inHours} часа назад";
    } else if (difference.inDays == 2) {
      return "два дня назад";
    } else {
      return "${dateTime.day}.${dateTime.month}.${dateTime.year}";
    }
  }
}
