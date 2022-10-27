import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../constants/strings.constant.dart';
import '../constants/filter_types.constant.dart';


class NoOfPeopleFilter extends StatelessWidget {
  final Function(int) onChanged;

  const NoOfPeopleFilter({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: FilterType.noOfPeople,
      decoration: const InputDecoration(
        labelText: StringConstants.howManyPeople,
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
          onChanged(int.parse(val));
        }
      },
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.numeric(),
        FormBuilderValidators.min(1),
        FormBuilderValidators.max(100),
      ]),
      initialValue: '1',
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
    );
  }
}
