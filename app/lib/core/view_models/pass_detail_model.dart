import 'package:flutter/widgets.dart';
import 'package:mypass/core/values/enums.dart';

class PassDetailModel with ChangeNotifier {
  // 状态
  ViewState _state = ViewState.Busy;
  ViewState get state => _state;

  void changeState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  // 密码信息
  // 两个状态： 明文，密文******
  String _password = '';
  String _showPassword = '';
  String get showPassword => _showPassword;

  putPassword(String password) {
    changeState(ViewState.Busy);
    if (password == null) {
      _password = 'null';
    } else {
      // _password = CipherUtil.decryptPassword(password: password);
      _password = password;
    }
    var regex = new RegExp(r'[a-zA-Z0-9]');
    _showPassword = _password.replaceAll(regex, '*');

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
