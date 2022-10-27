import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/error_messages.constant.dart';
import '../constants/strings.constant.dart';

class LoginWithGoogleButton extends StatefulWidget {
  final VoidCallback onLoginWithGoogle;

  const LoginWithGoogleButton({Key? key, required this.onLoginWithGoogle})
      : super(key: key);

  @override
  LoginWithGoogleButtonState createState() => LoginWithGoogleButtonState();
}

class LoginWithGoogleButtonState extends State<LoginWithGoogleButton> {
  GoogleSignInAccount? _currentUser;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  void signInWithGoogle() async {
    try {
      _currentUser = await _googleSignIn.signIn();
      var accessToken = (await _currentUser?.authentication)?.accessToken;
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(ErrorMessages.allowSignInWithGoogle),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        onPressed: () async {
          signInWithGoogle();
          widget.onLoginWithGoogle();
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  StringConstants.loginWithGoogle,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
