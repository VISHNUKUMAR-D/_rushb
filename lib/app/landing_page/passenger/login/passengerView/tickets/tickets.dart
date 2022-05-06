import 'package:flutter/material.dart';

class tickets extends StatefulWidget {
  const tickets({Key? key}) : super(key: key);

  @override
  _ticketsState createState() => _ticketsState();
}

class _ticketsState extends State<tickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("TICKETS"),
      ),
    );
  }
}
