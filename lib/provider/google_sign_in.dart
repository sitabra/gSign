import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class NavigatorRoute {
  void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }
}

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  void googleLogIn(BuildContext context, Widget widget)  {
    final googleUser = googleSignIn.signIn();
    googleUser.then((value) async {
      if (value == null) {
        _user = value;
      }
      else {
        NavigatorRoute().navigateTo(context, widget);
        var googleAuth = await value.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
      }
    });
    notifyListeners();
  }

  void googleSignOut(BuildContext context, Widget widget) {
    googleSignIn
        .signOut()
        .then((value) => [NavigatorRoute().navigateTo(context, widget)]);
  }
}
