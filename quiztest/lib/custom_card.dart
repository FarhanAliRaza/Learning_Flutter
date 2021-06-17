import 'package:flutter/material.dart';
import 'constants.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final void Function()? onPress;
  CustomCard({required this.color, required this.cardChild, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onTap: onPress,
    );
  }
}
