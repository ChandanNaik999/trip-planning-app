import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/strings.constant.dart';
import '../../../widgets/text.widget.dart';

import '../../../widgets/timer_button.widget.dart';

class CreateTripLoader extends StatelessWidget {
  final VoidCallback onCancel;

  const CreateTripLoader({required this.onCancel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            Lottie.asset(
              'assets/animations/create_trip_loader.json',
              repeat: true,
              reverse: false,
              animate: true,
              width: 300,
              height: 300,
            ),
            const Spacer(flex: 4),
            const B1Text(StringConstants.pleaseWaitWhileWeCreateATripForYou),
            const Spacer(flex: 1),
            TimerButton(
              text: StringConstants.cancel,
              enabled: true,
              onPressed: onCancel,
              timerCount: 30,
              maxAttempts: 1,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
