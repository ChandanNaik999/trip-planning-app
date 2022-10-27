import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DatePickerFilter extends StatelessWidget {
  final String name;
  final String labelText;
  final Function(DateTime) onChanged;
  final InputType inputType;

  const DatePickerFilter({
    Key? key,
    required this.name,
    this.inputType = InputType.both,
    required this.labelText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      initialEntryMode: DatePickerEntryMode.calendar,
      initialValue: null,
      inputType: inputType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: labelText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      initialTime: const TimeOfDay(hour: 8, minute: 0),
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
  }
}
