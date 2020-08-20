import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/app_bar/general_app_bar.dart';
import 'package:chinese_picross/components/tutorial_comps/tutorial_page.dart';
import 'package:chinese_picross/components/tutorial_comps/title_text.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/utilities/tutorial_utils/tutorial_images.dart';
import 'package:flushbar/flushbar.dart';
import 'package:provider/provider.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  PageController _pageController;
  double _currentPageValue;

  @override
  void initState() {
    _pageController = PageController();
    _currentPageValue = 0.0;
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page;
      });
    });
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var colorSet = ThemeManager.of(context).colorSet;
      Flushbar(
        messageText: TitleText(text: localization[Provider.of<PreferencesProvider>(context, listen: false).language]['general']['tutorialmessage'], color: colorSet.strongestColor,),
        backgroundColor: colorSet.primaryColor,
        duration: Duration(seconds: 3),
      )..show(context);
    });
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
      backgroundColor: colorSet.secondaryColor,
      body: PageView.builder(
        controller: _pageController,
        itemCount: tutorialImages.length,
        itemBuilder: (context, index) {
          return Transform(
            transform: Matrix4.identity()..rotateX(_currentPageValue - index),
            child: TutorialPage(
              pageNumber: index,
              imageAddress: tutorialImages[index],
            ),
          );
        },
      ),
    );
  }
}
