import 'package:flutter/material.dart';

import 'package:app_mypass/common/utils/utils.dart';
import 'package:app_mypass/common/values/values.dart';

Widget buildTextEdit(
  String title,
  String value,
) {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: duSetFontSize(12),
            color: appTextFurth,
            height: duSetHeight(1),
          ),
        ),
        // email input
        inputEmailEdit(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          hintText: value,
          marginTop: 0,
        ),
      ]);
}

/// 用户名输入框
Widget inputEmailEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 10,
}) {
  return Container(
    height: duSetHeight(30),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    // color: appColorFirst,
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: appColorSecond),
        contentPadding: EdgeInsets.fromLTRB(0, 2, 0, 5),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: appColorSecond,
        fontFamily: "SFProText",
        fontWeight: FontWeight.w400,
        fontSize: duSetFontSize(14),
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
