import 'package:mypass/core/api/apis.dart';
import 'package:mypass/core/entitys/cipher.dart';
import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/core/utils/cipher.dart';
import 'package:mypass/core/values/enums.dart';
import 'package:mypass/core/utils/utils.dart';
import 'package:mypass/core/values/values.dart';
import 'package:flutter/widgets.dart';
import 'package:mypass/global.dart';

class UserModel with ChangeNotifier {
  // 状态
  ViewState _state = ViewState.Busy;
  ViewState get state => _state;
  void changeState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future login(
    BuildContext context, {
    TextEditingController usernameController,
    TextEditingController passwordController,
  }) async {
    changeState(ViewState.Busy);

    /// api获取用户密码列表
    UserLoginRequestEntity variables = UserLoginRequestEntity(
      identifier: usernameController.value.text,
      password:
          CipherUtil.encryptUserLoginPassword(passwordController.value.text),
    );
    try {
      UserLoginResponseEntity userProfile = await GqlUserAPI.login(
        context: context,
        variables: variables,
      );

      Global.profile = userProfile;
      Global.saveProfile(Global.profile);

      Navigator.pushNamed(
        context,
        "/home",
      );
    } catch (e) {
      print(e);
      // return toastInfo(msg: '请正确输入账号、密码！');
    }
    // print(passList);
    // notifyListeners();
    changeState(ViewState.Idle);
  }

  Future logout() async {
    changeState(ViewState.Busy);

    /// 删除用户信息
    Global.profile = UserLoginResponseEntity();
    Global.cipher = CipherEntity();

    StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
    StorageUtil().remove(STORAGE_USER_CIPHER_KEY);
    changeState(ViewState.Idle);
  }
}
