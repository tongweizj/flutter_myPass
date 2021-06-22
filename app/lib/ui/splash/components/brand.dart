// logo
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget brand() {
  return Container(
      width: 220.w,
      height: 328.h,
      child: Image.asset(
        "assets/images/brand.png",
        fit: BoxFit.none,
      ));
}
