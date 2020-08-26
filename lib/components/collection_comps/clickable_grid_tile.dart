import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/character_tile/character_tile.dart';
import 'package:chinese_picross/components/collection_comps/footer_text.dart';
import 'package:chinese_picross/screens/description_screen.dart';
import 'package:chinese_picross/utilities/general_utils/transition_animation.dart';

class ClickableGridTile extends StatelessWidget {
  final int gameNumber;

  ClickableGridTile({@required this.gameNumber});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: FooterText(
        gameNumber: gameNumber,
      ),
      child: Hero(
        tag: 'character$gameNumber',
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(createRoute(DescriptionScreen(gameNumber: gameNumber,), 600));
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
            child: CharacterTile(
              characterNumber: gameNumber,
              fontSizeModifier: 2,
            ),
          ),
        ),
      )
    );
  }
}
