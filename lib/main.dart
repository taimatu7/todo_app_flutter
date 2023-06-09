import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/views/screens/launch_screen.dart';
import 'package:todo_app_flutter/util/common.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODOリスト',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Common.themeColor),
        useMaterial3: true,
      ),
      home: LaunchScreen(),
    );
  }
}
