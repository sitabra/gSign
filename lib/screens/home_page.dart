import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_set/screens/registration_screen/registration_screen.dart';
import 'package:provider/provider.dart';
import '../api_service/api_service.dart';
import '../model/user_model.dart';
import '../provider/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshotd) {
        return Scaffold(
          drawer: Drawer(
              elevation: 5,
              width: 200,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                    title: Row(
                      children: const [
                        Icon(Icons.person),
                        Text('Item 1'),
                      ],
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: const [
                        Icon(Icons.help),
                        Text('Item 1'),
                      ],
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: const [
                        Icon(Icons.group),
                        Text('Item 1'),
                      ],
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Row(
                      children: const [
                        Icon(Icons.share),
                        Text('Item 1'),
                      ],
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              )),
          appBar: AppBar(
            title: const Text('Menu Drawer'),
            backgroundColor: Colors.green,
            actions: [
              IconButton(
                  icon: const Icon(
                    CupertinoIcons.power,
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    Provider.of<GoogleSignInProvider>(context, listen: false)
                        .googleSignOut(context, const RegistrationScreen());
                  }),
            ],
          ),
          body: FutureBuilder(
              future: ApiService().getDetails(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Error"));
                } else {
                  Users myUser = snapshot.data;
                  return ListView.builder(
                      itemCount: myUser.data!.length,
                      itemBuilder: (context, index) {
                        Data myData = myUser.data![index];
                        return SizedBox(
                            height: 30,
                            child: Row(
                              children: [
                                Text(myData.firstName.toString()),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(myData.lastName.toString()),
                              ],
                            ));
                      });
                }
              }),
        );
      },
    );
  }
}
