import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/core/view_models/pass_detail_model.dart';
import 'package:mypass/ui/style/style.dart';

import 'components/pass_detail_page_widget.dart';

class PassDetailPage extends StatefulWidget {
  PassDetailPage({Key? key}) : super(key: key);

  @override
  _PassDetailPageState createState() => _PassDetailPageState();
}

class _PassDetailPageState extends State<PassDetailPage> {
  @override
  Widget build(BuildContext context) {
    // final AppPasswordModel passItem =
    //     ModalRoute.of(context)!.settings.arguments as AppPasswordModel;
    AppPasswordModel passItem =
        context.watch<PassDetailModel>().currentPassItem;
    print(passItem);
    return Scaffold(
      appBar: buildAppBarBlock(context, passItem),
      body: Container(
        color: StyleColors.appBgFifth,
        child: Column(
          children: <Widget>[
            /// 模块1： 头部
            buildPageHeaderBlock(
              passItem.webLetterLogo,
              passItem.passUsername,
            ),

            /// 模块2： 密码信息
            SizedBox(
              height: 2.h,
            ),
            buildPassInfoBlock(context),

            /// 密码安全程度
            // _buildBlockHeader('密码安全程度'),
            // _buildBlockPassLevel(),

            /// 密码共享
            // _buildBlockHeader('联系人'),
            // _buildBlockConnect(),
            Divider(
              height: 3.h,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
