import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  final String content;
  final String successMessage;
  final VoidCallback? onSuccess;
  final String failMessage;
  final VoidCallback? onFail;

  const Alert({
    Key? key,
    required this.content,
    required this.successMessage,
    this.onSuccess,
    required this.failMessage,
    this.onFail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(content),
      actions: [
        TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary)),
          onPressed: onFail,
          child: Text(failMessage),
        ),
        TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.primary)),
          onPressed: onSuccess,
          child: Text(successMessage),
        ),
      ],
    );
  }
}
