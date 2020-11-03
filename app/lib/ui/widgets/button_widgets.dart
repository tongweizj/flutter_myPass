import 'package:flutter/services.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:flutter/material.dart';

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

/// 复制按钮
Widget btnCopyPasswordWidget(String copyString) {
  return GestureDetector(
      onTap: () {
        print("Copy pass");
        print(copyString);
        Clipboard.setData(ClipboardData(text: copyString));
      },
      child: Container(
          margin: EdgeInsets.only(top: duSetHeight(0), bottom: duSetHeight(0)),
          width: duSetWidth(15),
          // height: duSetHeight(67),
          // color: Colors.yellow,
          alignment: Alignment.centerLeft,
          child: Icon(
            Icons.content_copy,
            size: 16,
            color: appColorFirst,
          )));
}
