import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_card.dart';
import 'bottombtn.dart';
class Result extends StatelessWidget {
  final String bmi;
  final String resultText;
  final String inter;
  Result({required this.bmi, required this.resultText, required this.inter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Your Result",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: CustomCard(
                onPress: () {},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: kResultText,
                    ),
                    Text(
                        bmi,
                      style: kBMI,
                    ),
                    Text(inter,
                    textAlign: TextAlign.center,
                    style: krMsg,
                    )
                  ],
                ),
                color: kActiveCardColor,
              ),
            ),
            BottomButton(btnText: "RECALCULATE", onPress: (){
              Navigator.pop(context);
            })
          ],
        ));
  }
}
