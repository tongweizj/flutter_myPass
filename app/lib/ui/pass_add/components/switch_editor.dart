import 'package:flutter/material.dart';

// class SwitchEditor extends StatefulWidget {
//   SwitchEditor({Key key}) : super(key: key);

//   @override
//   _SwitchEditorState createState() => _SwitchEditorState();
// }

// class _SwitchEditorState extends State<SwitchEditor> {
//   bool _lights = false;

//   @override
//   Widget build(BuildContext context) {
//     return SwitchListTile(
//       title: const Text('Lights'),
//       value: _lights,
//       onChanged: (bool value) {
//         setState(() {
//           _lights = value;
//         });
//       },
//       // secondary: const Icon(Icons.lightbulb_outline),
//     );
//   }
// }

class LabeledSwitch extends StatelessWidget {
  const LabeledSwitch({
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Switch(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}
