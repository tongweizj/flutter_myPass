import 'package:app_mypass/core/utils/utils.dart';
import 'package:app_mypass/core/values/values.dart';
import 'package:app_mypass/ui/shared/shared.dart';
import 'package:app_mypass/ui/widgets/widgets.dart';
import 'package:app_mypass/ui/views/edit_pass/components/pass_form.dart';
import 'package:app_mypass/ui/views/edit_pass/components/text_edit.dart';
import 'package:app_mypass/ui/views/edit_pass/components/webiste_form.dart';
import 'package:flutter/material.dart';

class EditPassPage extends StatefulWidget {
  EditPassPage({Key key}) : super(key: key);

  @override
  _EditPassPageState createState() => _EditPassPageState();
}

class _EditPassPageState extends State<EditPassPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();
  // 顶部导航
  Widget _buildAppBar() {
    return fouthAppBar(
        context: context,
        title: Text(
          '编辑',
          style: TextStyle(fontSize: duSetFontSize(16)),
        ),
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          textColor: appColorThird,
          height: 0,
          padding: EdgeInsets.zero,
          child: Text(
            '取消',
            style: TextStyle(fontSize: duSetFontSize(14)),
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/home",
              );
            },
            textColor: appColorThird,
            height: 0,
            padding: EdgeInsets.zero,
            child: Text(
              '完成',
              style: TextStyle(fontSize: duSetFontSize(14)),
            ),
          ),
        ]);
  }

  // Widget _buildBlockPassForm() {
  //   return ListView(
  //     shrinkWrap: true,
  //     padding: EdgeInsets.only(
  //         left: duSetWidth(20),
  //         right: duSetWidth(0),
  //         bottom: duSetHeight(0),
  //         top: duSetHeight(10)),
  //     children: <Widget>[
  //       buildTextEdit('姓名', 'gmail'),
  //       Divider(),
  //       buildTextEdit('email', 'tongweizj@gmail.com'),
  //       Divider(),
  //       buildTextEdit('辅助登录', 'tongweizj@gmail.com'),
  //       Divider(),
  //       buildTextEdit('密码', '************'),
  //       Divider(),
  //       buildTextEdit('安全码', '************'),
  //       Divider(),
  //       Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text(
  //               '姓名',
  //               textAlign: TextAlign.start,
  //               style: TextStyle(
  //                 fontSize: duSetFontSize(12),
  //                 color: appTextFurth,
  //                 height: duSetHeight(1),
  //               ),
  //             ),
  //             // email input
  //             inputEmailEdit(
  //               controller: _emailController,
  //               keyboardType: TextInputType.emailAddress,
  //               // hintText: "Email",
  //               marginTop: 0,
  //             ),
  //             // trailing: FlatButton(
  //             //   textColor: appTextThird,
  //             //   onPressed: () {},
  //             //   child: Text(
  //             //     "复制",
  //             //     textAlign: TextAlign.right,
  //             //     style: TextStyle(fontSize: duSetFontSize(14)),
  //             //   ),
  //             //   shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
  //             // ),
  //           ]),
  //       Divider(),
  //       ListTile(
  //         title: Text(
  //           '密码',
  //           style: TextStyle(
  //             fontSize: duSetFontSize(14),
  //             color: appTextFurth,
  //             height: duSetHeight(0),
  //           ),
  //         ),
  //         subtitle: Text(
  //           '*********',
  //           // passItem["password"],
  //           style: TextStyle(
  //               fontSize: duSetFontSize(16),
  //               color: appTextFifth,
  //               height: duSetHeight(2)),
  //         ),
  //         trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
  //           Icon(Icons.visibility),
  //           FlatButton(
  //             textColor: appTextThird,
  //             onPressed: () {},
  //             child: Text(
  //               "复制",
  //               textAlign: TextAlign.right,
  //               style: TextStyle(fontSize: duSetFontSize(14)),
  //             ),
  //             shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
  //           ),
  //         ]),
  //         contentPadding: EdgeInsets.all(0.0),
  //         dense: true,
  //       ),
  //       Divider(),
  //       // ListTile(
  //       //   title: Text(
  //       //     '网站',
  //       //     style: TextStyle(
  //       //       fontSize: duSetFontSize(14),
  //       //       color: appTextFurth,
  //       //       height: duSetHeight(0),
  //       //     ),
  //       //   ),
  //       //   subtitle: Text(
  //       //     passItem["website"],
  //       //     style: TextStyle(
  //       //         fontSize: duSetFontSize(16),
  //       //         color: appTextFifth,
  //       //         height: duSetHeight(2)),
  //       //   ),
  //       //   trailing: FlatButton(
  //       //     textColor: appTextThird,
  //       //     onPressed: () {},
  //       //     child: Text(
  //       //       "打开",
  //       //       textAlign: TextAlign.right,
  //       //       style: TextStyle(fontSize: duSetFontSize(14)),
  //       //     ),
  //       //     shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
  //       //   ),
  //       //   contentPadding: EdgeInsets.all(0.0),
  //       //   dense: true,
  //       // ),
  //     ],
  //   );
  // }

  // Widget _buildBlockHeader(String header) {
  //   return Center(
  //     child: Column(
  //       children: <Widget>[
  //         Divider(
  //           height: duSetHeight(3),
  //         ),
  //         Container(
  //           color: appBgFifth,
  //           height: duSetHeight(40),
  //           width: duSetWidth(375),
  //           padding: EdgeInsets.only(
  //               left: duSetWidth(20),
  //               right: duSetWidth(0),
  //               bottom: duSetHeight(0),
  //               top: duSetHeight(15)),
  //           child: Text(
  //             header,
  //             textAlign: TextAlign.left,
  //             style: TextStyle(
  //               fontSize: duSetFontSize(14),
  //               color: appTextFurth,
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildBlockPassLevel() {
  //   return Container(
  //     color: appBgPrimary,
  //     height: duSetHeight(40),
  //     width: duSetWidth(375),
  //     padding: EdgeInsets.only(
  //         left: duSetWidth(20),
  //         right: duSetWidth(0),
  //         bottom: duSetHeight(0),
  //         top: duSetHeight(0)),
  //     child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
  //       Text(
  //         '安全程度：',
  //         textAlign: TextAlign.left,
  //         style: TextStyle(
  //           fontSize: duSetFontSize(16),
  //           color: appTextFifth,
  //         ),
  //       ),
  //       MaterialButton(
  //         onPressed: () {},
  //         // color: Colors.blue,
  //         textColor: appTextSixth,
  //         minWidth: 30,
  //         height: 0,
  //         padding: EdgeInsets.zero,
  //         child: Text(
  //           '极不安全',
  //           textAlign: TextAlign.left,
  //           style: TextStyle(fontSize: duSetFontSize(16)),
  //         ),
  //       ),
  //     ]),
  //   );
  // }

  // Widget _buildBlockConnect() {
  //   return Container(
  //     color: appBgPrimary,
  //     height: duSetHeight(40),
  //     width: duSetWidth(375),
  //     padding: EdgeInsets.only(
  //         left: duSetWidth(20),
  //         right: duSetWidth(0),
  //         bottom: duSetHeight(0),
  //         top: duSetHeight(0)),
  //     child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
  //       MaterialButton(
  //         onPressed: () {},
  //         // color: Colors.blue,
  //         textColor: appTextThird,
  //         minWidth: 30,
  //         height: 0,
  //         padding: EdgeInsets.zero,
  //         child: Text(
  //           '共享密码',
  //           // textAlign: TextAlign.left,
  //           style: TextStyle(fontSize: duSetFontSize(16)),
  //         ),
  //       ),
  //     ]),
  //   );
  // }

  // /// 用��名输入框
  // Widget inputEmailEdit({
  //   @required TextEditingController controller,
  //   TextInputType keyboardType = TextInputType.text,
  //   String hintText,
  //   bool isPassword = false,
  //   double marginTop = 10,
  // }) {
  //   return Container(
  //     height: duSetHeight(30),
  //     margin: EdgeInsets.only(top: duSetHeight(marginTop)),
  //     // color: appColorFirst,
  //     child: TextField(
  //       controller: controller,
  //       keyboardType: keyboardType,
  //       decoration: InputDecoration(
  //         hintText: hintText,
  //         hintStyle: TextStyle(color: appColorSecond),
  //         contentPadding: EdgeInsets.fromLTRB(0, 2, 0, 5),
  //         border: InputBorder.none,
  //       ),
  //       style: TextStyle(
  //         color: appColorSecond,
  //         fontFamily: "SFProText",
  //         fontWeight: FontWeight.w400,
  //         fontSize: duSetFontSize(14),
  //       ),
  //       maxLines: 1,
  //       autocorrect: false, // 自动纠正
  //       obscureText: isPassword, // 隐藏输入内容, 密码框
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    Map _passItem = {
      "service": "icloud",
      "name": "tongweizj",
      "email": "tongweizj@gmail.com",
      "password": "1234567",
      "website": "http:icloud.com",
    };
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// 模块1： 密码信息
            SizedBox(
              height: duSetHeight(2),
            ),

            buildPassForm(_passItem),
            Divider(),
            SizedBox(height: duSetHeight(40)),
            Divider(),

            /// 模块2：网站信息
            BuildWebsiteForm(),

            /// 模块3：类别
            // _buildBlockHeader('联系人'),
            // _buildBlockConnect(),
            // Divider(
            //   height: duSetHeight(3),
            // ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
