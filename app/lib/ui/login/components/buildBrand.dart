// Brand Information block
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildBrandInfo() {
  return Container(
    margin: EdgeInsets.all(0.h), // 顶部系统栏 44px
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 80.h,
          width: 80.w,
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Image.asset(
            "assets/images/launch-logo.png",
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    ),
  );
}
