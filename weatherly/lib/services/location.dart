import 'package:geolocator/geolocator.dart';

class Location {
  late double lat;
  late double lon;


  Future<Position> getCurrLoc() async {

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

  }
}