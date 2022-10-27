import 'package:flutter/material.dart';

import 'package:loader_overlay/loader_overlay.dart';

import '../constants/error_messages.constant.dart';
import '../widgets/snackbar.widget.dart';

asyncFunctionWithLoading({
  required BuildContext context,
  required Function asyncFunction,
  String? errorMessage,
  Function? onSuccess,
  Function? onFailure,
}) async {
  context.loaderOverlay.show();
  try {
    await asyncFunction();
    context.loaderOverlay.hide();
    if (onSuccess != null) {
      onSuccess();
    }
  } catch (e) {
    context.loaderOverlay.hide();
    ErrorSnackbar(
        context: context,
        message: errorMessage ?? ErrorMessages.somethingWentWrong);
    if (onFailure != null) {
      onFailure();
    }
  }
}
