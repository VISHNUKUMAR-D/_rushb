import 'package:flutter/material.dart';

class searchBus extends StatefulWidget {
  const searchBus({Key? key}) : super(key: key);

  @override
  _searchBusState createState() => _searchBusState();
}

class _searchBusState extends State<searchBus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("SEARCH"),
      ),
    );
  }
}
