import 'package:flutter/material.dart';
import 'package:mypass/ui/style/colors.dart';
import 'package:mypass/ui/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget avatarItem(String webLetterLogo) {
  return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      width: 42.w,
      height: 42.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: StyleColors.appColorFirst,
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          )),
      child: Text(
        webLetterLogo,
        style: TextStyle(
          color: StyleColors.appColorThird,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
          height: 1,
        ),
      ));
}
