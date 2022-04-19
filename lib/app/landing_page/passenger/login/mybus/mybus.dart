import 'package:flutter/material.dart';

class mybus extends StatefulWidget {
  const mybus({Key? key}) : super(key: key);

  @override
  _mybusState createState() => _mybusState();
}

class _mybusState extends State<mybus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("MY BUS"),
      ),
    );
  }
}
