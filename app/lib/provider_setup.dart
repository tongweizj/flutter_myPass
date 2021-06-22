import 'package:mypass/core/view_models/firebase_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:mypass/core/view_models/pass_detail_model.dart';
import 'package:mypass/core/view_models/pass_model.dart';
import 'package:mypass/core/view_models/user_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<UserModel>(
    // 等使用时，再创建
    create: (_) => UserModel(),
  ),
  ChangeNotifierProvider<PassModel>(
    // 等使用时，再创建
    create: (_) => PassModel(),
  ),
  ChangeNotifierProvider<PassDetailModel>(
    // 等使用时，再创建
    create: (_) => PassDetailModel(),
  ),
  ChangeNotifierProvider<FirebaseModel>(
    // 等使用时，再创建
    create: (_) => FirebaseModel(),
  ),
];
