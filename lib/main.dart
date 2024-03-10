import 'package:flutter/material.dart';
import 'package:flutter_march/providers/main_provider.dart';
import 'package:flutter_march/screens/arena_screen.dart';
import 'package:flutter_march/screens/mission_screen.dart';
import 'package:flutter_march/screens/profile_screen.dart';
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

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Ev'),
          NavigationDestination(
              icon: Icon(Icons.real_estate_agent), label: 'Mülklərim'),
          NavigationDestination(icon: Icon(Icons.warehouse), label: 'Arena'),
          NavigationDestination(
              icon: Icon(Icons.real_estate_agent), label: 'Yan misyalar'),
          NavigationDestination(icon: Icon(Icons.terrain), label: 'Klan')
        ],
        onDestinationSelected: (int index) {
          // debugPrint("i am selected " + index.toString());
          mainProvider.setBottomNavIndex(index);
          if (index == 3) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("mission", (route) => false);
          } else if (index == 2) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("mission", (route) => false);
          }
        },
        selectedIndex: mainProvider.bottomNavIndex,
      ),
      body: ArenaScreen(),
    );
  }
}
