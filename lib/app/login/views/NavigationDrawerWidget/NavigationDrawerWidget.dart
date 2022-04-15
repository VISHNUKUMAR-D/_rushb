import 'package:_rushb/app/decorativeWidgets/decorativeWidget.dart';
import 'package:_rushb/app/passenger/views/passengerView.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavigationDrawerWidget extends StatelessWidget {
  decorativeWidget customWidget = decorativeWidget();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    decorativeWidget customWidget = decorativeWidget();
    double sizedBoxHeight = size.height * 0.01;
    final padding = EdgeInsets.symmetric(horizontal: size.width * 0.05);
    return Drawer(
      child: Material(
        // color: customWidget.getAppColor(),
        child: ListView(
          padding: padding,
          children: [
            SizedBox(
              height: sizedBoxHeight * 2.5,
            ),
            builtMenuItem(
                text: "Map",
                icon: Icons.map,
                size: size,
                onClicked: () => selectedItem(context, 0)),
            SizedBox(
              height: sizedBoxHeight,
            ),
            builtMenuItem(text: "Search Bus", icon: Icons.search, size: size),
            SizedBox(
              height: sizedBoxHeight,
            ),
            builtMenuItem(text: "My Bus", icon: MdiIcons.busSide, size: size),
            SizedBox(
              height: sizedBoxHeight,
            ),
            builtMenuItem(
                text: "Tickets", icon: MdiIcons.ticketPercent, size: size),
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
                text: "Settings", icon: Icons.settings_outlined, size: size),
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
                text: "Share with Friends", icon: MdiIcons.share, size: size),
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
              title:
                  customWidget.putTitleText("Log Out", size.height * 0.02, 1),
              onTap: () {},
            ),
          ],
        ),
      ),
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
      leading: Icon(
        icon,
        color: color,
      ),
      title: customWidget.putTitleText(text, size.height * 0.02, 1),
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int i) {}
}
