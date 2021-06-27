import 'package:flutter/widgets.dart';
import 'package:mypass/config/global.dart';
import 'package:mypass/config/storage.dart';
import 'package:mypass/core/utils/cipher.dart';
import 'package:mypass/core/utils/storage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mypass/ui/widgets/toast.dart';

import 'package:mypass/config/enums.dart';
import 'package:mypass/core/view_models/firebase_model.dart';

class UserModel with ChangeNotifier {
  // 状态
  ViewState _state = ViewState.Busy;
  ViewState get state => _state;
  void changeState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  /// 当前用户profile
  User? _currentUser;
  User? get currentUser => _currentUser;

  // 当前用户密码数据
  late DatabaseReference _passwordRef;
  DatabaseReference get passwordRef => _passwordRef;

  // 初始化用户各类数据
  initUserDB(BuildContext context, String uid) {
    _passwordRef = context
        .read<FirebaseModel>()
        .database
        .reference()
        .child('passwords')
        .child(uid);
  }

  // 用户登陆
  Future signInWithEmailAndPassword(
    BuildContext context, {
    required TextEditingController emailontroller,
    required TextEditingController passwordController,
  }) async {
    changeState(ViewState.Busy);

    try {
      _currentUser =
          (await context.read<FirebaseModel>().auth.signInWithEmailAndPassword(
                    email: emailontroller.text,
                    password: CipherUtil.encryptUserLoginPassword(
                        passwordController.text),
                  ))
              .user;
      toastInfo(msg: '${_currentUser!.email} signed in');
      Global.userID = _currentUser!.uid;
      initUserDB(context, _currentUser!.uid); // 初始化用户数据库
      Global.isLogin = true; // 修改是否登陆状态
      StorageUtil().setBool(STORAGE_USER_ALREADY_LOGIN_KEY, true);
      StorageUtil().setStr(STORAGE_USER_USER_ID_KEY, _currentUser!.uid);
      Future.delayed(Duration(milliseconds: 100)).then((e) {
        Navigator.pushNamed(
          context,
          "/home",
        );
      });
    } catch (e) {
      toastInfo(msg: 'Failed to sign in with Email & Password');
    }
    changeState(ViewState.Idle);
  }

  /// 用户推出
  /// TODO
  Future logout() async {
    changeState(ViewState.Busy);

    /// 删除用户信息
    // Global.profile = UserLoginResponseEntity();
    // Global.cipher = CipherEntity();
    Global.isLogin = false;
    StorageUtil().remove(STORAGE_USER_ALREADY_LOGIN_KEY);
    StorageUtil().remove(STORAGE_USER_USER_ID_KEY);

    changeState(ViewState.Idle);
  }
}
