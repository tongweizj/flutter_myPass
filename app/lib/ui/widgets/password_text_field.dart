import 'package:mypass/core/view_models/pass_detail_model.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 输入模块
///
/// 包含：模块头： 标题，如姓名； 输入框： 文本输入，email输入
/// 传入：
///     context：
///     controller 输入框的controller
///     title, 模块头的标题
///     value,
///     hintText, 输入框的默认文案
///     isEmail，控值键盘是否email键盘
///     isPassword 控值输入文字是否改为 *
Widget buildPasswordTextField(BuildContext context,
    {@required TextEditingController controller,
    String title,
    String value,
    String hintText,
    bool isEmail = false,
    bool isPassword = false}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            // height: duSetHeight(11),
            margin: EdgeInsets.only(top: duSetHeight(10)),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: duSetFontSize(12),
                color: appTextFurth,
                height: duSetHeight(1),
              ),
            )),
        isPassword == false
            ? inputTextEdit(
                controller: controller,
                hintText: hintText,
                obscureText: isPassword)
            : inputPasswordEdit(context,
                controller: controller,
                hintText: hintText,
                obscureText: isPassword),
        Divider(),
      ]);
}

/// 输入框
Widget inputTextEdit(
    {@required TextEditingController controller,
    String hintText,
    bool isEmail = false,
    bool obscureText}) {
  return Container(
    height: duSetHeight(30),
    margin: EdgeInsets.only(top: duSetHeight(0)),
    // color: appColorFirst,
    child: TextField(
      controller: controller,
      keyboardType:
          isEmail == false ? TextInputType.text : TextInputType.emailAddress,
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
      obscureText: obscureText, // 隐藏输入内容, 密码框
    ),
  );
}

/// 密码输入框
Widget inputPasswordEdit(BuildContext context,
    {@required TextEditingController controller,
    String hintText,
    bool isEmail = false,
    bool obscureText}) {
  return Row(
    children: <Widget>[
      Expanded(
          child: Container(
        height: duSetHeight(30),
        margin: EdgeInsets.only(top: duSetHeight(0)),
        // color: appColorFirst,
        child: TextField(
          controller: controller,
          keyboardType: isEmail == false
              ? TextInputType.text
              : TextInputType.emailAddress,
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
          obscureText:
              !context.watch<PassDetailModel>().isShowPass, // 隐藏输入内容, 密码框
        ),
      )),
      GestureDetector(
        onTap: () {
          context.read<PassDetailModel>().changePassword();
        },
        child: new Icon(context.watch<PassDetailModel>().isShowPass
            ? Icons.visibility
            : Icons.visibility_off),
      ),
      SizedBox(
        width: duSetWidth(20),
      ),
    ],
  );
}
