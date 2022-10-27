import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isHalfSize;

  const SecondaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isHalfSize = false,
  }) : super(key: key);

  BorderSide getBorderSide(BuildContext context, Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return BorderSide(color: Theme.of(context).disabledColor);
    }
    return BorderSide(color: Theme.of(context).colorScheme.primary);
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(EdgeInsets.all(isHalfSize ? 12.0 : 16)),
        side: MaterialStateProperty.resolveWith(
            (states) => getBorderSide(context, states)),
        textStyle:
            MaterialStateProperty.all(Theme.of(context).textTheme.button),
      ),
      child: Text(text),
    );
  }
}
