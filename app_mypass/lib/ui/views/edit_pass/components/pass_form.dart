import 'package:app_mypass/core/entitys/entitys.dart';
import 'package:app_mypass/ui/shared/shared.dart';
import 'package:app_mypass/ui/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

Widget buildPassForm(
  BuildContext context, {
  AppPasswordEntity passItem,
  TextEditingController usernameController,
  TextEditingController emailController,
  TextEditingController passController,
  TextEditingController websiteController,
}) {
  print(passItem);
  usernameController.text = passItem.passUsername;
  emailController.text = passItem.passEmail;
  passController.text = passItem.passPassword;
  websiteController.text = passItem.passWebsite;
  return Container(
      height: 325,
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
              title: '密码',
              value: '',
              hintText: '********',
              isPassword: true,
              controller: passController),
        ],
      ));
}
