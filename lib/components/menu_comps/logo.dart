import 'package:flutter/material.dart';
import 'package:chinese_picross/components/menu_comps/logo_text.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

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
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LogoText(
                      color: colorSet.secondaryColor,
                      size: kMenuLogoSmallFontSize,
                    ),
                    LogoText(
                      text: 'Chi',
                      color: colorSet.strongestColor,
                      size: kMenuLogoLargeFontSize,
                    ),
                    LogoText(
                      text: 'nese',
                      color: colorSet.secondaryColor,
                      size: kMenuLogoSmallFontSize,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    LogoText(
                      color: colorSet.secondaryColor,
                      size: kMenuLogoSmallFontSize,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
