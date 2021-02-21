

import 'package:flutter/cupertino.dart';

class ContentCard extends StatelessWidget {

  final Color color;
  final Widget cardChild;
  final Function onPress ;
  ContentCard({@required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}