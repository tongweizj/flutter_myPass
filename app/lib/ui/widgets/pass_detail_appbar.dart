// 顶部导航
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:mypass/core/view_models/pass_model.dart';
// import 'package:mypass/core/utils/cipher.dart';
import 'package:mypass/ui/style/style.dart';
import 'package:mypass/ui/widgets/appbar_widgets.dart';

PreferredSizeWidget buildPassDetailAppBar(
  BuildContext context, {
  required VoidCallback onPressed,
  String title = '添加密码',
}) {
  return passAppBar(
      context: context,
      title: title,
      backgroundColor: StyleColors.appBgFourth,
      leading: MaterialButton(
        onPressed: () {
          Navigator.pop(context);
        },
        textColor: StyleColors.appColorThird,
        height: 0,
        padding: EdgeInsets.zero,
        child: Text(
          '取消',
          style: TextStyle(fontSize: 14.sp),
        ),
      ),
      actions: <Widget>[
        MaterialButton(
          onPressed: onPressed,
          textColor: StyleColors.appColorThird,
          height: 0,
          padding: EdgeInsets.zero,
          child: Text(
            '保存',
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ]);
}
