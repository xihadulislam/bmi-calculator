

import 'package:flutter/cupertino.dart';

class ContentCard extends StatelessWidget {

  final Color color;
  final Widget cardChild;

  ContentCard({@required this.color,this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0)),
    );
  }
}