import 'package:app_mypass/ui/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:app_mypass/core/utils/utils.dart';
import 'package:app_mypass/core/values/values.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  @required VoidCallback onPressed,
  double width = 317,
  double height = 44,
  Color gbColor = appColorFirst,
  String title = "button",
  Color fontColor = appColorThird,
  double fontSize = 16,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      color: gbColor,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.k2pxRadius,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: duSetFontSize(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}
