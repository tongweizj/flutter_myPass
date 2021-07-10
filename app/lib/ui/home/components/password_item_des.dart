import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/ui/style/style.dart';
import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/core/view_models/pass_detail_model.dart';

/// 密码信息
Widget buildPasswordDesItem(
  BuildContext context,
  AppPasswordModel item,
) {
  return GestureDetector(
    onTap: () {
      context.read<PassDetailModel>().setPasswordItem(item);
      context.read<PassDetailModel>().putPassword(item.passPlainPassword);
      Navigator.pushNamed(context, "/pass", arguments: item);
    },
    child: Container(
        margin: EdgeInsets.only(top: 0, bottom: 0),
        width: 250.w,
        height: 60.h,
        color: StyleColors.appColorThird,
        alignment: Alignment.centerLeft,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.passUsername,
                style: TextStyle(
                  color: StyleColors.appColorSecond,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  height: 1,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                item.passEmail,
                style: TextStyle(
                  color: StyleColors.appTextSecond,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  height: 1,
                ),
              )
            ])),
  );
}
