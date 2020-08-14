import 'package:flutter/material.dart';
import 'package:chinese_picross/components/game_comps/finished_game/description_text.dart';

class DescriptionTextTile extends StatelessWidget {
  final String firstText;
  final String secondText;
  final bool isFirstTextChinese;
  final bool isSecondTextChinese;
  final Color textColor;

  DescriptionTextTile({@required this.textColor, @required this.firstText, this.secondText, this.isFirstTextChinese = false, this.isSecondTextChinese = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: secondText != null ? Icon(Icons.label_important, color: textColor,) : SizedBox.shrink(),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DescriptionText(text: firstText, color: textColor, isChinese: isFirstTextChinese,),
        secondText != null ? DescriptionText(text: secondText, color: textColor, isChinese: isSecondTextChinese,) : SizedBox.shrink()
      ],),
    );
  }
}
