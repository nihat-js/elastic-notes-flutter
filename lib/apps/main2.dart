import 'dart:developer';

import "package:flutter/material.dart";
import 'package:flutter_march/pages/new_post.dart';
import 'package:flutter_march/pages/auth_page.dart';
import 'package:flutter_march/pages/entry_page.dart';
import "package:flutter_march/pages/profile/profile_page.dart";
import 'package:firebase_core/firebase_core.dart';
import '../configs/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// import 'package:mysql1/mysql1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(App());
  
}


class App extends StatelessWidget {

  const App({super.key});


  @override
  Widget build(BuildContext context) {
    

    return MaterialApp(
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for connection to Firebase, display a loading indicator
              return Center(child: CircularProgressIndicator());
            } else {
              // If user is logged in, navigate to the home page
              if (snapshot.hasData) {
                return AuthPage();
              } else {
                // If user is not logged in, navigate to the login page
                return AuthPage();
              }
            }
          },
        ),      
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        "/entry" : (context) => EntryPage(),
        "/auth" : (context) => AuthPage(),
        "/add-post" : (context) => NewPostPage(),
        "/profile" : (context) => ProfilePage(),

      },
    );
  }
}

