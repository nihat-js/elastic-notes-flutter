import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_march/components/button.dart';

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

  login(email, password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.of(context).pushNamedAndRemoveUntil("/entry", (_) => false);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Firebase Error'),
            content: Text(e.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    // print('User ${} logged in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Authentication'),
        ),
        body: Stack(
          children: [
            Image.asset(
            'images/bg-6.jpg',
            fit: BoxFit.fitWidth,
            width: double.infinity,
            height: double.infinity,
          ),
          _showLogin
              ? LoginComponent(toggleView: _toggleView, login: login)
              : RegisterComponent(toggleView: _toggleView),  
          ],
          
        ));
  }
}

// LoginComponent.dart

class LoginComponent extends StatelessWidget {
  final VoidCallback toggleView;
  final Function login;

  LoginComponent({super.key, required this.toggleView, required this.login});

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        width:  MediaQuery.of(context).size.width/2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your login component UI here
            const Text('Login Component'),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => _email = value.toString(),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) => _password = value,
            ),
            const SizedBox(height: 20),
            HydraButton(
              onPressed: () => login(_email, _password),
              text:'Login',
            ),
            const SizedBox(height: 20),
            const Text("If you don't have an account, please register."),
            TextButton(
              onPressed: toggleView,
              child: const Text('Register'),
            ),
          ],
        ),
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
    return Container(
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
