import 'package:first_app/home.dart';
import 'package:first_app/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var loggedIn = false;
  String firstname;
  String lastname;

  onLogin(String firstname, String lastname) {
    this.firstname = firstname;
    this.lastname = lastname;
    setState(() {
      loggedIn = !loggedIn;
    });
  }

  void onLogout() {
    nameInputController.text = '';
    lastnameInputController.text = '';
    setState(() {
      loggedIn = !loggedIn;
      firstname = '';
      lastname = '';
    });
  }

  TextEditingController nameInputController = TextEditingController();
  TextEditingController lastnameInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameInputController.text = '';
    lastnameInputController.text = '';

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Lab 1 Flutter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.yellow,
          body: Container(
            alignment: Alignment.center,
            child: !loggedIn
                ? Login(nameInputController, lastnameInputController, onLogin)
                : Home(firstname, lastname, onLogout),
          )
          //
          ),
    );
  }
}
