import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final Function login;
  const Login(this.login, {super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final nameInput = TextEditingController();
  final lastnameInput = TextEditingController();

  void submitData() {
    final name = nameInput.text;
    final lastname = lastnameInput.text;
    if (name.isEmpty || lastname.isEmpty) {
      return;
    }
    widget.login(name, lastname);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: [
              TextField(
                controller: nameInput,
                onSubmitted: (_) => submitData,
                style: TextStyle(
                    letterSpacing: double.parse('2'),
                    color: Colors.yellow.shade800),
                decoration: InputDecoration(
                    labelText: 'Firstname',
                    labelStyle: TextStyle(color: Colors.blue)),
              ),
              TextField(
                controller: lastnameInput,
                onSubmitted: (_) => submitData,
                style: TextStyle(
                    letterSpacing: double.parse('2'),
                    color: Colors.yellow.shade800),
                decoration: InputDecoration(
                    labelText: 'Lastname',
                    labelStyle: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(120, 40)),
                onPressed: submitData,
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ],
      ),
      // ),
    );
  }
}
