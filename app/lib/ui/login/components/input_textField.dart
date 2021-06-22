import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mypass/ui/style/style.dart';

/// 用户名输入框
Widget inputTextField({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String? hintText,
  bool isPassword = false,
  double marginTop = 15,
}) {
  return Container(
    height: (33).h,
    margin: EdgeInsets.only(top: (marginTop).h),
    decoration: BoxDecoration(
      color: StyleColors.appColorThird,
      borderRadius: Radii.k4pxRadius,
      // border: Border.all(width: 0, color: StyleColors.appColorFirst)
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: StyleColors.appTextFurth, fontSize: duSetFontSize(16)),
        contentPadding: EdgeInsets.fromLTRB(12.w, 0, 0, 5.h),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: StyleColors.appTextFurth,
        fontFamily: "SFProText",
        fontWeight: FontWeight.w400,
        fontSize: duSetFontSize(16),
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
