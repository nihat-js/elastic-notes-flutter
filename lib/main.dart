import 'package:flutter/material.dart';
import 'package:flutter_march/providers/main_provider.dart';
import 'package:flutter_march/screens/arena_screen.dart';
import 'package:flutter_march/screens/mission_screen.dart';
import 'package:flutter_march/screens/profile_screen.dart';
import 'package:flutter_march/widgets/side_missions.dart';
import 'package:provider/provider.dart';

const String gameName = "Baki life Simulator";
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MainProvider(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  bool isLoggedIn = true;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: gameName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Game(),
      routes: {
        '/profile': (context) => ProfileScreen(),
        '/mission': (context) => MissionScreen(),
        '/arena': (context) => ArenaScreen(),
      },
    );
  }
}

class Game extends StatefulWidget {
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  int bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Ev'),
          NavigationDestination(
              icon: Icon(Icons.account_tree_sharp), label: 'Misiyalar'),
          NavigationDestination(icon: Icon(Icons.phone), label: 'Klan'),
          NavigationDestination(
              icon: Icon(Icons.real_estate_agent), label: 'Yan misyalar'),
          NavigationDestination(icon: Icon(Icons.terrain), label: 'Klan')
        ],
        onDestinationSelected: (int index) {
          // debugPrint("i am selected " + index.toString());
          mainProvider.setBottomNavIndex(index);
          bottomNavIndex = index;
          setState(() {});
        },
        selectedIndex: bottomNavIndex,
      ),
      body:  [ProfileScreen(),MissionScreen(), ArenaScreen()][bottomNavIndex],
    );
  }
}
