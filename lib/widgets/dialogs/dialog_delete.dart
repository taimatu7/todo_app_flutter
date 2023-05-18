import 'package:flutter/material.dart';

class DialogDelete extends StatefulWidget {
  final Function onPressed;
  final BuildContext context;
  const DialogDelete({Key? key, required this.context, required this.onPressed})
      : super(key: key);

  @override
  State<DialogDelete> createState() => DialogDeleteState(onPressed: onPressed);
}

class DialogDeleteState extends State<DialogDelete> {
  final Function onPressed;

  DialogDeleteState({
    Key? key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('削除しますか？'),
      children: [
        SimpleDialogOption(
          onPressed: () {
            onPressed();
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
