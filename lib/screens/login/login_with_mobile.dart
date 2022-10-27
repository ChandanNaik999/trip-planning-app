import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planning_app/widgets/header_spacer.widget.dart';
import '../../widgets/body.widget.dart';
import 'providers/mobile.provider.dart';

import '../../api/api.util.dart';
import '../../constants/strings.constant.dart';
import '../../routes/route.constant.dart';
import '../../widgets/input_mobile_number.widget.dart';
import '../../widgets/primary_button.widget.dart';
import '../../widgets/text.widget.dart';
import 'api/login.api.dart';
import 'utils/mobile_validator.util.dart';

class LoginWithMobile extends ConsumerStatefulWidget {
  const LoginWithMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginWithMobile> createState() => _LoginWithMobileState();
}

class _LoginWithMobileState extends ConsumerState<LoginWithMobile> {
  String _mobileNumber = '';

  _onSubmitMobileNumber() async {
    await asyncFunctionWithLoading(
      context: context,
      asyncFunction: () async {
        await sendOtp(_mobileNumber);
        changeMobile(ref, _mobileNumber);

        if (mounted) {
          Navigator.pushNamed(context, Routes.enterOtp);
        }
      },
    );
  }

  void _onMobileChanged(mobileNumber) {
    setState(() {
      _mobileNumber = mobileNumber;
    });
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
            const H2Text(
              StringConstants.headerLoginOrSignUp,
            ),
            const WidgetSpacer(type: WidgetSpacerType.large),
            InputMobile(_onMobileChanged),
            const WidgetSpacer(type: WidgetSpacerType.medium),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: StringConstants.getOtp,
                onPressed: isValidMobileNumber(_mobileNumber)
                    ? _onSubmitMobileNumber
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
