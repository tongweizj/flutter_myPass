import 'package:flutter/material.dart';
import 'package:mypass/ui/style/colors.dart';
import 'package:mypass/ui/style/style.dart';

Widget avatarItem(String webLetterLogo) {
  return Container(
      margin: EdgeInsets.only(top: duSetHeight(0), bottom: duSetHeight(0)),
      width: duSetWidth(42),
      height: duSetWidth(42),
      // height: duSetHeight(67),

      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: StyleColors.appColorFirst,
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          )),
      child: Text(
        webLetterLogo,
        style: TextStyle(
          color: StyleColors.appColorThird,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
          height: 1,
        ),
      ));
}
