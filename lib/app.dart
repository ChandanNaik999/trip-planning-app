import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'screens/filters/filters.dart';
import 'screens/login/enter_otp.dart';
import 'screens/login/login_with_mobile.dart';
import 'screens/trip_viewer/trip_viewer.dart';

import 'constants/strings.constant.dart';
import 'routes/route.constant.dart';
import 'screens/enter_your_details/enter_your_details.dart';
import 'screens/home/home.dart';
import 'screens/login/login.dart';
import 'screens/splash/splash.dart';
import 'themes/light.theme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  _fetchRoutes() {
    return {
      Routes.splash: (context) => const Splash(),
      Routes.login: (context) => const Login(),
      Routes.loginWithMobile: (context) => const LoginWithMobile(),
      Routes.enterOtp: (context) => const EnterOtp(),
      Routes.enterYourDetails: (context) => const EnterYourDetails(),
      Routes.home: (context) => const Home(),
      Routes.tripViewer: (context) => const TripViewer(),
      Routes.filters: (context) => const Filters(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayOpacity: 0.3,
      overlayColor: Colors.black26,
      overlayWidget: const Center(
          child: SpinKitThreeBounce(
            size: 35.0,
            color: LightPalette.primary,
            duration: Duration(milliseconds: 700),
          ),
        ),
      child: MaterialApp(
        title: StringConstants.appName,
        theme: LightTheme.getTheme(),
        initialRoute: Routes.splash,
        routes: _fetchRoutes(),
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: FormBuilderLocalizations.delegate.supportedLocales,
      ),
    );
  }
}
