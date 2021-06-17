import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  final void Function()? onPress;
  final String btnText;

  BottomButton({required this.btnText, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(btnText,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            ),),
        ),
        color: kBottomColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: 70,
      ),
    );
  }
}
