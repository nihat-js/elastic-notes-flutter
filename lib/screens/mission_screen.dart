import 'package:flutter/material.dart';
import 'package:flutter_march/data/index.dart';
import 'package:flutter_march/main.dart';
import 'package:flutter_march/providers/main_provider.dart';
import 'package:flutter_march/widgets/status_bar/index.dart';
import 'package:provider/provider.dart';
import "dart:core";

class MissionScreen extends StatefulWidget {
  const MissionScreen({super.key});

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen> {
  int missionPlaceIndex = 0;

  void travelMissionPlace(String type) {
    // debugPrint("Traveling");ss
    if (type=="left" && missionPlaceIndex == 0) return ;
    if (type=="right" && missionPlaceIndex == missionPlaces.length -1 ) return ;

    type == "left" ? missionPlaceIndex-- : missionPlaceIndex++;
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // SideMissions(),
        Expanded(
            child: Stack(fit: StackFit.expand, children: [
          Image.asset(
            missionPlaces[missionPlaceIndex]['background'],
            fit: BoxFit.fitHeight,
          ),
          LayoutBuilder(builder: (context, constraints) {
            return Stack(children: [
              // Positioned(
              //   top : 10,
              //   left : 20,
              // width: double.infinity,
              // height: double.infinity,
              // child: StatusBar(),
              // )
              Positioned(
                left: 16,
                top: constraints.maxHeight * .5 - 24,
                child: GestureDetector(
                  onTap: () => travelMissionPlace("left"),
                  child: Opacity(
                    opacity: missionPlaceIndex == 0 ? .5 : 1,
                    child: Icon(
                      Icons.arrow_back,
                      size: 48,
                      color: Colors.purpleAccent,
                    ),
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
                    color: Colors.purple,
                  ),
                ),
              ),
              if (mainProvider.gameData["isInTimeMission"] == false)
                ...(mainProvider.getMissionsOfPlace(
                        missionPlaces[missionPlaceIndex]["name"]))
                    .asMap()
                    .entries
                    .map((entry) {
                  print("problem nedi ki");
                  print(entry);
                  return MissionButton(
                      missionIndex: entry.key,
                      mission : entry.value.item,
                      // missionId: entry.value.item["id"].toString(),
                      constraints: constraints,
                      );
                })
              // EarnMoneyItem(
              // constraints: constraints,
              // callback: startMissionDialog,
              // )
              // else
              // LinearProgressIndicator(),
            ]);
          }),

          // Rounded image icons
          // Left arrow
        ]))
      ],
    );
  }
}

void startMissionDialog(context,mission) {
  debugPrint("starting mission");
  showDialog(
      context: context,
      builder: ((BuildContext context2) {
        final mainProvider = Provider.of<MainProvider>(context);
        Map gameData = mainProvider.gameData;
        return AlertDialog(
          title: Text('Start  mission'),
          content: Text(   'This is the content of the dialog.'),
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
                  gameData["isInTimeMission"] = true;
                
              },
              child: Text('Start'),
            ),
          ],
        );
      }));
}

class MissionButton extends StatelessWidget {
  String? missionId;
  int missionIndex;
  var constraints;
  var mission;
  // var callback;

  MissionButton({
    super.key,
    required this.missionIndex,
    required this.constraints,
    required this.mission,
    // this.missionId,
    // this.callback
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: constraints.maxWidth / 3 * (missionIndex + 1),
        top: constraints.maxHeight * .3 + (missionIndex - 2).abs() * 20,
        child: GestureDetector(
            onTap: () { 
              startMissionDialog(context,mission);
              }, child: Image.asset("images/icons/rocket.png")));
  }
}

// class EarnMoneyItem extends StatelessWidget {
//   var callback;
//   var constraints;
//   EarnMoneyItem({super.key, required this.callback, required this.constraints});

//   @override
//   Widget build(BuildContext context) {
//    
// }
