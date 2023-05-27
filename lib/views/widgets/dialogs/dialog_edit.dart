import 'package:flutter/material.dart';

class DialogEdit extends StatefulWidget {
  final Function onPressed;
  final BuildContext context;
  const DialogEdit({Key? key, required this.context, required this.onPressed})
      : super(key: key);

  @override
  State<DialogEdit> createState() => DialogEditState(onPressed: onPressed);
}

class DialogEditState extends State<DialogEdit> {
  final Function onPressed;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  DialogEditState({
    Key? key,
    required this.onPressed,
  });

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
            ElevatedButton(onPressed: () async {}, child: const Text('保存')),
          ],
        ),
      ),
    );
  }
}
