import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:mypass/ui/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

Widget buildPassForm(
  BuildContext context, {
  AppPasswordModel passItem,
  TextEditingController usernameController,
  TextEditingController emailController,
  TextEditingController passController,
  TextEditingController websiteController,
  TextEditingController webLetterLogoController,
}) {
  // print(passItem);
  usernameController.text = passItem.passUsername;
  emailController.text = passItem.passEmail;
  passController.text = passItem.passPassword;
  websiteController.text = passItem.passWebsite;
  webLetterLogoController.text = passItem.webLetterLogo;
  return Container(
      height: duSetHeight(450),
      padding: EdgeInsets.only(
          left: duSetWidth(20),
          right: duSetWidth(0),
          bottom: duSetHeight(0),
          top: duSetHeight(10)),
      child: Column(
        children: <Widget>[
          buildPasswordTextField(context,
              title: '姓名',
              value: '',
              hintText: passItem.passUsername,
              controller: usernameController),
          Divider(),
          buildPasswordTextField(context,
              title: 'email',
              value: '',
              hintText: passItem.passEmail,
              isEmail: true,
              controller: emailController),
          Divider(),
          buildPasswordTextField(context,
              title: '网站',
              value: '',
              hintText: passItem.passWebsite,
              controller: websiteController),
          Divider(),
          buildPasswordTextField(context,
              title: '密码Logo',
              value: '',
              hintText: passItem.webLetterLogo,
              controller: webLetterLogoController),
          Divider(),
          buildPasswordTextField(context,
              title: '密码',
              value: '',
              hintText: '********',
              isPassword: true,
              controller: passController),
        ],
      ));
}
