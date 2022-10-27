import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/header_spacer.widget.dart';

import '../../widgets/body.widget.dart';
import '../../widgets/text.widget.dart';
import '../../constants/strings.constant.dart';
import '../../routes/route.constant.dart';
import '../../widgets/login_with_google_button.widget.dart';
import '../../widgets/primary_button.widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void onLoginWithMobile() {
    Navigator.pushNamed(context, Routes.loginWithMobile);
  }

  void onLoginWithGoogle() {
    debugPrint('login with mobile.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Body(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const HeaderSpacer(),
              const H1Text(StringConstants.appName),
              SvgPicture.asset(
                'assets/images/login_banner.svg',
                height: 400,
                fit: BoxFit.scaleDown,
                // color: Theme.of(context).colorScheme.primary,
              ),
              const Spacer(flex: 1),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  text: StringConstants.loginWithMobile,
                  onPressed: onLoginWithMobile,
                ),
              ),
              const WidgetSpacer(type: WidgetSpacerType.small),
              SizedBox(
                width: double.infinity,
                child:
                    LoginWithGoogleButton(onLoginWithGoogle: onLoginWithGoogle),
              ),
              const Spacer(flex: 3)
            ],
          ),
        ),
      ),
    );
  }
}
