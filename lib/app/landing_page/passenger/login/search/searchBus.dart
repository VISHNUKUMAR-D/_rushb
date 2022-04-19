import 'package:_rushb/app/decorativeWidgets/decorativeWidget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class searchBus extends StatefulWidget {
  const searchBus({Key? key}) : super(key: key);

  @override
  _searchBusState createState() => _searchBusState();
}

class _searchBusState extends State<searchBus> {
  decorativeWidget customWidget = decorativeWidget();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: size.height * 0.015,
        ),
        searchedBus(size, Colors.redAccent),
        SizedBox(
          height: size.height * 0.015,
        ),
        searchedBus(size, Colors.yellowAccent),
        SizedBox(
          height: size.height * 0.015,
        ),
        searchedBus(size, Colors.greenAccent),
        SizedBox(
          height: size.height * 0.015,
        ),
        searchedBus(size, Colors.yellowAccent),
      ],
    ));
  }

  Container searchedBus(Size size, Color color) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        color: Colors.white,
        elevation: size.width * 0.015,
        child: Container(
          width: size.width * 0.95,
          height: size.height * 0.175,
          padding: EdgeInsets.only(
              left: size.width * 0.05, right: size.width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: size.width * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: size.width * 0.2,
                      child: Row(
                        children: [
                          const Icon(
                            MdiIcons.bus,
                          ),
                          customWidget.putLabelText(" 70", size.width * 0.05, 1)
                        ],
                      ),
                    ),
                    customWidget.putLabelText(
                        "Will arrive GCT in 10mins", size.width * 0.05, 1),
                    customWidget.putLabelText(
                        "Marudhamalai --> Gandhipuram", size.width * 0.03, 1),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    MdiIcons.bookmark,
                    color: Colors.blueAccent,
                  ),
                  SizedBox(height: size.width * 0.075),
                  SpinKitRing(
                    size: size.width * 0.075,
                    color: color,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
