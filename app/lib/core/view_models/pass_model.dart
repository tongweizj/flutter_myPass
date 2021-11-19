import 'package:mypass/core/api/passwords.dart';
import 'package:mypass/core/entitys/passwords.dart';
import 'package:mypass/core/enums/viewstate.dart';
import 'package:mypass/global.dart';
import 'package:flutter/widgets.dart';

class PassModel with ChangeNotifier {
  // 状态
  ViewState _state = ViewState.Busy;
  ViewState get state => _state;

  void changeState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  // 新密码
  AppPasswordModel _newPass;
  get newPass => _newPass;

  // 初始化
  AddPassModel() {
    this._newPass.id = "";
    this._newPass.passUsername = "";
    this._newPass.passEmail = "";
    this._newPass.passPassword = "";
    this._newPass.passWebsite = "";
  }

  // 更新
  inputPassUsername(String userName) {
    this._newPass.passUsername = userName;
    notifyListeners();
  }

  createPassword(String userName) {
    this._newPass.passUsername = userName;
    notifyListeners();
  }

  // 密码列表
  PasswordsListResponseModel passList;
  // PasswordsListResponseEntity get passList => _passList;

  Future getPasswordList(BuildContext context) async {
    changeState(ViewState.Busy);

    /// api获取用户密码列表
    passList = await GqlPasswordAPI.getUserPasswordList(
      context: context,
      params: {"username": Global.profile.user.username},
    );
    // print(passList);
    // notifyListeners();
    changeState(ViewState.Idle);
  }
}
