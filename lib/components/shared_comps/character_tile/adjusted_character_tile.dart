import 'package:flutter/material.dart';

class AdjustedCharacterTile extends StatelessWidget {
  final Widget child;
  final Color color;

  AdjustedCharacterTile({@required this.child, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.0)),
          padding: EdgeInsets.all(5.0),
          child: child,
    ),
    );
  }
}
