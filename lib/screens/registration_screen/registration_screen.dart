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
      backgroundColor: Colors.greenAccent.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100,),
          Image.network("https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg",
            height: 100,width: 200,fit: BoxFit.contain,),
          Center(
            child: Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.email),
                onPressed: () {
                  Provider.of<GoogleSignInProvider>(context, listen: false)
                      .googleLogIn(context, const HomePage());
                },
                label: const Text("Sign In with Google"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade400,
                  fixedSize: const Size(330, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
