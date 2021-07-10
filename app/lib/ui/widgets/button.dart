import 'package:flutter/material.dart';
import 'package:mypass/ui/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 长条形扁平圆角按钮
Widget longRectangleBtnWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 50,
  Color gbColor = StyleColors.appBgSec,
  String title = "button",
}) {
  return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: (width).w,
        height: (height).h,
        margin: EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  color: gbColor,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(16.0),
                  primary: Colors.white,
                  textStyle: TextStyle(fontSize: 20.sp),
                ),
                onPressed: onPressed,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: StyleColors.appColorThird,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
