import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../constants/strings.constant.dart';
import '../../../styling/input_field_decoration.dart';
import '../constants/filter_types.constant.dart';

class CategoryFilter extends StatelessWidget {
  final List<String> categories;
  final Function(String) onSelectCategory;

  const CategoryFilter({
    Key? key,
    required this.categories,
    required this.onSelectCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<String>(
      name: FilterType.category,
      elevation: 6,
      decoration: getInputDecoration(context).copyWith(
        labelText: StringConstants.chooseCategory,
        hintText: StringConstants.chooseCategory,
      ),
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
      items: categories
          .map((category) => DropdownMenuItem(
                alignment: AlignmentDirectional.center,
                value: category,
                child: Text(category),
              ))
          .toList(),
      onChanged: (val) {
        if (val != null) {
          onSelectCategory(val);
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      valueTransformer: (val) => val?.toString(),
    );
  }
}
