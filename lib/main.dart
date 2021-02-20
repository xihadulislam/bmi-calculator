import 'package:flutter/material.dart';

import 'Const/Const.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                        child:ContentCard(color: activeContainerCardColor,)),
                    Expanded(
                        child: ContentCard(color: activeContainerCardColor,)),
                  ],
                )),
            Expanded(
                child: ContentCard(color: activeContainerCardColor,)),
            Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: ContentCard(color: activeContainerCardColor,)

                    ),
                    Expanded(
                        child: ContentCard(color: activeContainerCardColor  ,)),
                  ],
                )),

            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              height: bottomContainerSize,
              width: double.infinity,
            )

          ],
        ));
  }
}

class ContentCard extends StatelessWidget {

  final Color color;

  ContentCard({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
