import 'dart:async';

import 'package:flutter/material.dart';
import '../../constants/strings.constant.dart';

import '../../routes/route.constant.dart';
import '../../widgets/text.widget.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, Routes.login);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: H1Text(StringConstants.appName),
      ),
    );
  }
}
