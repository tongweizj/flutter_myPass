// // 顶部导航
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:mypass/ui/style/style.dart';
import 'package:mypass/ui/widgets/appbar_widgets.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context,
) {
  return passAppBar(
      context: context,
      backgroundColor: StyleColors.appBgPrimary,
      brightness: Brightness.light,
      title: "",
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: StyleColors.appColorFirst,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
            color: StyleColors.appColorFirst,
          ),
          iconSize: 28,
          onPressed: () {
            Navigator.pushNamed(
              context,
              "/add_pass",
            );
          },
        )
      ]);
}
