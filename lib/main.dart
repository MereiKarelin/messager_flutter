import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messager/core/injectable/configurator.dart';
import 'package:messager/core/utils/m_colors.dart';
import 'package:messager/core/utils/routes.dart';
import 'package:messager/data/model/response/category_response_model.dart';
import 'package:messager/features/messages/category_list/category_view.dart';
import 'package:messager/features/messages/messages_list/messages_view.dart';

//START FIFTH DAY

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(onGenerateRoute: onGenerateRoute, title: 'Messages', theme: MThemeData.getTheme(), home: CategoryView());
  }
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.messages:
      return CupertinoPageRoute(
          builder: (_) => MessagesView(
                categorye: Categorye(),
                index: 0,
              ),
          settings: settings);

    default:
      return CupertinoPageRoute(builder: (_) => CategoryView(), settings: settings);
  }
}
