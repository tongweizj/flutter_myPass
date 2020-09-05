import 'package:app_mypass/ui/shared/shared.dart';
import 'package:app_mypass/ui/views/edit_pass/components/switch_editor.dart';
import 'package:app_mypass/ui/views/edit_pass/components/text_edit.dart';
import 'package:flutter/material.dart';

import 'package:app_mypass/core/utils/utils.dart';
import 'package:app_mypass/core/values/values.dart';

class BuildWebsiteForm extends StatefulWidget {
  BuildWebsiteForm({Key key}) : super(key: key);

  @override
  _BuildWebsiteFormState createState() => _BuildWebsiteFormState();
}

class _BuildWebsiteFormState extends State<BuildWebsiteForm> {
  bool _isSelected = true;
  bool _isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        padding: EdgeInsets.only(
            left: duSetWidth(20),
            right: duSetWidth(0),
            bottom: duSetHeight(0),
            top: duSetHeight(10)),
        child: Column(
          children: <Widget>[
            buildTextEdit('网站', 'http://gmail.com'),
            Divider(),
            buildTextEdit('email', 'tongweizj@gmail.com'),
            Divider(),
            LabeledSwitch(
              label: '自动登录',
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              value: _isSelected,
              onChanged: (bool newValue) {
                setState(() {
                  _isSelected = newValue;
                });
              },
            ),
            Divider(),
            LabeledSwitch(
              label: '仅限子域',
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              value: _isSelected2,
              onChanged: (bool newValue2) {
                setState(() {
                  _isSelected2 = newValue2;
                });
              },
            ),
          ],
        ));
  }
}
