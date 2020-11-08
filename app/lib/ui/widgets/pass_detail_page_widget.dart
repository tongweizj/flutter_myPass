// 顶部导航
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:mypass/ui/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mypass/core/view_models/pass_detail_model.dart';

Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    );
  } else {
    throw 'Could not launch $url';
  }
}

_launchURL(String url) async {
  // const url = 'https://flutter.dev';
  url = 'http://www.' + url;
  if (await canLaunch(url)) {
    await _launchInBrowser(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget buildAppBarBlock(BuildContext context, AppPasswordModel passItem) {
  return passAppBar(
      context: context,
      title: "",
      backgroundColor: appBgSeventh,
      leading: SizedBox(
          width: 22.0,
          child: IconButton(
            padding: new EdgeInsets.all(0.0),
            icon: Icon(
              Icons.arrow_back_ios,
              color: appBgPrimary,
            ),
            iconSize: 16,
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      actions: <Widget>[
        FlatButton(
          textColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, "/edit_pass", arguments: passItem);
          },
          child: Text(
            "编辑",
            style: TextStyle(fontSize: duSetFontSize(14)),
          ),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
        ),
      ]);
}

Widget buildPageHeaderBlock(String title, String subtitle) {
  return Container(
      color: appBgSeventh,
      width: duSetWidth(375),
      height: duSetHeight(115),
      child: Column(children: <Widget>[
        Container(
            margin:
                EdgeInsets.only(top: duSetHeight(0), bottom: duSetHeight(20)),
            width: duSetWidth(48),
            height: duSetWidth(48),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: appBgThird,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                )),
            child: Text(
              title,
              style: TextStyle(
                color: appBgSeventh,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(32),
                height: 1,
              ),
            )),
        Text(
          subtitle,
          style: TextStyle(
            color: appColorThird,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: duSetFontSize(14),
            height: 1,
          ),
        )
      ]));
}

Widget _buildPassBlock({String title, String subtitle, Widget trailing}) {
  return ListTile(
    contentPadding: EdgeInsets.fromLTRB(
        duSetWidth(0), duSetHeight(20), duSetWidth(0), duSetHeight(5)),
    title: Text(
      title,
      style: TextStyle(
        fontSize: duSetFontSize(14),
        color: appTextFurth,
        height: duSetHeight(0),
      ),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(
          fontSize: duSetFontSize(16),
          color: appTextFifth,
          height: duSetHeight(2)),
    ),
    trailing: trailing,
    dense: true,
  );
}

Widget buildPassInfoBlock(BuildContext context, AppPasswordModel passItem) {
  return Container(
      color: appBgPrimary,
      margin: EdgeInsets.fromLTRB(
          duSetWidth(0), duSetHeight(15), duSetWidth(0), duSetWidth(0)),
      padding: EdgeInsets.fromLTRB(
          duSetWidth(20), duSetHeight(15), duSetWidth(0), duSetWidth(0)),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          _buildPassBlock(
              title: '电子邮件',
              subtitle: passItem.passEmail,
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                btnCopyPasswordWidget(passItem.passEmail),
                SizedBox(
                  width: duSetWidth(20),
                )
              ])),
          Divider(),
          // PasswordShow('123456'),
          // Divider(),
          _buildPassBlock(
            title: '密码',
            subtitle: context.watch<PassDetailModel>().showPassword,
            trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              GestureDetector(
                onTap: () {
                  context.read<PassDetailModel>().changePassword();
                },
                child: new Icon(context.watch<PassDetailModel>().isShowPass
                    ? Icons.visibility
                    : Icons.visibility_off),
              ),
              SizedBox(
                width: duSetWidth(20),
              ),
              btnCopyPasswordWidget(passItem.passPassword_plain),
              SizedBox(
                width: duSetWidth(20),
              )
            ]),
          ),
          Divider(),
          _buildPassBlock(
            title: '网站',
            subtitle: passItem.passWebsite,
            trailing: FlatButton(
              textColor: appTextThird,
              onPressed: () => _launchInBrowser(passItem.passWebsite), //() {},
              child: Text(
                "打开",
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: duSetFontSize(14)),
              ),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
          ),
        ],
      ));
}

/// 暂时没有用
Widget _buildBlockPassLevel() {
  return Container(
    color: appBgPrimary,
    height: duSetHeight(40),
    width: duSetWidth(375),
    padding: EdgeInsets.only(
        left: duSetWidth(20),
        right: duSetWidth(0),
        bottom: duSetHeight(0),
        top: duSetHeight(0)),
    child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Text(
        '安全程度：',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: duSetFontSize(16),
          color: appTextFifth,
        ),
      ),
      MaterialButton(
        onPressed: () {},
        // color: Colors.blue,
        textColor: appTextSixth,
        minWidth: 30,
        height: 0,
        padding: EdgeInsets.zero,
        child: Text(
          '极不安全',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: duSetFontSize(16)),
        ),
      ),
    ]),
  );
}

/// 暂时没有用
Widget _buildBlockConnect() {
  return Container(
    color: appBgPrimary,
    height: duSetHeight(40),
    width: duSetWidth(375),
    padding: EdgeInsets.only(
        left: duSetWidth(20),
        right: duSetWidth(0),
        bottom: duSetHeight(0),
        top: duSetHeight(0)),
    child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
      MaterialButton(
        onPressed: () {},
        // color: Colors.blue,
        textColor: appTextThird,
        minWidth: 30,
        height: 0,
        padding: EdgeInsets.zero,
        child: Text(
          '共享密码',
          // textAlign: TextAlign.left,
          style: TextStyle(fontSize: duSetFontSize(16)),
        ),
      ),
    ]),
  );
}
