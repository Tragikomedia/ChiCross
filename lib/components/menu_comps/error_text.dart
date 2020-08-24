import 'package:flutter/material.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:provider/provider.dart';

class ErrorText extends StatelessWidget {
  final Color color;

  ErrorText({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      localization[Provider.of<PreferencesProvider>(context, listen: false).language]['general']['error'],
      style: TextStyle(
        color: color,
        fontFamily: 'Cyrulik',
        fontSize: 24.0,
      ),
    );
  }
}
