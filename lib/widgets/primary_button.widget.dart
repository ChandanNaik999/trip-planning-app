import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isHalfSize;

  const PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isHalfSize = false,
  }) : super(key: key);

  Color getBackgroundColor(Set<MaterialState> states, BuildContext context) {
    if (states.contains(MaterialState.disabled)) {
      return Theme.of(context).colorScheme.secondary;
    }
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding:
            MaterialStateProperty.all(EdgeInsets.all(isHalfSize ? 12.0 : 16)),
        textStyle:
            MaterialStateProperty.all(Theme.of(context).textTheme.button),
        backgroundColor: MaterialStateProperty.resolveWith(
            (states) => getBackgroundColor(states, context)),
        // MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
        foregroundColor:
            MaterialStateProperty.all(Theme.of(context).colorScheme.onPrimary),
      ),
      child: Text(text),
    );
  }
}
