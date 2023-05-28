import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/todo.dart';

class DialogEdit extends StatefulWidget {
  final BuildContext context;
  final Todo? todo;
  const DialogEdit({Key? key, required this.context, required this.todo})
      : super(key: key);

  @override
  State<DialogEdit> createState() => DialogEditState(todo: todo);
}

class DialogEditState extends State<DialogEdit> {
  final Todo? todo;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  DialogEditState({
    Key? key,
    required this.todo,
  });

  @override
  void initState() {
    super.initState();
    if (todo != null) {
      _titleController.text = todo!.title;
      _contentController.text = todo!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'タイトル'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: '説明'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('保存'),
              onPressed: () async {
                final todoEditied = Todo(
                  title: _titleController.text,
                  description: _contentController.text,
                );
                Navigator.pop(context, todoEditied);
              },
            ),
          ],
        ),
      ),
    );
  }
}
