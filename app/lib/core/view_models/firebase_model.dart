import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class FirebaseModel with ChangeNotifier {
  late FirebaseApp _globalFirebaseApp;
  FirebaseApp get globalFirebaseApp => _globalFirebaseApp;

  // 用户信息
  late FirebaseAuth _auth;
  FirebaseAuth get auth => _auth;

  // 数据库信息
  late FirebaseDatabase _database;
  FirebaseDatabase get database => _database;

  void initFirebaseApp(FirebaseApp app) {
    _globalFirebaseApp = app;
    _auth = FirebaseAuth.instance;
    _database = FirebaseDatabase(app: _globalFirebaseApp);

    notifyListeners();
  }
}
