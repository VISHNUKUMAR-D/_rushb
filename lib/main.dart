import 'package:_rushb/app/passenger/views/passengerView.dart';
import 'package:_rushb/app/qrCodeScanner/views/qrCodeScanner.dart';
import 'package:flutter/material.dart';

import 'app/login/views/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return loginView();
  }
}
