import 'package:flutter/material.dart';
import 'package:chinese_picross/components/tutorial_comps/title_text.dart';
import 'package:chinese_picross/components/tutorial_comps/tutorial_content.dart';
import 'package:chinese_picross/components/tutorial_comps/tutorial_image.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:provider/provider.dart';

class TutorialPage extends StatelessWidget {
  final int pageNumber;
  final String imageAddress;
  final Widget imageHolder;

  TutorialPage({@required this.pageNumber, this.imageAddress,}):
  imageHolder = imageAddress != null ? TutorialImage(imageAddress: imageAddress,) : SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    var loc = localization[Provider.of<PreferencesProvider>(context, listen: false).language]['tutorial'][pageNumber];
    var colorSet = ThemeManager.of(context).colorSet;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 50.0),
      child: Container(
        decoration: BoxDecoration(
          color: colorSet.primaryColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TitleText(
                text: loc['title'],
                color: colorSet.secondaryColor,
              ),
              Divider(
                color: colorSet.secondaryColor,
                height: 1,
              ),
              imageHolder,
              Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                child: TutorialContent(
                  content: loc['text'],
                  color: colorSet.secondaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
