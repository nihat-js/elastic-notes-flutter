import 'package:flutter/material.dart';
import 'package:flutter_march/data/index.dart';
import 'package:flutter_march/providers/main_provider.dart';
import 'package:flutter_march/widgets/status_bar/index.dart';
import 'package:flutter_march/widgets/user_stats.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainProvider>(context);
    return Container(
      child: Column(
        children: [
          StatusBar(),
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                // Replace with enemy profile picture
                // backgroundImage: AssetImage('images/icons/profile.png'),
                backgroundImage: Image.asset("assets/images/icons/profile.png").image,
              ),
              Container(
                // padding: EdgeInsets.all(20),
                // decoration: BoxDecoration(
                //   color: Colors.grey[200],
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        UserStat(
                            statName: Skill.stamina,
                            statValue: provider.gameData["baseSkills"][Skill.stamina]),
                        PlusOneButton(
                          skill: Skill.stamina,
                        ),
                      ],
                    ),
                    Row(children: [
                      UserStat(
                          statName: Skill.strength,
                          statValue: provider.gameData["baseSkills"]
                              [Skill.strength]),
                      PlusOneButton(skill: Skill.strength),
                    ]),
                    Row(children: [
                      UserStat(
                          statName: Skill.luck,
                          statValue: provider.gameData["baseSkills"][Skill.luck]),
                      PlusOneButton(
                        skill: Skill.luck,
                      ),
                    ]),
                    Row(
                      children: [
                        UserStat(
                            statName: Skill.dexterity,
                            statValue: provider.gameData["baseSkills"]
                                [Skill.dexterity]),
                        PlusOneButton(skill: Skill.dexterity),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PlusOneButton extends StatelessWidget {
  final Skill skill;
  const PlusOneButton({super.key, required Skill this.skill});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final mainProvider = Provider.of<MainProvider>(context,listen: false);
        mainProvider.gameData["baseSkills"][skill] += 1;
        print( mainProvider.gameData["baseSkills"][skill]);
        mainProvider.notifyListeners();
        // Add your onPressed logic here
      },
      child: SizedBox(
          width: 16,
          height: 16,
          child: Image.asset("assets/images/icons/btn-plus.png")),
    );
  }
}
