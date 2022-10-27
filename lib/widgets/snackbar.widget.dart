// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trip_planning_app/constants/strings.constant.dart';

import '../constants/error_messages.constant.dart';

ErrorSnackbar(
    {required BuildContext context,
    String message = ErrorMessages.somethingWentWrong}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
  ));
}

SuccessfulSnackbar(
    {required BuildContext context,
    String message = StringConstants.successful}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: Colors.green[400],
  ));
}
