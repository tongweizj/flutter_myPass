import 'package:app_mypass/common/utils/utils.dart';
import 'package:app_mypass/common/values/values.dart';
import 'package:flutter/material.dart';

/// 扁平圆角图片按钮
Widget btnFlatIconButtonWidget({
  @required VoidCallback onPressed,
  double width = 140,
  double height = 54,
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
          borderRadius: Radii.k27pxRadius,
        ),
        child: Text("登陆")
        // child: Image.asset(
        //   "assets/images/icons_$iconFileName.png",
        // ),
        ),
  );
}
