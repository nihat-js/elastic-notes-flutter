import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_march/providers/main_provider.dart';
import 'package:provider/provider.dart';

class SecondCashBar extends StatelessWidget {
  const SecondCashBar({super.key});



  @override
  Widget build(BuildContext context) {
  final mainProvider = Provider.of<MainProvider>(context);
    return Row(children: [
      const Icon(Icons.credit_card),
      const SizedBox(width: 5),
      Text('\AZN ${mainProvider.gameData["cardMoney"]}',
          style: TextStyle(fontSize: 18)),
    ]);
  }
}
