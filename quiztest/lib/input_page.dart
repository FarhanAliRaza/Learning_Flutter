import 'package:flutter/material.dart';
import 'custom_card.dart';
import 'input_widget.dart';
import 'constants.dart';
import 'result.dart';
import 'bottombtn.dart';
import 'calculator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
enum Gender {
  male,
  female,
  none
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int hieght = 180;
  int weight = 60;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male ? kActiveCardColor : kInactiveColor,
                    cardChild: InputWidget(
                      centerIcon: Icons.male_outlined,
                      text: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female ? kActiveCardColor : kInactiveColor,
                    cardChild: InputWidget(
                      centerIcon: Icons.female_outlined,
                      text: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(

              onPress: (){

              },
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hieght",
                  style: kLabelTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        hieght.toString(),
                        style: kTextStyle,
                      ),
                      Text('cm', style: kLabelTextStyle,)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomColor,
                      overlayColor: kBottomColorT,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                    ),
                    child: Slider(
                        value: hieght.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            hieght = newValue.round();
                          });
                        }),
                  ),

                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    onPress: (){

                    },
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT",
                        style: kLabelTextStyle,),
                        Text(
                          weight.toString(),
                          style: kTextStyle,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            RoundIconButton(icon: FontAwesomeIcons.minus,
                            ontap: (){
                              setState(() {
                                weight--;
                              });
                            },
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                            ontap: (){
                              setState(() {
                                weight++;
                              });
                            },
                            ),


                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    onPress: (){

                    },
                    color: kActiveCardColor,
                    cardChild:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE",
                          style: kLabelTextStyle,),
                        Text(
                          age.toString(),
                          style: kTextStyle,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            RoundIconButton(icon: FontAwesomeIcons.minus,
                              ontap: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10,),
                            RoundIconButton(icon: FontAwesomeIcons.plus,
                              ontap: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),


                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(btnText: "CALCULATE", onPress: (){
            Calc c = Calc(weight: weight, hieght: hieght);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Result(
              bmi: c.calculateBmi(),
              resultText: c.getResult(),

              inter: c.getInter(),

            ),
            ),
            );
          }
          )
        ],
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? ontap;
  RoundIconButton({required this.icon, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: ontap,
      child: Icon(
        icon,
      ),
    shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 0.0,

    );
  }
}
