import 'package:app_mypass/ui/shared/shared.dart';
import 'package:flutter/material.dart';

/// 透明背景 AppBar
Widget firstAppBar({
  @required BuildContext context,
  Widget title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title != null
        ? Center(
            child: title,
          )
        : null,
    leading: leading,
    actions: actions,
  );
}

/// 浅色背景 AppBar
Widget secondAppBar({
  @required BuildContext context,
  Widget title,
  Widget leading,
  List<Widget> actions,
  Color backgroundColor: appBgFivth,
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    elevation: 0,
    title: title != null
        ? Center(
            child: title,
          )
        : null,
    leading: leading,
    actions: actions,
  );
}

/// 深色背景 AppBar
Widget thirdAppBar({
  @required BuildContext context,
  Widget title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: appBgSeventh,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[leading, title, Spacer()],
    ),
    centerTitle: false,
    automaticallyImplyLeading: false,
    actions: actions,
  );
}

/// 深色背景 AppBar
Widget fouthAppBar({
  @required BuildContext context,
  String title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: appBgFourth,
    elevation: 0,
    title: title != null
        ? Center(
            child: Text(
              title,
              style: TextStyle(fontSize: duSetFontSize(16)),
            ),
          )
        : null,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: leading,
    actions: actions,
  );
}
