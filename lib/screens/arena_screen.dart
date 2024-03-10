import 'package:flutter/material.dart';
import 'package:flutter_march/widgets/user_stats.dart';

class ArenaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/arena/background-1.jpg'), // Replace with your background image
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EnemyProfile(),
              SizedBox(height: 20),
              EnemyProfile(),
            ],
          )
        ],
      ),
    );
  }
}

class EnemyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          // color: Colors.white.withOpacity(0.8),
          // borderRadius: BorderRadius.circular(10),
          ),
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                // Replace with enemy profile picture
                backgroundImage: AssetImage('images/icons/profile.png'),
              ),
              SizedBox(height: 10),
              Text(
                'Enemy Name', // Replace with enemy name
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              UserStats(stamina: 120, strength: 30, luck: 180, dexterity: 240),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SkillButton(skillName: 'Skill 1'),
                  SkillButton(skillName: 'Skill 2'),
                  SkillButton(skillName: 'Skill 3'),
                  SkillButton(skillName: 'Skill 4'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillButton extends StatelessWidget {
  final String skillName;

  SkillButton({required this.skillName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Implement skill functionality
      },
      child: Text(skillName),
    );
  }
}
