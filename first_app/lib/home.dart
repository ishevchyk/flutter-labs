import 'package:flutter/material.dart';

import 'schedule.dart';

class Home extends StatefulWidget {
  final String firstname;
  final String lastname;
  final VoidCallback logout;

  const Home(this.firstname, this.lastname, this.logout);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String groupVal = 'KB-45';
  late List<Map<int, String>> groupSchedule = schedule[groupVal]!;
  List groups = [
    'KB-45',
    'KB-46',
    'KB-47',
    'KB-48',
  ];
  List days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

  onSchedulePerDay(index) {
    List arr = [];
    groupSchedule[index].forEach((key, value) {
      arr.add(''
          '${key.toString()}: $value');
    });
    return arr;
  }

  onGroupSelect(String chosenGroup) {
    setState(() {
      groupVal = chosenGroup;
      groupSchedule = schedule[groupVal]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6),
        child: Text(
          'Welcome ${widget.firstname} ${widget.lastname} !',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.yellow.shade800,
          ),
        ),
      ),
      Container(
        child: DropdownButton(
          value: groupVal,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.blue,
          ),
          dropdownColor: Colors.yellow.shade200,
          style: TextStyle(color: Colors.blue),
          items: groups.map((gr) {
            return DropdownMenuItem(
              value: gr,
              child: Text(gr),
            );
          }).toList(),
          onChanged: (value) {
            onGroupSelect(value as String);
          },
        ),
      ),
      // Column(children: [
      Container(
        height: 600,
        width: double.infinity,
        child: ListView.builder(
          itemBuilder: (context, index) {
            List schedulePerDay = onSchedulePerDay(index);
            return Card(
              color: Colors.blue.shade200,
              elevation: 3,
              child: Container(
                height: 190,
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                      child: Text(
                        days[index],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow.shade600),
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: schedulePerDay.map((e) {
                          return Container(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 4),
                              child: Text(
                                e,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.yellow.shade200),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: groupSchedule.length,
        ),
      ),
      // ),
      // ]),

      Container(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: widget.logout, child: Text('Log out')),
      ),
    ]);
  }
}
