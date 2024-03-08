import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "dart:math";
import 'package:flutter/widgets.dart';
import 'package:flutter_march/utils/utils.dart';
import "package:circular_countdown_timer/circular_countdown_timer.dart";
import 'package:flutter_march/widgets/side_missions.dart';

const String gameName = "Baki life Simulator";
void main() {
  runApp(LifeSimulatorApp());
}

class LifeSimulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: gameName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LifeSimulatorScreen(),
    );
  }
}

class LifeSimulatorScreen extends StatefulWidget {
  @override
  State<LifeSimulatorScreen> createState() => _LifeSimulatorScreenState();
}

class _LifeSimulatorScreenState extends State<LifeSimulatorScreen> {
  var gameData = {
    "name": "Nihat",
    "age": 22,
    "occupation": "",
    "bottomNavIndex": 0,
    "cashMoney": 35,
    "cardMoney": 8,
    "isMarried": false,
    "logs": [
      {
        "isTitle": false,
        "text": "18 Yaşın var və gənclikdə yaşayırsan. Kredit borcun yoxdu"
      }
    ],
    "isInTimeMission": false,
  };

  int missionPlaceIndex = 0;

  void setGameData(Map data) {
    setState(() {
      gameData = {...gameData,...data};
    });
  }

  void travelMissionPlace(String type) {
    // debugPrint("Traveling");
    setState(() {
      type == "left" ? missionPlaceIndex-- : missionPlaceIndex++;
      if (missionPlaceIndex >= missionPlaces.length) {
        missionPlaceIndex = missionPlaces.length - 1;
      }
      if (missionPlaceIndex < 0) {
        missionPlaceIndex = 0;
      }
    });
  }

  void startTimedMission() {}

  void startMissionDialog() {
    debugPrint("starting mission");
    showDialog(
        context: context,
        builder: ((BuildContext context2) {
          return AlertDialog(
            title: Text('Start  mission'),
            content: Text('This is the content of the dialog.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context2).pop();
                },
                child: Text('Close'),
              ),
              TextButton(
                onPressed: () {
                  debugPrint("ok");
                  Navigator.of(context2).pop();
                  Future.delayed(const Duration(seconds: 3), () {
                    gameData["isInTimeMission"] = false;
                    gameData["cashMoney"] = (gameData["cashMoney"] as int) + 10;
                    setState(() => {});
                    showDialog(
                      context: context,
                      builder: (context_) {
                        return AlertDialog(
                            title: Text("You earned 10 AZN "),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context_).pop();
                                },
                                child: Text('Close'),
                              ),
                            ]);
                      },
                    );
                  });
                  setState(() {
                    gameData["isInTimeMission"] = true;
                  });
                },
                child: Text('Start'),
              ),
            ],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(gameName),
        backgroundColor: const Color.fromRGBO(255, 165, 0, 1),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Ev'),
          NavigationDestination(
              icon: Icon(Icons.real_estate_agent), label: 'Mülklərim'),
          NavigationDestination(
              icon: Icon(Icons.real_estate_agent), label: 'Yan misyalar'),
        ],
        onDestinationSelected: (int index) {
          // debugPrint("i am selected " + index.toString());
          setGameData({
            "bottomNavIndex": index,
          });
        },
        selectedIndex: gameData["bottomNavIndex"] as int ?? 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // const Icon(Icons.monetization_on),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                        // color: Colors.red,
                        // width: 1.0,
                        ),
                    gradient: LinearGradient(
                      colors: [Colors.yellow, Color(0xffad9c00)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text('AZN ${gameData["cashMoney"]}',
                      style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 5),

                const SizedBox(width: 20),
                const Icon(Icons.credit_card),
                const SizedBox(width: 5),
                Text('\AZN ${gameData["cardMoney"]}',
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          SideMissions(setGameData :setGameData, gameData : gameData),
          Expanded(
            child: Stack(fit: StackFit.expand, children: [
              // Background image
              Image.asset(
                missionPlaceBackgrounds[missionPlaceIndex],
                fit: BoxFit.fitHeight,
              ),
              LayoutBuilder(builder: (context, constraints) {
                return Stack(children: [
                  Positioned(
                    left: 16,
                    top: constraints.maxHeight * .5 - 24,
                    child: GestureDetector(
                      onTap: () => travelMissionPlace("left"),
                      child: Icon(
                        Icons.arrow_back,
                        size: 48,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    bottom: constraints.maxHeight * .5 - 24,
                    child: GestureDetector(
                      onTap: () => travelMissionPlace("right"),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 48,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  // Right arrow

                  if (gameData["isInTimeMission"] == false)
                    EarnMoneyItem(
                      constraints: constraints,
                      callback: startMissionDialog,
                    )
                  else
                    LinearProgressIndicator(),
                ]);
              }),

              // Rounded image icons
              // Left arrow
            ]),
          )
        ],
      ),
    );
  }
}

class Mission extends StatelessWidget {
  const Mission({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class EarnMoneyItem extends StatelessWidget {
  var callback;
  var constraints;
  EarnMoneyItem({super.key, required this.callback, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 40,
        top: constraints.maxHeight * .3,
        child: GestureDetector(
            onTap: callback, child: Image.asset("images/icons/rocket.png")));
  }
}
