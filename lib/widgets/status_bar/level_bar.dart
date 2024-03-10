import 'package:flutter/material.dart';

void main() {
  runApp(LevelBar());
}

class LevelBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Column(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('images/icons/profile.png'),
              ),
              Text(
                'Level 10',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        Container(
          width: 150,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[300],
          ),
          child: Stack(
            children: [
              Container(
                width: 50,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 10,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
