import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:mypass/core/view_models/pass_detail_model.dart';
import 'package:mypass/ui/widgets/toast.dart';
import 'package:provider/provider.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:mypass/config/enums.dart';
import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/core/view_models/user_model.dart';

class PassModel with ChangeNotifier {
  // 状态
  ViewState _state = ViewState.Busy;
  ViewState get state => _state;

  void changeState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  // 新密码
  late AppPasswordModel _newPass;
  get newPass => _newPass;

  // 添加密码
  addPassword(
    BuildContext context, {
    required String email,
    required String username,
    required String website,
    required String webLetterLogo,
    required String password,
  }) async {
    try {
      await context.read<UserModel>().passwordRef.push().set(<String, String>{
        'email': email,
        'username': username,
        'website': website,
        'webLetterLogo': webLetterLogo,
        'password': password
      });
      Navigator.pop(context);
    } catch (e) {
      toastInfo(msg: 'Failed to add new Password');
    }
  }

  // 更新密码
  updatePassword(BuildContext context) async {
    try {
      AppPasswordModel passItem =
          Provider.of<PassDetailModel>(context, listen: false).currentPassItem;

      await context.read<UserModel>().passwordRef.child(passItem.id).update({
        'email': passItem.passEmail,
        'username': passItem.passUsername,
        'website': passItem.passWebsite,
        'webLetterLogo': passItem.webLetterLogo,
        'password': passItem.passPassword
      });

      Navigator.pushNamed(
        context,
        "/pass",
      );
    } catch (e) {
      toastInfo(msg: 'Failed to add new Password');
    }
  }

  // 密码列表
  late PasswordsListResponseModel passList;

  // late DatabaseError _error;

  late StreamSubscription<Event> _passwordSubscription;
  StreamSubscription<Event> get passwordSubscription => _passwordSubscription;

  Future getPasswordList(BuildContext context) async {
    changeState(ViewState.Busy);

    _passwordSubscription = context
        .read<UserModel>()
        .passwordRef
        //context.read<UserModel>().currentUser!.uid
        .limitToLast(10)
        .onChildAdded
        .listen((Event event) {
      print('Child added: ${event.snapshot.value}');
    }, onError: (Object o) {
      final DatabaseError error = o as DatabaseError;
      print('Error: ${error.code} ${error.message}');
    });

    /// api获取用户密码列表
    // passList ;
    // print(passList);
    // notifyListeners();
    changeState(ViewState.Idle);
  }
}
