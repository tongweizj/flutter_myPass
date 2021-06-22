import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mypass/ui/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/core/view_models/user_model.dart';
import 'package:mypass/ui/style/style.dart';

import 'input_textField.dart';

class EmailPasswordForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => EmailPasswordFormState();
}

class EmailPasswordFormState extends State<EmailPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: 375.w,
        height: 350.h,
        margin: EdgeInsets.only(top: 80.h),
        padding: EdgeInsets.only(
          top: 40.h,
          left: 32.w,
          right: 32.w,
        ),
        child: Column(
          children: <Widget>[
            // email input
            inputTextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
              marginTop: 0,
            ),
            // password input
            inputTextField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: "Password",
              isPassword: true,
            ),
            SizedBox(height: 30.h),
            // 登录按钮
            longRectangleBtnWidget(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await context.read<UserModel>().signInWithEmailAndPassword(
                        context,
                        emailontroller: _emailController,
                        passwordController: _passwordController,
                      );
                }
              },
              title: '登 陆',
              width: 0.8.sw,
              height: 30.h,
              gbColor: StyleColors.appColorFirst,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
