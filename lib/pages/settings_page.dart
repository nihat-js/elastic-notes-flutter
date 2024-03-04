import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";


class SettingsPage extends StatefulWidget {
  @override
  State createState() => _SettingsPageState();

}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkModeEnabled = false;
  int _fontSize = 16;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState(){
    super.initState();
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    User? user = _auth.currentUser;
    setState(() {
      _user = user;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _darkModeEnabled,
              onChanged: (bool value) {
                setState(() {
                  _darkModeEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            const Text('Font Size'),
            Slider(
              value: _fontSize.toDouble(),
              min: 12,
              max: 24,
              divisions: 12,
              onChanged: (double value) {
                setState(() {
                  _fontSize = value.toInt();
                });
              },
            ),
             Text(_user == null
            ? 'User is not authenticated'
            : 'User is authenticated: ${_user!.displayName ?? "No name"}'),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Save settings or perform any other actions
              },
              child: const Text('Save Settings'),
            ),
          ],
        ),
      ),
    );
  }
}