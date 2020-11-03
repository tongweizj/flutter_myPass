import 'package:flutter/material.dart';
import 'package:mypass/ui/shared/shared.dart';

/// 分割线
Widget buildDivideritem() {
  return Container(
      width: duSetWidth(375),
      height: duSetHeight(20),
      margin: EdgeInsets.only(
        top: duSetHeight(0),
        bottom: duSetHeight(0),
        left: duSetWidth(14),
        right: duSetWidth(14),
      ),
      alignment: Alignment.centerLeft,
      child: Divider(height: 1));
}
