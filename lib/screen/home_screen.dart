import 'package:bmi/widgets/content_card.dart';
import 'package:bmi/widgets/icon_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Const/Const.dart';

enum Gender { MALE, FEMALE }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator".toUpperCase()),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ContentCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.MALE;
                    });
                  },
                  color: selectedGender == Gender.MALE
                      ? kActiveContainerCardColor
                      : kInactiveContainerCardColor,
                  cardChild: IconContainer(
                    iconData: FontAwesomeIcons.mars,
                    title: "male".toUpperCase(),
                  ),
                )),
                Expanded(
                    child: ContentCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.FEMALE;
                    });
                  },
                  color: selectedGender == Gender.FEMALE
                      ? kActiveContainerCardColor
                      : kInactiveContainerCardColor,
                  cardChild: IconContainer(
                    iconData: FontAwesomeIcons.venus,
                    title: "female ".toUpperCase(),
                  ),
                )),
              ],
            )),
            Expanded(
                child: ContentCard(
              color: kActiveContainerCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height".toUpperCase(), style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text("cm", style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(

                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x01EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 30.0),
                    ),
                    child: Slider(
                        min: 120,
                        max: 220,
                        value: height.toDouble(),
                        onChanged: (newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        }),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ContentCard(
                  color: kActiveContainerCardColor,
                )),
                Expanded(
                    child: ContentCard(
                  color: kActiveContainerCardColor,
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
                  color: kBottomContainerColor,
                  borderRadius: BorderRadius.circular(10.0)),
              margin: EdgeInsets.all(10.0),
              height: kBottomContainerSize,
              width: double.infinity,
            )
          ],
        ));
  }
}
