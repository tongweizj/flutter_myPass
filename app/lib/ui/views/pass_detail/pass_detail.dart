import 'package:flutter/material.dart';

import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:mypass/ui/widgets/widgets.dart';

class PassDetailPage extends StatefulWidget {
  PassDetailPage({Key key}) : super(key: key);

  @override
  _PassDetailPageState createState() => _PassDetailPageState();
}

class _PassDetailPageState extends State<PassDetailPage> {
  @override
  Widget build(BuildContext context) {
    final AppPasswordModel passItem = ModalRoute.of(context).settings.arguments;

    // void initState() {
    //   super.initState();

    //   /// 加载
    //   Future.delayed(Duration(milliseconds: 0)).then((e) {
    //     context.watch<PassDetailModel>().putPassword(passItem.passPassword);
    //   });
    // }

    return Scaffold(
      appBar: buildAppBarBlock(context, passItem),
      body: Container(
        color: appBgFifth,
        child: Column(
          children: <Widget>[
            /// 模块1： 头部
            buildPageHeaderBlock(
              passItem.webLetterLogo,
              passItem.passUsername,
            ),

            /// 模块2： 密码信息
            SizedBox(
              height: duSetHeight(2),
            ),
            buildPassInfoBlock(context, passItem),

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
