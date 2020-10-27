import 'package:app_mypass/ui/shared/shared.dart';
import 'package:app_mypass/ui/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

Widget buildPassForm(
  BuildContext context, {
  TextEditingController usernameController,
  TextEditingController emailController,
  TextEditingController passController,
  TextEditingController websiteController,
  TextEditingController webLetterLogoController,
}) {
  return Container(
      height: duSetHeight(350),
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
            hintText: '',
          ),
          Divider(),
          buildPasswordTextField(context,
              controller: emailController,
              title: 'Email',
              hintText: '',
              isEmail: true),
          Divider(),
          buildPasswordTextField(context,
              controller: passController,
              title: '密码',
              value: '',
              hintText: '',
              isPassword: true),
          Divider(),
          buildPasswordTextField(context,
              title: '网站',
              value: '',
              hintText: '',
              controller: websiteController),
          Divider(),
          buildPasswordTextField(context,
              title: '密码Logo',
              value: '',
              hintText: '',
              controller: webLetterLogoController),
          Divider(),
        ],
      ));
}
