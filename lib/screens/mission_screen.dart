import 'package:flutter/material.dart';
import 'package:flutter_march/data/index.dart';
import 'package:flutter_march/main.dart';
import 'package:flutter_march/providers/main_provider.dart';
import 'package:flutter_march/widgets/status_bar/index.dart';
import 'package:provider/provider.dart';

class MissionScreen extends StatelessWidget {
  const MissionScreen({super.key});

   void startMissionDialog(context) {
    debugPrint("starting mission");
    showDialog(
        context: context,
        builder: ((BuildContext context2) {
            final mainProvider = Provider.of<MainProvider>(context);
            Map gameData = mainProvider.gameData;
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
                    mainProvider.notifyListeners();
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
                },
                child: Text('Start'),
              ),
            ],
          );
        }));
  }


  @override
  Widget build(BuildContext context) {
      final mainProvider = Provider.of<MainProvider>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StatusBar(),
          // SideMissions(),
          Expanded(
            child: Stack(fit: StackFit.expand, children: [
              // Background image
              Image.asset(
                missionPlaceBackgrounds[mainProvider.missionPlaceIndex  ],
                fit: BoxFit.fitHeight,
              ),
              LayoutBuilder(builder: (context, constraints) {
                return Stack(children: [
                  Positioned(
                    left: 16,
                    top: constraints.maxHeight * .5 - 24,
                    child: GestureDetector(
                      // onTap: () => travelMissionPlace("left"),
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
                      // onTap: () => travelMissionPlace("right"),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 48,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  // Right arrow

                  // if (mainProvider.gameData["isInTimeMission"] == false)
                    // EarnMoneyItem(
                      // constraints: constraints,
                      // callback: startMissionDialog,
                    // )
                  // else
                  //   LinearProgressIndicator(),
                ]);
              }),

              // Rounded image icons
              // Left arrow
            ]),
          )
        ],
      );
  }
}

// class EarnMoneyItem extends StatelessWidget {
//   var callback;
//   var constraints;
//   EarnMoneyItem({super.key, required this.callback, required this.constraints});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//         right: 40,
//         top: constraints.maxHeight * .3,
//         child: GestureDetector(
//             onTap: callback, child: Image.asset("images/icons/rocket.png")));
//   }
// }