import 'package:bmi/widgets/content_card.dart';
import 'package:bmi/widgets/icon_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Const/Const.dart';
import '../Const/Const.dart';
import '../Const/Const.dart';

enum Gender { MALE, FEMALE }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator".toUpperCase()),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.MALE;
                    });
                  },
                  child: ContentCard(
                    color: selectedGender == Gender.MALE
                        ? activeContainerCardColor
                        : inactiveContainerCardColor,
                    cardChild: IconContainer(
                      iconData: FontAwesomeIcons.mars,
                      title: "male".toUpperCase(),
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.FEMALE;
                    });
                  },
                  child: ContentCard(
                    color: selectedGender == Gender.FEMALE
                        ? activeContainerCardColor
                        : inactiveContainerCardColor,
                    cardChild: IconContainer(
                      iconData: FontAwesomeIcons.venus,
                      title: "female ".toUpperCase(),
                    ),
                  ),
                )),
              ],
            )),
            Expanded(
                child: ContentCard(
              color: activeContainerCardColor,
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ContentCard(
                  color: activeContainerCardColor,
                )),
                Expanded(
                    child: ContentCard(
                  color: activeContainerCardColor,
                )),
              ],
            )),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Calculate".toUpperCase(),
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  color: bottomContainerColor,
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10.0),
              height: bottomContainerSize,
              width: double.infinity,
            )
          ],
        ));
  }
}
