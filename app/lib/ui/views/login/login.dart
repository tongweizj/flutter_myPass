import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mypass/core/utils/validator.dart';
import 'package:mypass/core/view_models/user_model.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:mypass/ui/widgets/widgets.dart';
import 'package:mypass/ui/views/login/components/button.dart';
import 'package:mypass/ui/views/login/components/input.dart';

// import 'package:luci_thermal_personal_app/core/api/apis.dart';

// import 'package:luci_thermal_personal_app/global.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();
  //密码的控制器
  final TextEditingController _passController = TextEditingController();

  // 执行登录操作
  _handleLogin() async {
    /// 1. 表单数据校验
    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: 'Please check your email!');
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: 'Please check your password!');
      return;
    }

    /// 2.登录
    context.read<UserModel>().login(context,
        usernameController: _emailController,
        passwordController: _passController);
  }

  //////////////////////////////////

  // Brand Information block
  Widget _buildBrandInfo() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(44.0)), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: duSetWidth(80),
            width: duSetWidth(80),
            margin: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
            child: Image.asset(
              "assets/images/launch-logo.png",
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    // String _password;
    // final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
    return Container(
      width: duSetWidth(375),
      height: duSetHeight(350),
      margin: EdgeInsets.only(top: duSetHeight(80)),
      padding: EdgeInsets.only(
        top: duSetHeight(40),
        left: duSetWidth(32),
        right: duSetWidth(32),
      ),
      // decoration: BoxDecoration(
      //   color: AppColors.primaryBackground,
      // ),
      child: Column(
        children: [
          // email input
          inputEmailEdit(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "Email",
            marginTop: 0,
          ),
          // password input
          InputPassword(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "Password",
            isPassword: true,
          ),

          // 登录按钮
          btnFlatIconButtonWidget(
            onPressed: () => _handleLogin(),
            width: 300,
            height: 40,
            marginTop: 45,
            gbColor: appColorFirst,
            iconFileName: "secure_login",
          ),
          // Spacer(),
        ],
      ),
    );
  }

  /// 页面组件容器
  Widget _buildPageStructure() {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            child: Scaffold(
                backgroundColor: appBgFivth, //把scaffold的背景色改成透明
                appBar: passAppBar(
                  context: context,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: appiconThird,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: SingleChildScrollView(
                    child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    children: <Widget>[
                      _buildBrandInfo(),
                      _buildInputForm(),
                      Spacer(),
                      // _buildPageFooter(),
                    ],
                  ),
                ))),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPageStructure();
  }
}
