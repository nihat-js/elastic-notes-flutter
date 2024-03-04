import "dart:developer";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_march/pages/add_post.dart";
import "package:flutter_march/pages/home_page.dart";
import "package:flutter_march/pages/profile_page.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter_march/pages/settings_page.dart";

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _MainState();
}

class _MainState extends State<EntryPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var pages = [
      HomePage(),
      HomePage(),
      HomePage(),
      const ProfilePage(),
      SettingsPage()
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Project"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NewPostPage())
          )
        },
        child: const Icon(Icons.add),
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.search_rounded), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.inbox), label: 'Messages'),
          NavigationDestination(
              icon: Icon(Icons.account_circle_sharp), label: 'Profile'),
          NavigationDestination(
              icon: Icon(Icons.settings), label: 'Settings')
        ],
        onDestinationSelected: (int index) {
          debugPrint("i am selected " + index.toString());
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
