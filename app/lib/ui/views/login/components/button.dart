import 'package:mypass/core/utils/utils.dart';
import 'package:mypass/core/values/values.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:flutter/material.dart';

/// 扁平圆角图片按钮
Widget btnFlatIconButtonWidget({
  @required VoidCallback onPressed,
  double width = 140,
  double height = 50,
  Color gbColor = appBgSec,
  String iconFileName,
  double marginTop = 15,
}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    child: FlatButton(
        onPressed: onPressed,
        color: gbColor,
        shape: RoundedRectangleBorder(
          borderRadius: Radii.k4pxRadius,
        ),
        child: Text(
          "登 陆",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: appColorThird,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
            fontSize: duSetFontSize(18),
            height: 1,
          ),
        )
        // child: Image.asset(
        //   "assets/images/icons_$iconFileName.png",
        // ),
        ),
  );
}
