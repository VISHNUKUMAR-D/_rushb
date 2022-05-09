import 'package:_rushb/app/decorativeWidgets/decorativeWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'map/map.dart';
import 'search/searchBus.dart';
import 'mybus/mybus.dart';
import 'qrCodeScanner/qrCodeScanner.dart';
import 'tickets/tickets.dart';

class passengerView extends StatefulWidget {
  const passengerView({Key? key}) : super(key: key);
  @override
  _passengerViewState createState() => _passengerViewState();
}

var drawerKey = GlobalKey<ScaffoldState>();

class _passengerViewState extends State<passengerView> {
  decorativeWidget customWidget = decorativeWidget();
  int activeTab = 0;
  bool searchBusBy = true;
  final PageController _swipePageController = PageController();
  List<StatefulWidget> navBarTabs = [
    const map(),
    const searchBus(),
    const mybus(),
    const tickets()
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizedBoxHeight = size.height * 0.01;
    final padding = EdgeInsets.symmetric(horizontal: size.width * 0.05);
    return Scaffold(
        key: drawerKey,
        drawer: buildDrawer(padding, sizedBoxHeight, size, context),
        appBar: (activeTab != 1)
            ? AppBar(
                backgroundColor: customWidget.getAppColor(),
                foregroundColor: Colors.white,
                leading: IconButton(
                  iconSize: size.height * 0.05,
                  icon: const Icon(MdiIcons.accountCircle),
                  onPressed: () {
                    drawerKey.currentState?.openDrawer();
                  },
                ),
                actions: [
                  IconButton(
                      iconSize: size.height * 0.04,
                      padding: EdgeInsets.only(right: size.width * 0.04),
                      icon: const Icon(MdiIcons.qrcodeScan),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const qrCodeScanner())))
                ],
              )
            : AppBar(
                elevation: size.width * 0.015,

                backgroundColor: customWidget.getAppColor(),
                toolbarHeight: size.height * 0.175,
                leading: const Text(""),
                flexibleSpace: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.all(size.height * 0.0075),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.015),
                          border: Border.all(color: Colors.white)),
                      height: size.height * 0.15,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: size.width * 0.6,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        MdiIcons.busStop,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: size.width * 0.5,
                                        child: TextField(
                                          cursorColor: Colors.white24,
                                          autofocus: true,
                                          style: GoogleFonts.lexend(
                                              color: Colors.white),
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: size.width * 0.05),
                                              hintText: (searchBusBy)
                                                  ? "Enter Your Location"
                                                  : "Enter Bus Number",
                                              hintStyle: TextStyle(
                                                  fontSize: size.width * 0.04,
                                                  color: Colors.white54),
                                              enabled: true,
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.65,
                                  child: Divider(
                                    thickness: sizedBoxHeight / 4,
                                    color: Colors.white54,
                                  ),
                                ),
                                Container(
                                  width: size.width * 0.6,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        color: Colors.white,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: size.width * 0.5,
                                        child: TextField(
                                          cursorWidth: size.width * 0.0075,
                                          cursorColor: Colors.white,
                                          style: GoogleFonts.lexend(
                                              color: Colors.white),
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(
                                                  left: size.width * 0.05),
                                              hintText: "Enter Desitination",
                                              hintStyle: TextStyle(
                                                  fontSize: size.width * 0.04,
                                                  color: Colors.white54),
                                              enabled: true,
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // customWidget.buildSearchField(
                                //     "Your Loaction", MdiIcons.busStop),
                                // customWidget.buildSearchField(
                                //     "Enter Destination", MdiIcons.busStop)
                              ],
                            ),
                            Icon(Icons.swap_vert_outlined,
                                color: Colors.white, size: size.width * 0.075)
                          ]),
                    ),
                  ),
                ),
                // bottom: PreferredSize(
                //   preferredSize: Size.fromHeight(size.height * 0.08),
                //   child: Container(
                //     child: customWidget.buildSearchField(
                //         "Enter Destination", Icons.location_pin),
                //   ),
                // ),
              ),
        body: Container(
          color: Colors.white,
          child: PageView(
            controller: _swipePageController,
            onPageChanged: (_newindex) {
              setState(() {
                activeTab = _newindex;
              });
            },
            children: const [map(), searchBus(), mybus(), tickets()],
          ),
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
                          "rushb@massivemodulerz.in", size.height * 0.015, 0)
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
                                builder: (context) => const qrCodeScanner()));
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
                          _swipePageController.animateToPage(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linearToEaseOut);
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
                          _swipePageController.animateToPage(1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linearToEaseOut);
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
                          _swipePageController.animateToPage(2,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linearToEaseOut);
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
                          _swipePageController.animateToPage(3,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linearToEaseOut);
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
                      text: "Languages",
                      icon: MdiIcons.translate,
                      size: size,
                      onClicked: () {}),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  builtMenuItem(
                      text: "Settings",
                      icon: Icons.settings_outlined,
                      size: size,
                      onClicked: () {}),
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
                      size: size,
                      onClicked: () {}),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  builtMenuItem(
                      text: "Help & FAQ",
                      icon: MdiIcons.helpCircleOutline,
                      size: size,
                      onClicked: () {}),
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
                  Material(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: const Icon(
                        MdiIcons.logout,
                        color: Colors.redAccent,
                      ),
                      title: customWidget.putLabelText(
                          "Log Out", size.height * 0.02, 1),
                      onTap: () {},
                    ),
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
                ))
            // gradient: LinearGradient(colors: [
            //   customWidget.getAppColor().withOpacity(1),
            //   customWidget.getAppColor().withOpacity(0.5),
            //   customWidget.getAppColor().withOpacity(0.015),
            // ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
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
                    customWidget.putTitleText(label, size.height * 0.0125, 1),
              )
          ],
        ),
      ),
      onTap: () {
        setState(() {
          _swipePageController.animateToPage(index,
              duration: Duration(milliseconds: 500),
              curve: Curves.linearToEaseOut);
        });
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
    return Material(
      color: Colors.transparent,
      child: ListTile(
        hoverColor: color,
        leading: Icon(
          icon,
          color: color,
        ),
        title: customWidget.putLabelText(text, size.height * 0.02, 1),
        onTap: onClicked,
      ),
    );
  }
}

// Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     searchBusBy = true;
//                                   });
//                                 },
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: size.height * 0.03,
//                                   width: size.width * 0.3,
//                                   decoration: searchBusBy
//                                       ? const BoxDecoration(
//                                           border: Border(
//                                               bottom: BorderSide(
//                                                   color: Colors.white)))
//                                       : null,
//                                   child: customWidget.putTitleText(
//                                       "Search by Location",
//                                       size.width * 0.03,
//                                       0),
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     searchBusBy = false;
//                                   });
//                                 },
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   height: size.height * 0.03,
//                                   width: size.width * 0.4,
//                                   decoration: !searchBusBy
//                                       ? const BoxDecoration(
//                                           border: Border(
//                                               bottom: BorderSide(
//                                                   color: Colors.white)))
//                                       : null,
//                                   child: customWidget.putTitleText(
//                                       "Search by Bus Number",
//                                       size.width * 0.03,
//                                       0),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: size.width * 0.025,
//                           ),
