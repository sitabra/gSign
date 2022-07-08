import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:practice_set/provider/google_sign_in.dart';
import 'package:practice_set/screens/home_page.dart';
import 'package:practice_set/screens/welcome_page/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main()  async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WelcomePage(),
      ),
    );
  }
}
