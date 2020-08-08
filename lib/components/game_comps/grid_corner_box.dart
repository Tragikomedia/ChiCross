import 'package:flutter/material.dart';

class GridCornerBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Text(
            '福',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ));
  }
}
