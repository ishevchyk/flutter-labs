import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final TextEditingController nameInput;
  final TextEditingController lastnameInput;
  final Function login;
  const Login(this.nameInput, this.lastnameInput, this.login);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: nameInput,
              decoration: InputDecoration(
                hintText: 'Firstname',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: lastnameInput,
              decoration: InputDecoration(
                hintText: 'Lastname',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(120, 40)),
                onPressed: () => login(nameInput.text, lastnameInput.text),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
