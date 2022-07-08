import 'package:flutter/material.dart';
import 'package:practice_set/provider/google_sign_in.dart';
import 'package:practice_set/screens/home_page.dart';
import 'package:practice_set/screens/welcome_page/welcome_page.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: ElevatedButton.icon(
            icon: const Icon(Icons.email),
            onPressed: () {
              Provider.of<GoogleSignInProvider>(context, listen: false).googleLogIn(context, const HomePage());
            },
            label: const Text("Sign In with Google"),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              fixedSize: const Size(330, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
