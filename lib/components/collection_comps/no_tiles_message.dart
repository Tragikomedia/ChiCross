import 'package:flutter/material.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';

class NoTilesMessage extends StatelessWidget {
  final String text;
  final Color color;

  NoTilesMessage({@required this.text, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.search,
            color: color,
            size: MediaQuery.of(context).orientation == Orientation.portrait
                ? kNoTileInCollectionMessageFontSize * 9
                : kNoTileInCollectionMessageFontSize * 4,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontFamily: 'Cyrulik',
              fontSize: kNoTileInCollectionMessageFontSize,
            ),
          )
        ],
      ),
    );
  }
}
