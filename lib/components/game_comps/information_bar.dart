import 'package:flutter/material.dart';
import 'package:chinese_picross/picross_files/picross_list.dart';

class InformationBar extends StatefulWidget {
  final int gameNumber;

  InformationBar({@required this.gameNumber});

  @override
  _InformationBarState createState() => _InformationBarState();
}

class _InformationBarState extends State<InformationBar> {
  String timerState = "12:34";

  // TODO Abstract it, especially the lines
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(color: theme.primaryColor,
      child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [Text('Welcome to ChiCross!', textAlign: TextAlign.center, style: TextStyle(color: theme.accentColor),),
          Divider(color: theme.accentColor, thickness: 3.0,),
          Flexible(
            child: Row(children: [
              Flexible(flex: 2,
                child: Column(children: [
                  Text('${widget.gameNumber}. ${picrossList[widget.gameNumber].description.meaning}', style: TextStyle(color: theme.accentColor),),
                  Divider(color: theme.accentColor, thickness: 3.0,),
                     Text(timerState, style: TextStyle(color: theme.accentColor),),
                ],),
              ),
              Container(color: theme.accentColor, width: 3.0, height: double.infinity,),
              Flexible(flex: 1,
                child: Column(children: [
                  Text('Lives', style: TextStyle(color: theme.accentColor),),
                  Divider(color: theme.accentColor, thickness: 3.0,),
                  Row(children: [Icon(Icons.games), Icon(Icons.games), Icon(Icons.games)],),
                ]),
              ),
            ],),
          )
        ],),
      ),
    );
  }
}
