import 'package:flutter/material.dart';
import 'package:chinese_picross/components/tutorial_comps/title_text.dart';
import 'package:chinese_picross/components/tutorial_comps/tutorial_content.dart';

class TutorialPage extends StatelessWidget {
  final String title;
  final String text;
  final Widget image;
  final Color textColor;
  final Widget imageHolder;

  TutorialPage({@required this.title, @required this.text, @required this.textColor, this.image}):
  imageHolder = image ?? SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          text: text,
          color: textColor,
        ),
        Divider(
          color: textColor,
          height: 4.0,
        ),
        imageHolder,
        TutorialContent(
          content: text,
          color: textColor,
        )
      ],
    );
  }
}
