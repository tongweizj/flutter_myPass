import 'package:app_mypass/ui/shared/shared.dart';
import 'package:app_mypass/ui/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

Widget buildPassForm(
  BuildContext context, {
  TextEditingController usernameController,
  TextEditingController emailController,
  TextEditingController passController,
  TextEditingController websiteController,
}) {
  return Container(
      height: 325,
      padding: EdgeInsets.only(
          left: duSetWidth(20),
          right: duSetWidth(0),
          bottom: duSetHeight(0),
          top: duSetHeight(10)),
      child: Column(
        children: <Widget>[
          buildPasswordTextField(
            context,
            controller: usernameController,
            title: '姓名',
            value: '',
            hintText: '用户名',
          ),
          Divider(),
          buildPasswordTextField(context,
              controller: emailController,
              title: 'Email',
              hintText: 'email',
              isEmail: true),
          Divider(),
          buildPasswordTextField(context,
              controller: passController,
              title: '密码',
              value: '',
              hintText: '用户名',
              isPassword: true),
          Divider(),
          buildPasswordTextField(context,
              title: '网站',
              value: '',
              hintText: '用户名',
              controller: websiteController),
        ],
      ));
}
