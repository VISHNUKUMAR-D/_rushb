import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class decorativeWidget {
  Color getAppColor() {
    var appColor = Color.fromRGBO(60, 181, 97, 1);
    return appColor;
  }

  Text putTitleText(String title, double titleSize, int color) {
    return Text(title,
        style: GoogleFonts.lexend(
            fontWeight: FontWeight.bold,
            fontSize: titleSize,
            color: color == 0
                ? Colors.white
                : color == 1
                    ? Colors.black
                    : Color.fromRGBO(60, 181, 97, 1)));
  }

  Flexible putLabelText(String label, double labelSize, int color) {
    return Flexible(
      child: Text(label,
          style: GoogleFonts.lexend(
              fontSize: labelSize,
              color: color == 0
                  ? Colors.white
                  : color == 1
                      ? Colors.black
                      : Color.fromRGBO(60, 181, 97, 1))),
    );
  }
}
