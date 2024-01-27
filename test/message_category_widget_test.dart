import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messager/core/injectable/configurator.dart';
import 'package:messager/core/utils/date_time_formater.dart';
import 'package:messager/core/widgets/message_category_widget.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/features/messages/category_list/bloc/category_bloc.dart';

void main() {
  testWidgets('MessageCategoryWidget renders correctly',
      (WidgetTester tester) async {
    configureDependencies();
    final _categoryBloc = getIt<CategoryBloc>();
    // Create a Categorye instance for testing
    Categorye testCategorye = Categorye(
      uid: 'some_uid',
      firstname: 'John',
      lastname: 'Doe',
      lastMessage: 'Hello, world!',
      lastMessageByMe: 0,
      lastMessageDate: DateTime.now().millisecondsSinceEpoch ~/ 1000,
    );

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MessageCategoryWidget(
              categoryBloc: _categoryBloc, categorye: testCategorye),
        ),
      ),
    );

    // Wait for animations to complete.
    await tester.pumpAndSettle();

    // Verify that the widget is rendered.
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Hello, world!'), findsOneWidget);

    // Check if formatDateTime throws an error.
    try {
      formatDateTime(testCategorye.lastMessageDate ?? 0);
    } catch (e) {
      print('Error in formatDateTime: $e');
    }

    // Print the actual formatted date.
    print(
        'Formatted date: ${formatDateTime(testCategorye.lastMessageDate ?? 0)}');

    // Check if the formatted date matches the expected format.
    String formattedDate = formatDateTime(testCategorye.lastMessageDate ?? 0);
    expect(
      formattedDate,
      matches(r'\d{2}.\d{2}.\d{4}'), // Regex for 'dd.MM.yyyy' format
    );

    // Check if the formatted date is not empty.
    expect(formattedDate.isNotEmpty, true);

    // Check if the widget tree is healthy.
    expect(tester.takeException(), isNull);
  });
}
