import 'package:flutter/material.dart';
import "dart:math";

class YesilvadiActions extends StatelessWidget {
  var setState ;
   YesilvadiActions({super.key, required this.setState });

  void begMoney() {
    Random random = Random();
    double chancePercentage = random.nextDouble();

    double earnedMoney = generateRandomMoney(.2, 1, chancePercentage);
    List templates = [];
    if (chancePercentage < .40) {
      templates.add("Gör nə gündəsən pul vermədilər");
      templates.add("Hahaha şansını bir də yoxla");
      earnedMoney = 0;
    } else if (chancePercentage < .60) {
      templates.add("Yoxa nəhlət $earnedMoney gəldi");
    } else if (chancePercentage < .80) {
      templates.add("Stuçnu pulu çıxdı $earnedMoney gəldi");
    } else {
      templates.add("Partlayış $earnedMoney tutdun ");
    }

  }
  
  void stealMoney(){
    
  }


    setState(() {
      
      cashMoney += earnedMoney;
      logs.add({"text": templates[random.nextInt(templates.length)]});
    });
  }

  void stealMoney() {

  @override
  Widget build(BuildContext context) {
    return const Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: begMoney,
                  child: Text('Pul dilen (  20 Qepik - 1 Manat )'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: stealMoney,
                  child: Text(
                      'Cibə gir (+\10 Manat - 100 Manat) (Risk - 30% Polis)'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Add logic for "Do uber" action
                  },
                  child: Text('Do uber (Add your ideas)'),
                ),
                // Add more action buttons as needed
              ],
            ),
  }
}
}