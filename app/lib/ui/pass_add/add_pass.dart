import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/appbar.dart';
import 'components/build_pass_button.dart';
import 'components/pass_form.dart';

class AddPassPage extends StatefulWidget {
  AddPassPage({Key? key}) : super(key: key);

  @override
  _AddPassPageState createState() => _AddPassPageState();
}

class _AddPassPageState extends State<AddPassPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();
  //username的控制器
  final TextEditingController _usernameController = TextEditingController();

  //密码的控制器
  final TextEditingController _passController = TextEditingController();
  //网站的控制器
  final TextEditingController _websiteController = TextEditingController();
  //网站字母logo的控制器
  final TextEditingController _webLetterLogoController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        email: _emailController,
        username: _usernameController,
        website: _websiteController,
        webLetterLogo: _webLetterLogoController,
        password: _passController,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// 模块1： 密码信息
            SizedBox(
              height: 2.h,
            ),
            buildPassForm(context,
                emailController: _emailController,
                usernameController: _usernameController,
                websiteController: _websiteController,
                webLetterLogoController: _webLetterLogoController,
                passController: _passController),
            buildPassButton(),

            /// 模块3：类别
            // _buildBlockHeader('联系人'),
            // _buildBlockConnect(),
            // Divider(
            //   height: duSetHeight(3),
            // ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
