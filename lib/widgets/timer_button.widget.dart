import 'dart:async';

import 'package:flutter/material.dart';

import '../constants/error_messages.constant.dart';
import 'secondary_button.widget.dart';

class TimerButton extends StatefulWidget {
  final bool enabledFromParent;
  final VoidCallback onPressed;
  final int maxAttempts;
  final String text;
  final int timerCount;

  const TimerButton({
    Key? key,
    enabled = true,
    required this.onPressed,
    this.maxAttempts = 1,
    required this.text,
    this.timerCount = 30,
  })  : enabledFromParent = enabled,
        super(key: key);

  @override
  State<TimerButton> createState() => _TimerButtonState();
}

class _TimerButtonState extends State<TimerButton> {
  int _secondsRemaining = 0;
  int _maxAttempts = 0;
  int _timerCount = 0;
  bool _enableResend = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _timerCount = widget.timerCount;
    _maxAttempts = widget.maxAttempts;
    _secondsRemaining = widget.timerCount;

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_secondsRemaining != 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _enableResend = true;
        });
      }
    });
  }

  String textForButton(int time) {
    if (time == 0) {
      return widget.text;
    }
    return '${widget.text} ($time secs)';
  }

  onPressed() {
    if (_maxAttempts == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(ErrorMessages.exceededAttempts)),
      );
      return;
    }
    setState(() {
      _secondsRemaining = _timerCount;
      _enableResend = false;
      _maxAttempts -= 1;
    });
    widget.onPressed();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      text: textForButton(_secondsRemaining),
      onPressed: _enableResend && widget.enabledFromParent ? onPressed : null,
    );
  }
}
