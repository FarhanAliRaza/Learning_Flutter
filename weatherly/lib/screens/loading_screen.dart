
import 'package:flutter/material.dart';
import 'package:weatherly/services/location.dart';
import 'package:weatherly/services/networking.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherly/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String key = '3556450a25274e50b523c9469fd95a89';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocationData() async{
    // print("ok");

    Location loc = Location();
    // print("ok");

    Position p = await loc.getCurrLoc();
    // print("ok");

    // print(p);
    double lat = p.latitude;
    double lon = p.longitude;

    // double lon = loc.lon;
    NetworkHelper n = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$key&units=metric');
    var data = await n.getData();
    // print(data);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData: data,);
    }));

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();

  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 100.0,
        ),
      ),

    );
  }
}
