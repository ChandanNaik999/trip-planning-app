import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:trip_planning_app/widgets/header_spacer.widget.dart';

import '../../api/api.util.dart';
import '../../constants/strings.constant.dart';
import '../../routes/route.constant.dart';
import '../../widgets/body.widget.dart';
import '../../widgets/primary_button.widget.dart';
import '../../widgets/text.widget.dart';
import '../filters/components/date_picker.component.dart';
import 'api/submit_profile.api.dart';
import 'components/name_input.component.dart';
import 'models/profile.model.dart';

class EnterYourDetails extends StatefulWidget {
  const EnterYourDetails({Key? key}) : super(key: key);

  @override
  State<EnterYourDetails> createState() => _EnterYourDetailsState();
}

class _EnterYourDetailsState extends State<EnterYourDetails> {
  final _formKey = GlobalKey<FormBuilderState>();
  late Profile _profile;

  @override
  initState() {
    super.initState();
    _profile = Profile(name: '', dob: '');
  }

  onChangeName(String newName) {
    _profile.name = newName;
  }

  onChangedDob(DateTime dob) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    _profile.dob = formatter.format(dob);
  }

  _onSubmit() async {
    await asyncFunctionWithLoading(
      context: context,
      asyncFunction: () async {
        await submitProfile(_profile);
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(context, Routes.home, (r) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Body(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const HeaderSpacer(),
            const H2Text(StringConstants.headerEnterYourDetails),
            FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
                debugPrint(_formKey.currentState!.value.toString());
              },
              skipDisabled: true,
              child: Column(
                children: <Widget>[
                  const WidgetSpacer(type: WidgetSpacerType.medium),
                  NameInput(onChanged: onChangeName),
                  const WidgetSpacer(type: WidgetSpacerType.medium),
                  DatePickerFilter(
                    name: 'dob',
                    inputType: InputType.date,
                    labelText: StringConstants.enterYourDOB,
                    onChanged: onChangedDob,
                  ),
                ],
              ),
            ),
            const WidgetSpacer(type: WidgetSpacerType.large),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: StringConstants.submit,
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    _onSubmit();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
