import 'package:flutter/material.dart';
import 'package:mypass/core/view_models/pass_detail_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/core/view_models/pass_model.dart';
import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/core/utils/cipher.dart';

import 'package:mypass/ui/widgets/pass_detail_appbar.dart';
import 'package:mypass/ui/style/style.dart';
import 'components/pass_form.dart';

class PassEditPage extends StatefulWidget {
  PassEditPage({Key? key}) : super(key: key);

  @override
  _PassEditPageState createState() => _PassEditPageState();
}

class _PassEditPageState extends State<PassEditPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();
  //username的控制器
  final TextEditingController _usernameController = TextEditingController();

  //密码的控制器
  final TextEditingController _passController = TextEditingController();
  //网站的控制器
  final TextEditingController _websiteController = TextEditingController();
  //网站字母logo的控制器
  final TextEditingController _webLetterLogo = TextEditingController();

  Widget _buildBlockConnect(AppPasswordModel passItem) {
    return Container(
      color: StyleColors.appBgPrimary,
      height: 40.h,
      width: duSetWidth(375),
      padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
      child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        MaterialButton(
          onPressed: () async {
            Navigator.pushNamed(
              context,
              "/home",
            );
          },
          textColor: StyleColors.appTextThird,
          minWidth: 30.w,
          height: 0,
          padding: EdgeInsets.zero,
          child: Text(
            '删除',
            style: TextStyle(fontSize: duSetFontSize(16)),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final AppPasswordModel passItem =
    //     ModalRoute.of(context)!.settings.arguments as AppPasswordModel;
    AppPasswordModel passItem =
        context.watch<PassDetailModel>().currentPassItem;
    return Scaffold(
      appBar: buildPassDetailAppBar(
        context,
        title: '修改密码',
        onPressed: () {
          /// 更新currentPassItem状态
          passItem.passEmail = _emailController.text;
          passItem.passPassword =
              CipherUtil.encryptPassword(password: _passController.text);
          passItem.passUsername = _usernameController.text;
          passItem.passWebsite = _websiteController.text;
          passItem.webLetterLogo = _webLetterLogo.text;

          /// 更新密码
          context.read<PassModel>().updatePassword(
                context,
              );
          // context
          //     .read<PassDetailModel>()
          //     .updatePasswordItem(context, passItem.id);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// 模块1： 密码信息
            SizedBox(height: 2.h),

            buildPassForm(context,
                passItem: passItem,
                emailController: _emailController,
                usernameController: _usernameController,
                passController: _passController,
                websiteController: _websiteController,
                webLetterLogoController: _webLetterLogo),
            Divider(),
            SizedBox(height: 40.h),
            Divider(),
            _buildBlockConnect(passItem),

            /// 模块2：网站信息
            // BuildWebsiteForm(),

            /// 模块3：类别
            // _buildBlockHeader('联系人'),
            // _buildBlockConnect(),
            // Divider(
            //   height: 3),
            // ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
