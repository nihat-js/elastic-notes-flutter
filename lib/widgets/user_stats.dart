import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_march/data/index.dart';

class UserStats extends StatelessWidget {
  final int stamina;
  final int strength;
  final int luck;
  final int dexterity;

  const UserStats({
    required this.stamina,
    required this.strength,
    required this.luck,
    required this.dexterity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserStat(statName: Skill.stamina, statValue: stamina),
          UserStat(statName: Skill.strength, statValue: strength),
          UserStat(statName: Skill.luck, statValue: luck),
          UserStat(statName: Skill.dexterity, statValue: dexterity),
        ],
      ),
    );
  }
}

class UserStat extends StatelessWidget {
  final Skill statName;
  final int statValue;
  // final Color  barColor;
  // final int maxValue;

  UserStat({required this.statName, required this.statValue});

  List<Map> limits = [
    {
      "value": 0,
      "color": Colors.purple[100],
    },
    {
      "value": 20,
      "color": Colors.purple[400],
    },
    {
      "value": 40,
      "color": Colors.purple[600],
    },
    {
      "value": 60,
      "color": Colors.blue[500],
    },
    {
      "value": 80,
      "color": Colors.purple[500],
    },
  ];

  @override
  Widget build(BuildContext context) {
    Color barColor = Colors.green;
    int maxStatValue = 10; // defau
    int minStatValue = 10;
    for (int i = 0; i < limits.length; i++) {
      if (statValue > limits[i]["value"]) {
        barColor = limits[i]["color"];
        minStatValue = limits[i]["value"];
        maxStatValue = limits[i + 1 < limits.length ? i + 1 : i]["value"];
        // print("ne isteyirsen ee"+maxStatValue.toString());
        // break;
      }
    }

    return Row(
      children: [
        Text(
          statName.toString() + ': ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 50,
          child: LinearProgressIndicator(
            value: 0.02 +
                (statValue - minStatValue) / (maxStatValue - minStatValue),
            // Normalize value to be between 0 and 1
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(barColor),
            minHeight: 8,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
        SizedBox(width: 10),
        Text('$statValue'),
      ],
    );
  }
}
