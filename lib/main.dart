import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}


class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 3;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$left.png',
              ),
              onPressed: (){
                setState(() {
                  left = Random().nextInt(6) + 1;
                  right = Random().nextInt(6) + 1;

                });


              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$right.png'),
              onPressed: (){
                setState(() {
                  right = Random().nextInt(6) + 1;
                  left = Random().nextInt(6) + 1;

                });

              },
            ),

          ),
        ],
      ),
    );
  }
}

