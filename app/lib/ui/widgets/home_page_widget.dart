import 'package:flutter/material.dart';
import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:mypass/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:mypass/core/view_models/pass_detail_model.dart';

/// 密码头像
Widget _buildPasswordAvatarItem(
  BuildContext context,
  AppPasswordModel item,
) {
  return GestureDetector(
    onTap: () {
      print("Container was tapped");

      context.read<PassDetailModel>().putPassword(item.passPassword_plain);

      Navigator.pushNamed(context, "/pass", arguments: item);
    },
    child: avatarItem(item.webLetterLogo),
  );
}

/// 密码信息
Widget _buildPasswordInfoItem(
  BuildContext context,
  AppPasswordModel item,
) {
  return GestureDetector(
    onTap: () {
      print("Container was tapped");
      context.read<PassDetailModel>().putPassword(item.passPassword_plain);
      Navigator.pushNamed(context, "/pass", arguments: item);
    },
    child: Container(
        margin: EdgeInsets.only(top: duSetHeight(0), bottom: duSetHeight(0)),
        width: duSetWidth(250),
        height: duSetHeight(60),
        color: appColorThird,
        alignment: Alignment.centerLeft,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.passUsername,
                style: TextStyle(
                  color: appColorSecond,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: duSetFontSize(12),
                  height: 1,
                ),
              ),
              SizedBox(height: duSetHeight(2)),
              Text(
                item.passEmail,
                style: TextStyle(
                  color: appTextSecond,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(12),
                  height: 1,
                ),
              )
            ])),
  );
}

Widget buildPassItemBlock(
  BuildContext context,
  AppPasswordModel item,
) {
  return Container(
      height: duSetHeight(40),
      width: duSetWidth(375),
      margin: EdgeInsets.only(
        top: duSetHeight(0),
        bottom: duSetHeight(0),
        left: duSetWidth(14),
        right: duSetWidth(14),
      ),
      padding: EdgeInsets.only(
          top: duSetHeight(0),
          left: duSetWidth(0),
          right: duSetWidth(0),
          bottom: duSetHeight(0)),
      // alignment: Alignment.centerLeft,
      color: appColorThird,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /// 头像
            _buildPasswordAvatarItem(context, item),

            /// 密码信息
            _buildPasswordInfoItem(context, item),

            /// 复制快捷键
            btnCopyPasswordWidget(item.passPassword_plain)
            // btnCopyPasswordWidget(
            //     CipherUtil.decryptPassword(password: item.passPassword))
          ]));
}
