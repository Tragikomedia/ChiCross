import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chinese_picross/components/shared_comps/character_tile/character_tile.dart';
import 'package:chinese_picross/components/collection_comps/footer_text.dart';
import 'package:chinese_picross/screens/description_screen.dart';

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(gameNumber: gameNumber,)));
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
