import 'package:mypass/global.dart';
import 'package:flutter/material.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:mypass/ui/widgets/widgets.dart';
import 'package:mypass/ui/views/add_pass/components/build_pass_button.dart';
import 'package:mypass/ui/views/add_pass/components/pass_form.dart';
import 'package:mypass/core/api/apis.dart';
import 'package:mypass/core/utils/cipher.dart';

class AddPassPage extends StatefulWidget {
  AddPassPage({Key key}) : super(key: key);

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
  // 顶部导航
  Widget _buildAppBar() {
    return passAppBar(
        context: context,
        title: '添加密码',
        backgroundColor: appBgFourth,
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          textColor: appColorThird,
          height: 0,
          padding: EdgeInsets.zero,
          child: Text(
            '取消',
            style: TextStyle(fontSize: duSetFontSize(14)),
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () async {
              /// api 添加用户密码
              Map<String, dynamic> params = {
                "pass_email": _emailController.text,
                "pass_username": _usernameController.text,
                "pass_website": _websiteController.text,
                "web_letter_logo": _webLetterLogoController.text,
                "pass_password":
                    CipherUtil.encryptPassword(password: _passController.text),
                "usr": Global.profile.user.id
              };

              await GqlPasswordAPI.createUserPassword(
                  context: context, params: params);
              // Future.delayed(Duration(milliseconds: 1)).then((e) {
              //   context.read<PassModel>().getPasswordList(context);
              // });
              Navigator.pushNamed(
                context,
                "/home",
              );
            },
            textColor: appColorThird,
            height: 0,
            padding: EdgeInsets.zero,
            child: Text(
              '保存',
              style: TextStyle(fontSize: duSetFontSize(14)),
            ),
          ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// 模块1： 密码信息
            SizedBox(
              height: duSetHeight(2),
            ),
            buildPassForm(context,
                emailController: _emailController,
                usernameController: _usernameController,
                passController: _passController,
                websiteController: _websiteController,
                webLetterLogoController: _webLetterLogoController),
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
