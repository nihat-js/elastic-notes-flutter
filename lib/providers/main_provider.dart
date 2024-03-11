import 'package:flutter/material.dart';
import 'package:flutter_march/data/index.dart';
import "dart:math";
import 'package:uuid/uuid.dart';

class MainProvider with ChangeNotifier {
  final _gameData = {
    "baseSkills": {
      Skill.stamina: 13,
      Skill.strength: 12,
      Skill.luck: 16,
      Skill.dexterity: 15,
    },
    "baseBoughtSkills": {
      Skill.stamina: 0,
      Skill.strength: 18,
      Skill.luck: 11,
      Skill.dexterity: 20,
    },
    "missions": {
      // MissionPlace.genclik: [
      //   {"time": 300, "difficulty": "hard", "character": "Teta", "text": "asda"}
      // ]
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

  void generateMissionsOfPlace(MissionPlace place) {
    Random random = Random();
    gameData["missions"][place] = [
      {
        "id": Uuid().v4(),
        "text": "Mission 1",
        "type": "timed",
        "xp": random.nextInt(100),
        "coin": random.nextInt(50),
      },
      {
        "id": Uuid().v4(),
        "text": "Mission 2",
        "npc": npcs[random.nextInt(npcs.length)],
        "type": "fight",
        "xp": random.nextInt(100),
        "coin": random.nextInt(50),
      },
      {
        "id": Uuid().v4(),
        "text": "Mission 3",
        "npc": npcs[random.nextInt(npcs.length)],
        "type": "fight",
        "xp": random.nextInt(100),
        "coin": random.nextInt(50),
      },
    ];

    print("geldik bura ki");
    print(gameData["missions"][place]);
  }

  Object? getMissionsOfPlace(MissionPlace place) {
    // print("x0x");
    // print(place);
    if (gameData["missions"][place] == null){
      generateMissionsOfPlace(place);
    }
    return gameData["missions"][place];
  }

  var x = {"a": "A"};
  // return x ;
  // return gameData["missions"][place] ;
}

void startTimedMission() {}
