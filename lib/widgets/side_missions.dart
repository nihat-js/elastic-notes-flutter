import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SideMissions extends StatefulWidget {
  var setGameData;
  var gameData;
  SideMissions({super.key});

  @override
  State<SideMissions> createState() => _SideMissionsState();
}

class _SideMissionsState extends State<SideMissions> {
  bool isInMission = false;
  bool isInSideMission = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          if (isInSideMission)
            TweenAnimationBuilder<Duration>(
                duration: Duration(seconds: 5),
                tween: Tween(begin: Duration(seconds: 5), end: Duration.zero),
                onEnd: () {
                  debugPrint('Timer ended');
                },
                builder: (BuildContext context, Duration value, Widget? child) {
                  final minutes = value.inMinutes;
                  final seconds = value.inSeconds % 60;
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text('$minutes:$seconds',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)));
                })
          // else

        ],
      ),
    ]);
  }
}


// ElevatedButton(
//         onPressed: isInSideMission
//             ? null
//             : () {
//                 setState(() {
//                   isInSideMission = true;
//                 });
//                 Future.delayed(Duration(seconds: 5), () {
//                   setState(() {
//                     isInSideMission = false;
//                   });
//                   widget.gameData["cashMoney"] += 10;
//                   widget.setGameData({"a": "b"});
//                   // widget.setGameData({"cashMoney" :  (widget.gameData["cashMoney"] as double) +10});
//                 });
//               },
//       ),