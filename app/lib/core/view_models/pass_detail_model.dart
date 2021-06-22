import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'package:mypass/config/enums.dart';
import 'package:mypass/core/entitys/passwords.dart';
import 'package:mypass/core/view_models/user_model.dart';

class PassDetailModel with ChangeNotifier {
  // 状态
  ViewState _state = ViewState.Busy;
  ViewState get state => _state;

  void changeState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  // 当前页面的密码详情
  late AppPasswordModel _currentPassItem;
  AppPasswordModel get currentPassItem => _currentPassItem;

  // 设定密码详情页的密码信息
  setPasswordItem(AppPasswordModel item) {
    changeState(ViewState.Busy);
    _currentPassItem = item;
    changeState(ViewState.Idle);
  }

  // 更新密码
  updatePasswordItem(
    BuildContext context,
    String passId,
  ) async {
    changeState(ViewState.Busy);
    try {
      var respMap =
          await context.read<UserModel>().passwordRef.child(passId).get();
      _currentPassItem =
          AppPasswordModel.fromJson(Map<String, dynamic>.from(respMap!.value));
    } catch (e) {
      // toastInfo(msg: 'Failed to add new Password');
    }
    changeState(ViewState.Idle);
  }

  // 密码信息
  // 两个状态： 明文，密文******
  String _password = '';
  String _showPassword = '';
  String get showPassword => _showPassword;

  putPassword(String password) {
    changeState(ViewState.Busy);
    // if (password == null) {
    //   _password = 'null';
    // } else {
    //   // _password = CipherUtil.decryptPassword(password: password);
    //   _password = password;
    // }
    _password = password;
    // var regex = new RegExp(r'[a-zA-Z0-9]');
    _showPassword = '*' * _password.length;

    // _showPassword = _password;

    changeState(ViewState.Idle);
  }

  bool _isShowPass = false;

  bool get isShowPass => _isShowPass;
  changePassword() {
    changeState(ViewState.Busy);
    _isShowPass = !_isShowPass;
    if (_isShowPass) {
      _showPassword = _password;
    } else {
      _showPassword = '*' * _password.length;
    }
    print(_showPassword);
    changeState(ViewState.Idle);
  }
}
