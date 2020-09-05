import 'package:app_mypass/core/utils/utils.dart';
import 'package:app_mypass/ui/shared/shared.dart';

import 'package:app_mypass/ui/widgets/widgets.dart';
import 'package:app_mypass/ui/views/add_pass/components/build_pass_button.dart';
import 'package:app_mypass/ui/views/add_pass/components/pass_form.dart';
import 'package:app_mypass/ui/views/add_pass/components/text_edit.dart';
import 'package:app_mypass/ui/views/add_pass/components/webiste_form.dart';
import 'package:flutter/material.dart';

class AddPassPage extends StatefulWidget {
  AddPassPage({Key key}) : super(key: key);

  @override
  _AddPassPageState createState() => _AddPassPageState();
}

class _AddPassPageState extends State<AddPassPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();
  // 顶部导航
  Widget _buildAppBar() {
    return fouthAppBar(
        context: context,
        title: Text(
          '添加密码',
          style: TextStyle(fontSize: duSetFontSize(16)),
        ),
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
            onPressed: () {
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
    Map _passItem = {
      "service": "icloud",
      "name": "tongweizj",
      "email": "tongweizj@gmail.com",
      "password": "1234567",
      "website": "http:icloud.com",
    };
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// 模块1： 密码信息
            SizedBox(
              height: duSetHeight(2),
            ),

            buildPassForm(_passItem),

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
