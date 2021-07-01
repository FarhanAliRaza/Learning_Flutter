import 'package:flutter/material.dart';
import 'package:weatherly/utilities/constants.dart';
import 'package:weatherly/services/weather.dart';
class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int? temp;
  String? city;
  String? desc;
  int? img;


  int? id;

  WeatherModel w = WeatherModel();

  @override
  void initState() {
    super.initState();
    updateUi(widget.weatherData);
  }
  void updateUi(dynamic data){
    double temporary = data['main']['temp'];

    temp = temporary.toInt();
    id = data['weather'][0]['id'];
    desc = data['weather'][0]['description'];
    city = data['name'];
    img = w.getWeatherGif(id!);
    print(img);


  }
  @override

  Widget build(BuildContext context) {
    print(img);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/g$img.gif'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only( top: 70.0),
                  child: Text(
                    '$city',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
                Text(
                  '$desc',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300
                  ),
                ),
                Text(
                  '$temp°',
                  style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(height: 80,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
