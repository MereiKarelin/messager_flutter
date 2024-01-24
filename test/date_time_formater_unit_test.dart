import 'package:flutter_test/flutter_test.dart';
import 'package:messager/core/utils/date_time_formater.dart';

void main() {
  test('Test formatDateTime function', () {
    // Test case: Вчера
    expect(
        formatDateTime(DateTime.now()
                .subtract(const Duration(days: 1))
                .millisecondsSinceEpoch ~/
            1000),
        "Вчера");

    // Test case: 1 час назад
    expect(
        formatDateTime(DateTime.now()
                .subtract(const Duration(hours: 1))
                .millisecondsSinceEpoch ~/
            1000),
        "час назад");

    // Test case: 2 часа назад
    expect(
        formatDateTime(DateTime.now()
                .subtract(const Duration(hours: 2))
                .millisecondsSinceEpoch ~/
            1000),
        "2 часа назад");

    // Test case: 23 часа назад
    expect(
        formatDateTime(DateTime.now()
                .subtract(const Duration(hours: 23))
                .millisecondsSinceEpoch ~/
            1000),
        "23 часа назад");

    // Test case: 2 дня назад
    expect(
        formatDateTime(DateTime.now()
                .subtract(const Duration(days: 2))
                .millisecondsSinceEpoch ~/
            1000),
        "два дня назад");

    // Test case: Другая дата
    expect(
        formatDateTime(DateTime.now()
                .subtract(const Duration(days: 5))
                .millisecondsSinceEpoch ~/
            1000),
        "19.01.2024");
  });
}
