import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mypass/ui/style/style.dart';

Widget buildTextEdit(BuildContext context,
    {required TextEditingController controller,
    String title = '',
    String value = '',
    String hintText = '',
    TextInputType keyboardType = TextInputType.text}) {
  //email的控制器

  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: duSetFontSize(12),
            color: StyleColors.appTextFurth,
            height: 1.h,
          ),
        ),
        // email input
        inputEmailEdit(
          context,
          controller: controller,
          keyboardType: keyboardType,
          hintText: hintText,
          marginTop: 0,
        ),
      ]);
}

///  邮件输入框
Widget inputEmailEdit(
  BuildContext context, {
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText = '',
  String title = 'Email',
  bool isPassword = false,
  double marginTop = 10,
}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: duSetFontSize(12),
            color: StyleColors.appTextFurth,
            height: 1.h,
          ),
        ),
        Container(
          height: 30.h,
          margin: EdgeInsets.only(top: (marginTop).h),
          // color: appColorFirst,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: StyleColors.appColorSecond),
              contentPadding: EdgeInsets.fromLTRB(0, 2.h, 0, 5.h),
              border: InputBorder.none,
            ),
            style: TextStyle(
              color: StyleColors.appColorSecond,
              fontFamily: "SFProText",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(14),
            ),
            maxLines: 1,
            autocorrect: false, // 自动纠正
            obscureText: isPassword, // 隐藏输入内容, 密码框
            onEditingComplete: () {
              print("read");
            },
          ),
        )
      ]);
}
