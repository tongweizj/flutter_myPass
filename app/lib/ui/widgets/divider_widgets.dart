import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 分割线
Widget buildDivideritem() {
  return Container(
      width: 375.w,
      height: 20.h,
      margin: EdgeInsets.only(
        top: 0,
        bottom: 0,
        left: 14.w,
        right: 14.w,
      ),
      alignment: Alignment.centerLeft,
      child: Divider(height: 1));
}
