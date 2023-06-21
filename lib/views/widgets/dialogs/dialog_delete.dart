import 'package:flutter/material.dart';

class DialogDelete extends StatefulWidget {
  final BuildContext context;
  const DialogDelete({Key? key, required this.context}) : super(key: key);

  @override
  State<DialogDelete> createState() => DialogDeleteState();
}

class DialogDeleteState extends State<DialogDelete> {
  DialogDeleteState({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('削除しますか？'),
      children: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text('削除'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text('キャンセル'),
        ),
      ],
    );
  }
}
