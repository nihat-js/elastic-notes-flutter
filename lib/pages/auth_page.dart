import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _showLogin = true;

  void _toggleView() {
    setState(() {
      _showLogin = !_showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: _showLogin
          ? LoginComponent(toggleView: _toggleView)
          : RegisterComponent(toggleView: _toggleView),
    );
  }
}

// LoginComponent.dart

class LoginComponent extends StatelessWidget {
  final VoidCallback toggleView;

   LoginComponent({super.key, required this.toggleView});

   String _email = "";
   String _password = "";

  login() async {
    debugPrint("line456...." + _email + " " + _password);
    FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // print('User ${userCredential.refreshToken} logged in');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Add your login component UI here
          const Text('Login Component'),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            onChanged: (value) => _email = value.toString(),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            onChanged: (value) => _password = value,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: login,
            child: const Text('Login'),
          ),
          const SizedBox(height: 20),
          const Text("If you don't have an account, please register."),
          TextButton(
            onPressed: toggleView,
            child: Text('Register'),
          ),
        ],
      ),
    );
  }
}

class RegisterComponent extends StatelessWidget {
  final toggleView;

   RegisterComponent({super.key, required this.toggleView});
  late String _username;
  late String _email;
  late String _password;



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Add your register component UI here
          const Text('Register Component'),
          TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              onSaved: (value) => _username = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                // Add email validation logic if needed
                return null;
              },
              onSaved: (value) => _email = value!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                // Add password validation logic if needed
                return null;
              },
              onSaved: (value) => _password = value!,
            ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement register logic
            },
            child: Text('Register'),
          ),
          const SizedBox(height: 20),
          const Text("If you already have an account, please login."),
          TextButton(
            onPressed: toggleView,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
