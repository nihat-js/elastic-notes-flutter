import "package:flutter/material.dart";
import "package:flutter_march/providers/main_provider.dart";
import "package:flutter_march/widgets/status_bar/level_bar.dart";
import "package:flutter_march/widgets/status_bar/cash_bar.dart";
import "package:flutter_march/widgets/status_bar/second_cash_bar.dart";
import "package:provider/provider.dart";

class StatusBar extends StatelessWidget {
  const StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LevelBar(),
          Row( children: [CashBar(),SecondCashBar()], )
        ],
      ),
    );
  }
}

class Cash extends StatelessWidget {
  const Cash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

