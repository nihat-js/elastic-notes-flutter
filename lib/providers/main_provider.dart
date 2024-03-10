import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier {
   final _gameData = {
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
  int bottomNavIndex = 0;
  

  Map get gameData => _gameData;


  int missionPlaceIndex = 0;

  void setBottomNavIndex(int index){
    gameData["index"] = index;
    notifyListeners();
  }

  void travelMissionPlace(String type) {
    // debugPrint("Traveling");
      // type == "left" ?  mainProvider.missionPlaceIndex-- : mainProvider.missionPlaceIndex++;
      // if (mainProvider.missionPlaceIndex >= missionPlaces.length) {
      //   mainProvider.missionPlaceIndex = missionPlaces.length - 1;
      // }
      // if (mainProvider.missionPlaceIndex < 0) {
      //   mainProvider.missionPlaceIndex = 0;
      // }
  }

  void startTimedMission() {}



}