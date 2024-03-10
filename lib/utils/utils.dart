import 'dart:math';

import 'package:flutter_march/data/index.dart';

double generateRandomMoney(double min, double max, double chance) {
  double foo = (min + (max - min) * chance);
  return double.parse(foo.toStringAsFixed(2));
}

void refreshMissionInPlace() {
  var random = new Random();
  var mission1 = {
    "type": "fight",
    "time": 2 + random.nextInt(4),
    "xp": 5,
    "coin": 12,
    "difficulty": MissionDifficulty
        .values[random.nextInt(MissionDifficulty.values.length)],
  };
  var mission2 = {
    "type": "fight",
    "time": 2 + random.nextInt(4),
    "xp": 5,
    "coin": 12,
    "difficulty": MissionDifficulty
        .values[random.nextInt(MissionDifficulty.values.length)],
  };
  var mission3 = {
    "type": "time",
    "time": 2 + random.nextInt(4),
    "xp": 5,
    "coin": 12,
    "difficulty": MissionDifficulty.values[random.nextInt(MissionDifficulty.values.length)],
  };
}



// double calculateDamage(Map userSkills, Map enemySkills){

// }

// logs = 


// int main(){
//   while(true){

//   }
// }