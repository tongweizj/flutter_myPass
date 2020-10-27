import 'dart:ui';
import 'package:mypass/core/values/values.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:flutter/material.dart';

/// 透明背景 AppBar
Widget transparentAppBar({
  @required BuildContext context,
  List<Widget> actions,
  leadingIconColr = appiconFirst,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    brightness: Brightness.light,
    centerTitle: true,
    title: Text(''),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: leadingIconColr,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: actions,
  );
}
