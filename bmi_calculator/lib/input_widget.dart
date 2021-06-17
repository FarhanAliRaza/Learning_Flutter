import 'package:flutter/material.dart';
import 'constants.dart';

class InputWidget extends StatelessWidget {
  final IconData centerIcon;
  final String text;
  InputWidget({required this.centerIcon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          centerIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
