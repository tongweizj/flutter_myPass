import 'package:flutter/material.dart';
import 'package:mypass/core/view_models/pass_detail_model.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:provider/provider.dart';

class PasswordShow extends StatefulWidget {
  const PasswordShow(String s, {this.password});

  final String password;

  @override
  _PasswordShowState createState() => _PasswordShowState();
}

class _PasswordShowState extends State<PasswordShow> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(
          duSetWidth(0), duSetHeight(10), duSetWidth(0), duSetHeight(0)),
      title: Text(
        '密码',
        style: TextStyle(
          fontSize: duSetFontSize(14),
          color: appTextFurth,
          height: duSetHeight(0),
        ),
      ),
      subtitle: Text(
        '${context.watch<PassDetailModel>().showPassword}',
        // passItem["password"],
        style: TextStyle(
            fontSize: duSetFontSize(16),
            color: appTextFifth,
            height: duSetHeight(2)),
      ),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        // Icon(Icons.visibility),
        GestureDetector(
          onTap: () {
            context.read<PassDetailModel>().changePassword();
          },
          child: new Icon(context.watch<PassDetailModel>().isShowPass
              ? Icons.visibility_off
              : Icons.visibility),
        ),
        FlatButton(
          textColor: appTextThird,
          onPressed: () {},
          child: Text(
            "复制",
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: duSetFontSize(14)),
          ),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ]),
      dense: true,
    );
  }
}
