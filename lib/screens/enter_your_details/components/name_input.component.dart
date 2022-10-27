import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../constants/strings.constant.dart';

class NameInput extends StatelessWidget {
  final Function(String) onChanged;

  const NameInput({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: 'name',
      autofocus: true,
      decoration: const InputDecoration(
        labelText: StringConstants.enterYourName,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      onChanged: (val) {
        if (val != null) {
          onChanged(val);
        }
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      initialValue: ' ',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }
}
