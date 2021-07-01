class WeatherModel {
  int getWeatherGif(int condition) {
    if (condition < 300) {
      //thunderstorm
      return 6;
    } else if (condition < 400) {
      //drizzle
      return 3;
    } else if (condition < 600) {
      //rain
      return 3;
    } else if (condition < 700) {
      //snow
      return 4;
    } else if (condition < 800) {
      //mist
      return 2;
    } else if (condition == 800) {
      //sunny
      return 1;
    } else if (condition <= 804) {
      //cloud
      return 5;
    } else {
      return 0;
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
