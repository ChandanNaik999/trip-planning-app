import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../constants/strings.constant.dart';
import '../constants/filter_types.constant.dart';


//TODO: https://medium.com/comerge/location-search-autocomplete-in-flutter-84f155d44721

class PlaceFilter extends StatelessWidget {
  final Function(String) onChanged;

  const PlaceFilter({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: FilterType.place,
      decoration: const InputDecoration(
        labelText: StringConstants.whereWouldYouLikeToVisit,
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
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
      initialValue: '1',
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.next,
    );
  }
}
