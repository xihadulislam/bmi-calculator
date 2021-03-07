import 'package:bmi/Const/Const.dart';
import 'package:bmi/widgets/content_card.dart';
import 'package:flutter/material.dart';
class ResultScreen extends StatelessWidget {

  final String result;
  final String calculateBMI;
  final String InterPretation;

  ResultScreen({@required this.result,@required this.calculateBMI,@required this.InterPretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result",style: kTitleTextStyle,),

            )
            ),
            Expanded(
                flex: 5,
                child: ContentCard(
                  color: kActiveContainerCardColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Text(result.toUpperCase(),style: kResultTextStyle,),
                      Text(calculateBMI,style: kBMITextStyle,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(InterPretation,textAlign : TextAlign.center,style: kBodyTextStyle,),
                      ),

                    ],
                  ),
                )),

            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  " Re Calculate".toUpperCase(),
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
        ),
      ),
    );
  }
}
