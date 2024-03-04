import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_march/pages/home_page.dart";
import "package:flutter_march/pages/profile_page.dart";
import 'package:cloud_firestore/cloud_firestore.dart';


class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _MainState();
}

class _MainState extends State<EntryPage> {
  int currentPage = 0;

  Widget activePage = HomePage();

  @override
  Widget build(BuildContext context) {
    switch (currentPage) {
      case 0: 
           HomePage(); 
          break;
      case 1 : 
           HomePage();
          break;
      case 2:
           HomePage(); 
          break;
      case 3:
        const ProfilePage();
        break;
    }


    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Project"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add),
      ),
      body: activePage,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.search_rounded), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.inbox), label: 'Messages'),
          NavigationDestination(
              icon: Icon(Icons.account_circle_sharp), label: 'Profile'),
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
