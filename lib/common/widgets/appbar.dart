import 'package:app_mypass/common/values/values.dart';
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
}) {
  return AppBar(
    backgroundColor: appBgSec,
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
    backgroundColor: appBgFourth,
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
  Widget title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: appBgFourth,
    elevation: 0,
    title: title != null
        ? Center(
            child: title,
          )
        : null,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: leading,
    actions: actions,
  );
}
