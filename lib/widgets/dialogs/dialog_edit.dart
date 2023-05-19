import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/todo.dart';

class DialogEdit extends StatefulWidget {
  final Function onPressed;
  final BuildContext context;
  final Todo? todo;
  const DialogEdit(
      {Key? key, required this.context, required this.onPressed, this.todo})
      : super(key: key);

  @override
  State<DialogEdit> createState() =>
      DialogEditState(onPressed: onPressed, todo: todo);
}

class DialogEditState extends State<DialogEdit> {
  final Function onPressed;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  Todo? todo;

  DialogEditState({
    Key? key,
    required this.onPressed,
    this.todo,
  });

  @override
  void initState() {
    super.initState();
    if (todo != null) {
      _titleController.text = todo!.title;
      _contentController.text = todo!.content;
    } else {
      todo = const Todo(title: '', content: '', isDone: 0);
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
              onChanged: (value) {
                todo = todo!.copyWith(title: value);
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(labelText: '説明'),
              onChanged: (value) {
                todo = todo!.copyWith(content: value);
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  onPressed(todo!);
                  Navigator.of(context).pop();
                },
                child: const Text('保存')),
          ],
        ),
      ),
    );
  }
}
