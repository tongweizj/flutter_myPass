import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/ui/pass_add/components/password_text_field.dart';

Widget buildPassForm(
  BuildContext context, {
  required AppPasswordModel passItem,
  required TextEditingController usernameController,
  required TextEditingController emailController,
  required TextEditingController passController,
  required TextEditingController websiteController,
  required TextEditingController webLetterLogoController,
}) {
  // print(passItem);
  usernameController.text = passItem.passUsername;
  emailController.text = passItem.passEmail;
  passController.text = passItem.passPlainPassword;
  websiteController.text = passItem.passWebsite;
  webLetterLogoController.text = passItem.webLetterLogo;
  return Container(
      height: 450.h,
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 0, 0),
      child: Column(
        children: <Widget>[
          buildPasswordTextField(context,
              title: '姓名',
              value: '',
              hintText: passItem.passUsername,
              controller: usernameController),
          // Divider(),
          buildPasswordTextField(context,
              title: 'email',
              value: '',
              hintText: passItem.passEmail,
              isEmail: true,
              controller: emailController),
          // Divider(),
          buildPasswordTextField(context,
              title: '网站',
              value: '',
              hintText: passItem.passWebsite,
              controller: websiteController),
          // Divider(),
          buildPasswordTextField(context,
              title: '密码Logo',
              value: '',
              hintText: passItem.webLetterLogo,
              controller: webLetterLogoController),
          // Divider(),
          buildPasswordTextField(context,
              title: '密码',
              value: '',
              hintText: '',
              isPassword: true,
              controller: passController),
          // Divider(),
        ],
      ));
}
