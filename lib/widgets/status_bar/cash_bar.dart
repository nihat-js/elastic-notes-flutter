import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_march/providers/main_provider.dart';
import 'package:provider/provider.dart';

class CashBar extends StatelessWidget {
  const CashBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Container(
      // width: ,
      decoration: BoxDecoration(
        border: Border.all(
            // color: Colors.red,
            // width: 1.0,
            ),
        gradient: LinearGradient(
          colors: [Colors.yellow, Color(0xffad9c00)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Text('AZN ${mainProvider.gameData["cashMoney"]}',
          style: TextStyle(fontSize: 18)),
    );
  }
}
