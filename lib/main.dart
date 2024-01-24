import 'package:flutter/material.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/features/messages/category_list/category_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Messages', theme: MThemeData.getTheme(), home: CategoryView());
  }
}
