import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_planning_app/widgets/header_spacer.widget.dart';

import '../../api/api.util.dart';
import '../../constants/strings.constant.dart';
import '../../routes/route.constant.dart';
import '../../widgets/body.widget.dart';
import '../../widgets/otp_input.widget.dart';
import '../../widgets/text.widget.dart';
import '../../widgets/timer_button.widget.dart';
import 'api/login.api.dart';
import 'providers/mobile.provider.dart';

class EnterOtp extends ConsumerStatefulWidget {
  const EnterOtp({Key? key}) : super(key: key);

  @override
  ConsumerState<EnterOtp> createState() => _EnterOtpState();
}

class _EnterOtpState extends ConsumerState<EnterOtp> {
  // bool _isSubmittingOtp = false;
  // bool _isResendingOtp = false;
  bool _isValidOtp = true;

  _onResendOtp() async {
    final phoneNumber = ref.read(mobileProvider);

    await asyncFunctionWithLoading(
      context: context,
      asyncFunction: () async {
        await resendOtp(phoneNumber);
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.enterYourDetails,
            (_) => false,
          );
        }
      },
    );
  }

  _submitOtp(
    String enteredOtp,
  ) async {
    final phoneNumber = ref.read(mobileProvider);

    setState(() {
      _isValidOtp = true;
    });

    await asyncFunctionWithLoading(
      context: context,
      asyncFunction: () async {
        await verifyOtp(phoneNumber, enteredOtp);
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.enterYourDetails,
            (_) => false,
          );
        }
      },
      onFailure: () => setState(() {
        _isValidOtp = false;
      }),
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
            const H2Text(StringConstants.headerEnterOtp),
            const WidgetSpacer(type: WidgetSpacerType.large),
            OtpInput(
              onSubmitOtp: _submitOtp,
              isValidOtp: _isValidOtp,
            ),
            const WidgetSpacer(type: WidgetSpacerType.large),
            SizedBox(
              width: double.infinity,
              child: TimerButton(
                text: StringConstants.resendOtp,
                // enabled: !_isResendingOtp || !_isSubmittingOtp,
                onPressed: _onResendOtp,
                timerCount: 30,
                maxAttempts: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
