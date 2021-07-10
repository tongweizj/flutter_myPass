// 顶部导航
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/core/view_models/pass_model.dart';
import 'package:mypass/core/utils/cipher.dart';
import 'package:mypass/ui/style/style.dart';
import 'package:mypass/ui/widgets/appbar_widgets.dart';

PreferredSizeWidget buildAppBar(
  BuildContext context, {
  required TextEditingController username,
  required TextEditingController email,
  required TextEditingController password,
  required TextEditingController website,
  required TextEditingController webLetterLogo,
}) {
  return passAppBar(
      context: context,
      title: '添加密码',
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
          onPressed: () async {
            /// api 添加用户密码
            context.read<PassModel>().addPassword(
                  context,
                  email: email.text,
                  username: username.text,
                  website: website.text,
                  webLetterLogo: webLetterLogo.text,
                  password: CipherUtil.encryptPassword(password: password.text),
                );

            // await GqlPasswordAPI.createUserPassword(
            //     context: context, params: params);
            // Future.delayed(Duration(milliseconds: 1)).then((e) {
            //   context.read<PassModel>().getPasswordList(context);
            // // });
            // Navigator.pushNamed(
            //   context,
            //   "/home",
            // );
          },
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
