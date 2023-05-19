import 'package:flutter/material.dart';
import 'package:todo_app_flutter/models/todo.dart';

class DialogDelete extends StatefulWidget {
  final Function onPressed;
  final BuildContext context;
  final int id;

  const DialogDelete(
      {Key? key,
      required this.context,
      required this.onPressed,
      required this.id})
      : super(key: key);

  @override
  State<DialogDelete> createState() =>
      DialogDeleteState(onPressed: onPressed, id: id);
}

class DialogDeleteState extends State<DialogDelete> {
  final Function onPressed;
  final int id;

  DialogDeleteState({
    Key? key,
    required this.onPressed,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('削除しますか？'),
      children: [
        SimpleDialogOption(
          onPressed: () {
            onPressed(id);
            Navigator.of(context).pop();
          },
          child: const Text('削除'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('キャンセル'),
        ),
      ],
    );
  }
}
