import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/ui/style/style.dart';
import 'package:mypass/ui/widgets/appbar_widgets.dart';
import 'package:mypass/ui/widgets/button_widgets.dart';

import 'package:mypass/core/entitys/entitys.dart';
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

PreferredSizeWidget buildAppBarBlock(
    BuildContext context, AppPasswordModel passItem) {
  return passAppBar(
      context: context,
      title: "",
      backgroundColor: StyleColors.appBgSeventh,
      leading: SizedBox(
          width: 22.w,
          child: IconButton(
            padding: EdgeInsets.all(0.0),
            icon: Icon(
              Icons.arrow_back_ios,
              color: StyleColors.appBgPrimary,
            ),
            iconSize: 16,
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/home",
              );
            },
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/edit_pass", arguments: passItem);
          },
          child: Text(
            "编辑",
            style: TextStyle(
              fontSize: duSetFontSize(14),
              color: Colors.white,
            ),
          ),
        ),
      ]);
}

Widget buildPageHeaderBlock(String title, String subtitle) {
  return Container(
      color: StyleColors.appBgSeventh,
      width: 1.sw,
      height: 115.h,
      child: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20.h),
            width: 48.w,
            height: 48.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: StyleColors.appBgThird,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                )),
            child: Text(
              title,
              style: TextStyle(
                color: StyleColors.appBgSeventh,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(32),
                height: 1.h,
              ),
            )),
        Text(
          subtitle,
          style: TextStyle(
            color: StyleColors.appColorThird,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: duSetFontSize(14),
            height: 1.h,
          ),
        )
      ]));
}

Widget _buildPassBlock({String? title, String? subtitle, Widget? trailing}) {
  return ListTile(
    contentPadding: EdgeInsets.fromLTRB(0, 20.h, 0, 5.h),
    title: Text(
      title!,
      style: TextStyle(
        fontSize: duSetFontSize(14),
        color: StyleColors.appTextFurth,
        height: 0,
      ),
    ),
    subtitle: Text(
      subtitle!,
      style: TextStyle(
          fontSize: duSetFontSize(16),
          color: StyleColors.appTextFifth,
          height: 2.h),
    ),
    trailing: trailing,
    dense: true,
  );
}

Widget buildPassInfoBlock(BuildContext context) {
  // if (context.watch<PassDetailModel>().state == ViewState.Idle) {
  //   print(context.watch<PassDetailModel>().currentPassItem);
  // }
  AppPasswordModel passItem = context.watch<PassDetailModel>().currentPassItem;
  return Container(
      color: StyleColors.appBgPrimary,
      margin: EdgeInsets.fromLTRB(0, 15.h, 0, 0),
      padding: EdgeInsets.fromLTRB(20.w, 15.h, 0, 0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          _buildPassBlock(
              title: '电子邮件',
              subtitle: context
                  .watch<PassDetailModel>()
                  .currentPassItem
                  .passEmail, // passItem.passEmail,
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                btnCopyPasswordWidget(passItem.passEmail),
                SizedBox(
                  width: 20.w,
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
                width: 20.w,
              ),
              btnCopyPasswordWidget(passItem.passPlainPassword),
              SizedBox(
                width: 20.w,
              )
            ]),
          ),
          Divider(),
          _buildPassBlock(
            title: '网站',
            subtitle: passItem.passWebsite,
            trailing: TextButton(
              onPressed: () => _launchInBrowser(passItem.passWebsite), //() {},
              child: Text(
                "打开",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: duSetFontSize(14),
                  color: StyleColors.appTextThird,
                ),
              ),
            ),
          ),
        ],
      ));
}
