import 'package:flutter/material.dart';

InputDecoration getInputDecoration(BuildContext context) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onPrimary,
        width: 2,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    filled: true,
    fillColor: Theme.of(context).colorScheme.onPrimary,
  );
}
