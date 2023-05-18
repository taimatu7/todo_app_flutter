import 'package:flutter/material.dart';
import 'package:todo_app_flutter/util/Common.dart';
import 'package:todo_app_flutter/widgets/todo_list.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOリスト'),
        backgroundColor: Common.themeColor,
      ),
      body: !_isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : todoList(),
      floatingActionButton:
          FloatingActionButton(child: const Icon(Icons.add), onPressed: () {}),
    );
  }
}
