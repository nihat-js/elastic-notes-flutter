import "package:flutter/material.dart";
import 'package:flutter_march/pages/auth_page.dart';
import 'package:flutter_march/pages/entry_page.dart';
import "package:flutter_march/pages/home_page.dart";
import "package:flutter_march/pages/profile_page.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'configs/firebase_options.dart';
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
      home:  const EntryPage() ,
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        primarySwatch: Colors.green,
      ),
      // routes: {
        // 'home' : (context) => HomePage(),
        // '/auth' : (context) => AuthPage(),
      // },
    );
  }
}

