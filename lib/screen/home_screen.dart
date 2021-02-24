import 'package:bmi/screen/result_screen.dart';
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
  int weight = 60;
  int age = 20;

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
                          RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 20.0),
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("weight".toUpperCase(), style: kLabelTextStyle),
                          Text(weight.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(iconData: FontAwesomeIcons.minus,onPress: (){
                                setState(() {
                                  weight--;
                                });
                              },),


                              SizedBox(
                                width: 10,
                              ),
                              RoundIcon(iconData: FontAwesomeIcons.plus,onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },),
                            ],
                          )

                        ],
                      ),
                )),
                Expanded(
                    child: ContentCard(
                  color: kActiveContainerCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("age".toUpperCase(), style: kLabelTextStyle),
                          Text(age.toString(), style: kNumberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIcon(iconData: FontAwesomeIcons.minus,onPress: (){
                                setState(() {
                                  age--;
                                });
                              },),

                              SizedBox(
                                width: 10,
                              ),
                              RoundIcon(iconData: FontAwesomeIcons.plus,onPress: (){
                                setState(() {
                                  age++;
                                });
                              },),

                            ],
                          )

                        ],
                      ),
                )),
              ],
            )),
            GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen() )),
              child: Container(
                alignment: Alignment.center,
                child:  Text(
                  "Calculate".toUpperCase(),
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    color: kBottomContainerColor,
                    borderRadius: BorderRadius.circular(10.0)),
                margin: EdgeInsets.all(8.0),
                height: kBottomContainerSize,
                width: double.infinity,
              ),
            )
          ],
        ));
  }
}

class RoundIcon extends StatelessWidget {
  Function onPress;
  IconData iconData;

  RoundIcon({this.iconData, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child:  Icon(iconData),
      constraints:   BoxConstraints.tightFor(
        width: 48.0,
        height: 48.0
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
