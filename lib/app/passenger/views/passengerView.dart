import 'package:_rushb/app/mybus/views/mybus.dart';
import 'package:_rushb/app/tickets/views/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../map/views/map.dart';
import '../../search/views/searchBus.dart';

class passengerView extends StatefulWidget {
  const passengerView({Key? key}) : super(key: key);
  @override
  _passengerViewState createState() => _passengerViewState();
}

class _passengerViewState extends State<passengerView> {
  int activeTab = 0;
  List<StatefulWidget> navBarTabs = [map(), searchBus(), mybus(), tickets()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: navBarTabs[activeTab],
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            color: Colors.black,
            iconSize: size.height * 0.045,
            icon: Icon(MdiIcons.accountCircleOutline),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              color: Colors.black,
              iconSize: size.height * 0.035,
              padding: EdgeInsets.only(right: size.width * 0.04),
              icon: Icon(MdiIcons.qrcodeScan),
              onPressed: () {},
            )
          ],
        ),
        bottomNavigationBar: Row(
          children: [
            customNavBar(size, MdiIcons.mapMarkerRadiusOutline, "MAP", 0),
            customNavBar(size, Icons.search_outlined, "SEARCH BUS", 1),
            customNavBar(size, MdiIcons.busSide, "MY BUS", 2),
            customNavBar(size, MdiIcons.ticketPercentOutline, "TICKETS", 3)
          ],
        ));
  }

  customNavBar(Size size, IconData icon, String label, int index) {
    bool isActive = false;
    index == activeTab ? isActive = true : isActive = false;
    return GestureDetector(
      child: Container(
        width: size.width / 4,
        height: size.height * 0.065,
        decoration: isActive
            ? BoxDecoration(
                boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        spreadRadius: 0.5,
                        blurRadius: size.width * 0.015,
                        offset: Offset(0, -size.width * 0.005)),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(-size.width * 0.015, 0)),
                    BoxShadow(
                        color: Colors.white,
                        offset: Offset(size.width * 0.0025, 0)),
                  ],
                border: Border(
                  top: BorderSide(
                      width: size.width * 0.006,
                      color: Colors.greenAccent.shade700),
                ),
                gradient: LinearGradient(colors: [
                  Colors.greenAccent.shade700.withOpacity(0.005),
                  Colors.greenAccent.shade700.withOpacity(0.5),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      spreadRadius: 0.5,
                      blurRadius: size.width * 0.015,
                      offset: Offset(0, -size.width * 0.005)),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-size.width * 0.015, 0)),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(size.width * 0.0025, 0)),
                ],
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.black : Colors.black54,
            ),
            if (isActive)
              Flexible(
                child: Text(
                  label,
                  style: GoogleFonts.lexend(
                      fontSize: size.height * 0.01,
                      fontWeight: FontWeight.bold),
                ),
              )
          ],
        ),
      ),
      onTap: () {
        setState(() => activeTab = index);
      },
    );
  }
}
