import 'package:flutter/material.dart';
import 'package:chinese_picross/components/menu_comps/main_menu.dart';
import 'package:chinese_picross/components/menu_comps/logo.dart';
import 'package:chinese_picross/components/menu_comps/menu_popup_text.dart';
import 'package:chinese_picross/components/shared_comps/popup/base_popup.dart';
import 'package:chinese_picross/components/menu_comps/language_choice_button.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:provider/provider.dart';

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!Provider.of<PreferencesProvider>(context, listen: false).choseLanguage) {
        var colorSet = ThemeManager.of(context).colorSet;
        showDialog(
            context: context,
            child: BasePopup(
              textWidget: MenuPopupText(
                color: colorSet.secondaryColor,
              ),
              choiceWidget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LanguageChoiceButton(
                    text: 'ENG 🇬🇧',
                    textColor: colorSet.intermediaryColor,
                    buttonColor: colorSet.secondaryColor,
                    language: 'en',
                  ),
                  LanguageChoiceButton(
                    text: 'POL 🇵🇱',
                    textColor: colorSet.intermediaryColor,
                    buttonColor: colorSet.secondaryColor,
                    language: 'pl',
                  )
                ],
              ),
            )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Logo()),
              Flexible(
                  child: MainMenu())
            ]) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Logo()),
              Flexible(
                  child: MainMenu())
            ]);
      },
    );
  }
}
