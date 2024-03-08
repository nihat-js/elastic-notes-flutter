import 'dart:async';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _remainingTime = 60; // Initial remaining time (in seconds)
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer when the screen is initialized
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          // Time's up, handle game over logic here
          timer.cancel(); // Stop the timer
        }
      });
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the screen is disposed to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: Column(
        children: [
          // Timer display at the top right corner
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(16),
            child: Text(
              'Time: $_remainingTime seconds',
              style: TextStyle(fontSize: 18),
            ),
          ),
          // Question display in the middle
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What is the capital of France?',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  // Answers
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Paris'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Rome'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Berlin'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Madrid'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
