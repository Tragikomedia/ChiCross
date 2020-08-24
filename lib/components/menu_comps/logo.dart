import 'package:flutter/material.dart';
import 'package:chinese_picross/components/menu_comps/logo_text.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:provider/provider.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorSet = ThemeManager.of(context).colorSet;
    return Center(
      child: Wrap(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoText(
                text: 'Chi',
                color: colorSet.strongestColor,
                size: kMenuLogoLargeFontSize,
              ),
              LogoText(
                text: localization[Provider.of<PreferencesProvider>(context, listen: false).language]['general']['nese'],
                color: colorSet.secondaryColor,
                size: kMenuLogoSmallFontSize,
              ),
              LogoText(
                text: '   ',
                color: colorSet.secondaryColor,
                size: kMenuLogoSmallFontSize,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoText(
                text: '   ',
                color: colorSet.secondaryColor,
                size: kMenuLogoSmallFontSize,
              ),
              LogoText(
                text: 'pi',
                color: colorSet.secondaryColor,
                size: kMenuLogoSmallFontSize,
              ),
              LogoText(
                text: 'Cross',
                color: colorSet.strongestColor,
                size: kMenuLogoLargeFontSize,
              ),
            ],
          )
        ],
      ),
    );
  }
}
