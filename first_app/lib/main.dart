import 'package:first_app/home.dart';
import 'package:first_app/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 1 Flutter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var loggedIn = false;
  String _firstname = '';
  String _lastname = '';

  void _onLogin(String name, String lastname) {
    setState(() {
      loggedIn = !loggedIn;
      _firstname = name;
      _lastname = lastname;
    });
  }

  void _onLogout() {
    setState(() {
      loggedIn = !loggedIn;
      _firstname = '';
      _lastname = '';
    });
  }

  TextEditingController nameInputController = TextEditingController();
  TextEditingController lastnameInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Lab 1 Flutter',
            ),
          ),
          body: Container(
            color: Colors.yellow.shade300,
            alignment: Alignment.center,
            child: !loggedIn
                ? Login(_onLogin)
                : Home(_firstname, _lastname, _onLogout),
          )
          //
          ),
    );
  }
}
