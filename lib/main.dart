import 'package:flutter/material.dart';
import 'package:todo_app_flutter/screens/LaunchScreen.dart';
import 'package:todo_app_flutter/util/Common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOリスト',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Common.themeColor),
        useMaterial3: true,
      ),
      home: LaunchScreen(),
    );
  }
}
