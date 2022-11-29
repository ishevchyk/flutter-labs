import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String firstname;
  final String lastname;
  final VoidCallback logout;

  const Home(this.firstname, this.lastname, this.logout);

  @override
  Widget build(BuildContext context) {
    return Center(
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
            child: ElevatedButton(onPressed: logout, child: Text('Log out')),
          ),
        ],
      ),
    ));
  }
}
