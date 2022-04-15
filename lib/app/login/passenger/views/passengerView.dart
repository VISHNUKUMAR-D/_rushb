import 'package:_rushb/app/decorativeWidgets/decorativeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../map/views/map.dart';
import '../mybus/views/mybus.dart';
import '../qrCodeScanner/qrCodeScanner.dart';
import '../search/views/searchBus.dart';
import '../tickets/views/tickets.dart';

class passengerView extends StatefulWidget {
  const passengerView({Key? key}) : super(key: key);
  @override
  _passengerViewState createState() => _passengerViewState();
}

var drawerKey = GlobalKey<ScaffoldState>();

class _passengerViewState extends State<passengerView> {
  decorativeWidget customWidget = decorativeWidget();
  int activeTab = 0;
  List<StatefulWidget> navBarTabs = [map(), searchBus(), mybus(), tickets()];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizedBoxHeight = size.height * 0.01;
    final padding = EdgeInsets.symmetric(horizontal: size.width * 0.05);
    return Scaffold(
        key: drawerKey,
        drawer: buildDrawer(padding, sizedBoxHeight, size, context),
        appBar: AppBar(
          backgroundColor: customWidget.getAppColor(),
          foregroundColor: Colors.white,
          leading: IconButton(
            iconSize: size.height * 0.05,
            icon: Icon(MdiIcons.accountCircle),
            onPressed: () {
              drawerKey.currentState?.openDrawer();
            },
          ),
          actions: [
            IconButton(
                iconSize: size.height * 0.04,
                padding: EdgeInsets.only(right: size.width * 0.04),
                icon: Icon(MdiIcons.qrcodeScan),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new qrCodeScanner())))
          ],
        ),
        body: Container(
          color: Colors.white,
          child: navBarTabs[activeTab],
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

  Drawer buildDrawer(EdgeInsets padding, double sizedBoxHeight, Size size,
      BuildContext context) {
    return Drawer(
      child: Material(
        color: customWidget.getAppColor(),
        child: ListView(
          children: [
            Container(
              padding: padding,
              height: size.height * 0.15,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: size.width * 0.08,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    width: sizedBoxHeight * 2.5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customWidget.putTitleText("RushB", size.height * 0.03, 0),
                      customWidget.putLabelText(
                          "rusb@massivemodulerz.in", size.height * 0.015, 0)
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: padding,
              child: Column(
                children: [
                  SizedBox(
                    height: sizedBoxHeight * 2.5,
                  ),
                  builtMenuItem(
                      text: "Scan QR Code",
                      icon: MdiIcons.qrcodeScan,
                      size: size,
                      onClicked: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => qrCodeScanner()));
                      }),
                  Divider(
                    thickness: sizedBoxHeight / 4,
                    color: customWidget.getAppColor(),
                  ),
                  SizedBox(
                    height: sizedBoxHeight * 2.5,
                  ),
                  builtMenuItem(
                      text: "Map",
                      icon: Icons.map,
                      size: size,
                      onClicked: () {
                        Navigator.pop(context);
                        setState(() {
                          activeTab = 0;
                        });
                      }),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  builtMenuItem(
                      text: "Search Bus",
                      icon: Icons.search,
                      size: size,
                      onClicked: () {
                        Navigator.pop(context);
                        setState(() {
                          activeTab = 1;
                        });
                      }),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  builtMenuItem(
                      text: "My Bus",
                      icon: MdiIcons.busSide,
                      size: size,
                      onClicked: () {
                        Navigator.pop(context);
                        setState(() {
                          activeTab = 2;
                        });
                      }),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  builtMenuItem(
                      text: "Tickets",
                      icon: MdiIcons.ticketPercent,
                      size: size,
                      onClicked: () {
                        Navigator.pop(context);
                        setState(() {
                          activeTab = 3;
                        });
                      }),
                  SizedBox(
                    height: sizedBoxHeight * 2.5,
                  ),
                  Divider(
                    thickness: sizedBoxHeight / 4,
                    color: customWidget.getAppColor(),
                  ),
                  SizedBox(
                    height: sizedBoxHeight * 2.5,
                  ),
                  builtMenuItem(
                      text: "Languages", icon: MdiIcons.translate, size: size),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  builtMenuItem(
                      text: "Settings",
                      icon: Icons.settings_outlined,
                      size: size),
                  SizedBox(
                    height: sizedBoxHeight * 2.5,
                  ),
                  Divider(
                    thickness: sizedBoxHeight / 4,
                    color: customWidget.getAppColor(),
                  ),
                  SizedBox(
                    height: sizedBoxHeight * 2.5,
                  ),
                  builtMenuItem(
                      text: "Share with Friends",
                      icon: MdiIcons.share,
                      size: size),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  builtMenuItem(
                      text: "Help & FAQ",
                      icon: MdiIcons.helpCircleOutline,
                      size: size),
                  SizedBox(
                    height: sizedBoxHeight * 2.5,
                  ),
                  Divider(
                    thickness: sizedBoxHeight / 4,
                    color: Colors.redAccent,
                  ),
                  SizedBox(
                    height: sizedBoxHeight * 2.5,
                  ),
                  ListTile(
                    leading: Icon(
                      MdiIcons.logout,
                      color: Colors.redAccent,
                    ),
                    title: customWidget.putTitleText(
                        "Log Out", size.height * 0.02, 1),
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
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
                      width: size.width * 0.0075,
                      color: customWidget.getAppColor()),
                ),
                gradient: LinearGradient(colors: [
                  customWidget.getAppColor().withOpacity(1),
                  customWidget.getAppColor().withOpacity(0.5),
                  customWidget.getAppColor().withOpacity(0.015),
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
                child:
                    customWidget.putLabelText(label, size.height * 0.0125, 1),
              )
          ],
        ),
      ),
      onTap: () {
        setState(() => activeTab = index);
      },
    );
  }

  builtMenuItem({
    required String text,
    required IconData icon,
    required Size size,
    VoidCallback? onClicked,
  }) {
    final color = customWidget.getAppColor();
    return ListTile(
      hoverColor: color,
      leading: Icon(
        icon,
        color: color,
      ),
      title: customWidget.putTitleText(text, size.height * 0.02, 1),
      onTap: onClicked,
    );
  }
}