import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/description_card/description_text.dart';

class DescriptionTextTile extends StatelessWidget {
  final String firstText;
  final String secondText;
  final bool isFirstTextChinese;
  final bool isSecondTextChinese;
  final Color textColor;
  final Color backgroundColor;

  DescriptionTextTile({@required this.textColor, @required this.backgroundColor, @required this.firstText, this.secondText, this.isFirstTextChinese = false, this.isSecondTextChinese = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.5),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: textColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),),
        child: ListTile(
          leading: secondText != null ? Icon(Icons.fiber_manual_record, color: textColor,) : SizedBox.shrink(),
          title: Wrap(alignment: WrapAlignment.spaceBetween,
          children: [
            DescriptionText(text: firstText, color: textColor, isChinese: isFirstTextChinese,),
            secondText != null ? DescriptionText(text: secondText, color: textColor, isChinese: isSecondTextChinese,) : SizedBox.shrink()
          ],),
        ),
      ),
    );
  }
}
