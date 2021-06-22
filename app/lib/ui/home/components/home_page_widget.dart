import 'package:flutter/material.dart';
import 'package:mypass/ui/widgets/avatar_widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/ui/style/style.dart';
import 'package:mypass/ui/widgets/button_widgets.dart';
import 'package:mypass/core/view_models/pass_detail_model.dart';

import 'password_item_des.dart';

Widget buildPassItemBlock(
  BuildContext context,
  AppPasswordModel item,
) {
  return Container(
      height: 40.h,
      width: 375.w,
      margin: EdgeInsets.fromLTRB(14.w, 0, 14.w, 0),
      padding: EdgeInsets.all(0),
      // alignment: Alignment.centerLeft,
      color: StyleColors.appColorThird,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// 头像
            _buildPasswordAvatarItem(context, item),

            /// 密码信息
            buildPasswordDesItem(context, item),

            /// 复制快捷键
            btnCopyPasswordWidget(item.passPlainPassword)
          ]));
}

/// 密码头像
Widget _buildPasswordAvatarItem(
  BuildContext context,
  AppPasswordModel item,
) {
  return GestureDetector(
    onTap: () {
      /// 跳转详情页前，将密码信息赋值
      context.read<PassDetailModel>().setPasswordItem(item);
      context.read<PassDetailModel>().putPassword(item.passPlainPassword);
      // context.read<PassDetailModel>().getPasswordItem(item);
      Navigator.pushNamed(context, "/pass", arguments: item);
    },
    child: avatarItem(item.webLetterLogo),
  );
}
