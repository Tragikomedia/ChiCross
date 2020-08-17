import 'package:flutter/material.dart';
import 'package:chinese_picross/components/settings_comps/setting_list_tile_text.dart';

class SettingListTile extends StatelessWidget {
  final String text;
  final Color color;
  final Widget child;

  SettingListTile({@required this.color, @required this.text, @required this.child});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.stop, color: color,),
      title: SettingListTileText(text: text, color: color,),
      trailing: child,
    );
  }
}
