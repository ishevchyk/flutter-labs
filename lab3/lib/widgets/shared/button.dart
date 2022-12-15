import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget page;
  const Button({
    super.key,
    required this.page,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(
          'View more',
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ));
  }
}
