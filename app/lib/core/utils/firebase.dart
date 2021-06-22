import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:mypass/core/view_models/firebase_model.dart';

class FirebaseUtil {
  /// 初始化firebase
  void initFirebase(BuildContext context) async {
    await Firebase.initializeApp()
        .then((app) => context.read<FirebaseModel>().initFirebaseApp(app));
  }
}
