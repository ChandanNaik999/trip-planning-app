import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/strings.constant.dart';

class InputMobile extends StatelessWidget {
  final void Function(String mobile) onMobileChanged;

  const InputMobile(this.onMobileChanged, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: const InputDecoration(
        labelText: StringConstants.mobileNumber,
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
      autofocus: true,
      initialCountryCode: 'IN',
      onChanged: (mobile) => onMobileChanged(mobile.completeNumber),
    );
  }
}
