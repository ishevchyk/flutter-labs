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
    setState(() => {loggedIn = !loggedIn});
  }

  void onLogout() {
    // this.firstname = '';
    // this.lastname = '';
    nameInputController.text = '';
    lastnameInputController.text = '';
    setState(() => {loggedIn = !loggedIn});
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.yellow,
          body: Container(
            alignment: Alignment.center,
            child: !loggedIn
                ? Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: TextField(
                            controller: nameInputController,
                            decoration: InputDecoration(
                              hintText: 'Firstname',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: TextField(
                            controller: lastnameInputController,
                            decoration: InputDecoration(
                              hintText: 'Lastname',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(120, 40)),
                              onPressed: () => onLogin(nameInputController.text,
                                  lastnameInputController.text),
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Container(
                    margin: EdgeInsets.only(top: 150.0),
                    child: Column(
                      children: [
                        Text(
                          'Welcome $firstname $lastname !',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: ElevatedButton(
                              onPressed: onLogout, child: Text('Log out')),
                        ),
                      ],
                    ),
                  )),
          )
          //
          ),
    );
  }
}
