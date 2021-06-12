import 'package:flutter/material.dart';

import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());


class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  late AudioPlayer player;
  late AudioPlayer player2;
  void playAudio(int num) async{
    await player.setAsset('assets/note$num.wav');

    player.play();
  }
  Expanded buildExp(Color color, int num){
    return Expanded(
      child: FlatButton(
        color: color,
        child: Text(
          "Clicked",
          style: TextStyle(
            fontSize: 50,
            color: color,

          ),
        ),
        onPressed: () {
          playAudio(num);

        },
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player2 = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    player2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildExp(Colors.blue, 1),
              buildExp(Colors.red, 2),
              buildExp(Colors.green, 3),
              buildExp(Colors.yellow, 4),
              buildExp(Colors.deepOrange, 5),
              buildExp(Colors.deepPurpleAccent, 6),
              buildExp(Colors.pink, 7),





            ],

          ),
        ),
      ),

    );

  }
}
