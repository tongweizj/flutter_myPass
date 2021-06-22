import 'package:flutter/material.dart';
import 'package:mypass/ui/style/style.dart';

import 'password_text_field.dart';

// class AddPasswordForm extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => AddPasswordFormState();
// }

// class AddPasswordFormState extends State<AddPasswordForm> {
// //email的控制器
// final TextEditingController _emailController = TextEditingController();
// //username的控制器
// final TextEditingController _usernameController = TextEditingController();

// //密码的控制器
// final TextEditingController _passController = TextEditingController();
// //网站的控制器
// final TextEditingController _websiteController = TextEditingController();
// //网站字母logo的控制器
// final TextEditingController _webLetterLogoController =
//     TextEditingController();
buildPassForm(
  BuildContext context, {
  required TextEditingController usernameController,
  required TextEditingController emailController,
  required TextEditingController passController,
  required TextEditingController websiteController,
  required TextEditingController webLetterLogoController,
})
// @override
// Widget build(BuildContext context) {
{
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
          // Divider(),
          buildPasswordTextField(context,
              controller: emailController,
              title: 'Email',
              hintText: '',
              isEmail: true),
          // Divider(),
          buildPasswordTextField(context,
              controller: passController,
              title: '密码',
              value: '',
              hintText: '',
              isPassword: true),
          // Divider(),
          buildPasswordTextField(context,
              title: '网站',
              value: '',
              hintText: '',
              controller: websiteController),
          // Divider(),
          buildPasswordTextField(context,
              title: '密码Logo',
              value: '',
              hintText: '',
              controller: webLetterLogoController),
          // Divider(),
        ],
      ));
}
