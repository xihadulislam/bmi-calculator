

import 'package:bmi/Const/Const.dart';
import 'package:flutter/cupertino.dart';

class IconContainer extends StatelessWidget {

  final IconData iconData;
  final String title;

  IconContainer({this.iconData,this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        Icon(iconData,size: 80.0,),
        SizedBox(height: 15.0,),
        Text(title,style: kLabelTextStyle,)
      ],
    );
  }
}
