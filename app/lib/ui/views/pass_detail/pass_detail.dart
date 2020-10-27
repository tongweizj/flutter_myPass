import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/core/utils/utils.dart';
import 'package:mypass/core/values/values.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:mypass/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PassDetailPage extends StatefulWidget {
  PassDetailPage({Key key}) : super(key: key);

  @override
  _PassDetailPageState createState() => _PassDetailPageState();
}

class _PassDetailPageState extends State<PassDetailPage> {
  // 顶部导航
  Widget _buildAppBar(AppPasswordModel passItem) {
    return thirdAppBar(
        context: context,
        title: Text(
          "",
          style: TextStyle(
            color: appColorThird,
            fontFamily: 'Montserrat',
            fontSize: duSetFontSize(14.0),
            fontWeight: FontWeight.w400,
          ),
        ),
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

  Widget _buildPageHeader(String title, String subtitle) {
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

  Widget _buildBlockPassInfo(AppPasswordModel passItem) {
    return Container(
        color: appBgPrimary,
        margin: EdgeInsets.fromLTRB(
            duSetWidth(0), duSetHeight(15), duSetWidth(0), duSetWidth(0)),
        padding: EdgeInsets.fromLTRB(
            duSetWidth(20), duSetHeight(15), duSetWidth(0), duSetWidth(0)),
        child: ListView(
          shrinkWrap: true,
          // padding: EdgeInsets.only(
          //     left: duSetWidth(20),
          //     right: duSetWidth(0),
          //     top: duSetHeight(0),
          //     bottom: duSetHeight(10)),
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(
                  duSetWidth(0), duSetHeight(0), duSetWidth(0), duSetHeight(5)),
              title: Text(
                '电子邮件',
                style: TextStyle(
                  fontSize: duSetFontSize(14),
                  color: appTextFurth,
                  height: duSetHeight(0),
                ),
              ),
              subtitle: Text(
                passItem.passEmail,
                style: TextStyle(
                    fontSize: duSetFontSize(16),
                    color: appTextFifth,
                    height: duSetHeight(2)),
              ),
              trailing: FlatButton(
                textColor: appTextThird,
                onPressed: () {},
                child: Text(
                  "复制",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: duSetFontSize(14)),
                ),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
              ),
              dense: true,
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(duSetWidth(0),
                  duSetHeight(10), duSetWidth(0), duSetHeight(0)),
              title: Text(
                '密码',
                style: TextStyle(
                  fontSize: duSetFontSize(14),
                  color: appTextFurth,
                  height: duSetHeight(0),
                ),
              ),
              subtitle: Text(
                '*********',
                // passItem["password"],
                style: TextStyle(
                    fontSize: duSetFontSize(16),
                    color: appTextFifth,
                    height: duSetHeight(2)),
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Icon(Icons.visibility),
                FlatButton(
                  textColor: appTextThird,
                  onPressed: () {},
                  child: Text(
                    "复制",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: duSetFontSize(14)),
                  ),
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
              ]),
              dense: true,
            ),
            Divider(),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(duSetWidth(0),
                  duSetHeight(15), duSetWidth(0), duSetHeight(0)),
              title: Text(
                '网站',
                style: TextStyle(
                  fontSize: duSetFontSize(14),
                  color: appTextFurth,
                  height: duSetHeight(0),
                ),
              ),
              subtitle: Text(
                passItem.passWebsite,
                style: TextStyle(
                    fontSize: duSetFontSize(16),
                    color: appTextFifth,
                    height: duSetHeight(2)),
              ),
              trailing: FlatButton(
                textColor: appTextThird,
                onPressed: () {},
                child: Text(
                  "打开",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: duSetFontSize(14)),
                ),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
              ),
              dense: true,
            ),
          ],
        ));
  }

  Widget _buildBlockHeader(String header) {
    return Center(
      child: Column(
        children: <Widget>[
          Divider(
            height: duSetHeight(3),
          ),
          Container(
            color: appBgFifth,
            height: duSetHeight(40),
            width: duSetWidth(375),
            padding: EdgeInsets.only(
                left: duSetWidth(20),
                right: duSetWidth(0),
                bottom: duSetHeight(0),
                top: duSetHeight(15)),
            child: Text(
              header,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: duSetFontSize(14),
                color: appTextFurth,
              ),
            ),
          )
        ],
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    final AppPasswordModel passItem = ModalRoute.of(context).settings.arguments;
    // Map _passItem = {
    //   "service": "icloud",
    //   "name": "tongweizj",
    //   "email": "tongweizj@gmail.com",
    //   "password": "1234567",
    //   "website": "http:icloud.com",
    // };
    return Scaffold(
      appBar: _buildAppBar(passItem),
      body: Container(
        color: appBgFifth,
        child: Column(
          children: <Widget>[
            /// 模块1： 头部
            _buildPageHeader(
              passItem.webLetterLogo,
              passItem.passUsername,
            ),

            /// 模块2： 密码信息
            SizedBox(
              height: duSetHeight(2),
            ),
            _buildBlockPassInfo(passItem),

            /// 密码安全程度
            // _buildBlockHeader('密码安全程度'),
            // _buildBlockPassLevel(),

            /// 密码共享
            // _buildBlockHeader('联系人'),
            // _buildBlockConnect(),
            Divider(
              height: duSetHeight(3),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
