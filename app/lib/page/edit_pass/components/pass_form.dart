import 'package:app_mypass/page/edit_pass/components/text_edit.dart';
import 'package:flutter/material.dart';

import 'package:app_mypass/common/utils/utils.dart';
import 'package:app_mypass/common/values/values.dart';

Widget buildPassForm(
  Map passItemitle,
) {
  return Container(
      height: 325,
      padding: EdgeInsets.only(
          left: duSetWidth(20),
          right: duSetWidth(0),
          bottom: duSetHeight(0),
          top: duSetHeight(10)),
      child: Column(
        children: <Widget>[
          buildTextEdit('姓名', 'gmail'),
          Divider(),
          buildTextEdit('email', 'tongweizj@gmail.com'),
          Divider(),
          buildTextEdit('辅助登录', 'tongweizj@gmail.com'),
          Divider(),
          buildTextEdit('密码', '************'),
          Divider(),
          buildTextEdit('安全码', '************'),
        ],
      ));
}
