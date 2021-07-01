// @dart=2.9

import 'package:flutter/material.dart';
import 'package:weatherly/screens/loading_screen.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
