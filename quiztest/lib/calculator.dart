import 'dart:math';
class Calc {
  int hieght;
  int weight;
  late double _bmi;
  Calc({required this.weight, required this.hieght});
  String calculateBmi(){
    _bmi = weight/pow(hieght/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if (_bmi >= 25){
      return "Overweight";

    }
    else if (_bmi > 18.5){
      return "Normal";
    }
    else{
      return "Underweight";
    }
  }
  String getInter(){
    if (_bmi >= 25){
      return "You have higher than the normal body weight.Exercise more";

    }
    else if (_bmi > 18.5){
      return "You have normal body weight.Good Job";
    }
    else{
      return "You have lower than the normal body weight.You should eat  more";
    }

  }

}