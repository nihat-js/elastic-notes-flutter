import 'package:flutter/material.dart';
import 'package:flutter_march/data/index.dart';

class MainProvider with ChangeNotifier {
  final _gameData = {
    "skills": {
      Skill.stamina: 15,
      Skill.strength: 18,
      Skill.luck: 11,
      Skill.dexterity: 20,
    },
    "skillsCountWithCoin": {
      Skill.stamina: 0,
      Skill.strength: 18,
      Skill.luck: 11,
      Skill.dexterity: 20,
    },
    "missions": {
      MissionPlace.genclik: [
        {"time": 300, "difficulty": "hard", "character": "Teta", "text": "asda"}
      ]
    },
    "level": 22,
    "total_xp": 42230,
    "current_xp": 120,
    "nickname": "Nihat",
    "clan": "",
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

  Map get gameData => _gameData;

  int missionPlaceIndex = 0;

  void setBottomNavIndex(int index) {
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
