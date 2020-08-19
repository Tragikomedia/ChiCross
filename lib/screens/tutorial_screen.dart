import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/app_bar/general_app_bar.dart';
import 'package:chinese_picross/components/tutorial_comps/tutorial_page.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:provider/provider.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kPreferredAppBarHeight),
          child: GeneralAppBar(
            text: localization[
                Provider.of<PreferencesProvider>(context, listen: false)
                    .language]['general']['tutorial'],
            textColor: colorSet.strongestColor,
            backgroundColor: colorSet.intermediaryColor,
          )),
      backgroundColor: colorSet.primaryColor,
      body: PageView(
        controller: _pageController,
        children: [
          TutorialPage(title: 'Lol', text: 'Lorem sispsum', textColor: colorSet.secondaryColor),
          TutorialPage(image: Container(decoration: BoxDecoration(border: Border.all(color: colorSet.strongestColor, width: 3.0)),child: Image(image: AssetImage('images/basic.png'),)),title: 'Lol', text: 'Lorem sispsum', textColor: colorSet.secondaryColor)
        ],
      ),
    );
  }
}
