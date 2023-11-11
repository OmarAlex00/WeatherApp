import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class weatherModel {
  String name;
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String condition;
  int code;

  weatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition,
      required this.code,
      required this.name});

  factory weatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return weatherModel(
        name: data['location']['name'],
        date: DateFormat('hh:mm a')
            .format(DateTime.parse(data['current']['last_updated'])),
        temp: data['current']['temp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        condition: data['current']['condition']['text'],
        code: jsonData['condition']['code']);
  }

  String getweather() {
    if (code == 1000) {
      return 'assets/images/clear.png';
    } else if (code == 1003 ||
        code == 1006 ||
        code == 1009 ||
        code == 1030 ||
        code == 1135) {
      return 'assets/images/cloudy.png';
    } else if (code == 1063 ||
        code == 1150 ||
        code == 1153 ||
        code == 1180 ||
        code == 1183 ||
        code == 1186 ||
        code == 1189 ||
        code == 1192 ||
        code == 1195 ||
        code == 1240 ||
        code == 1243) {
      return 'assets/images/rainy.png';
    } else if (code == 1087 ||
        code == 1273 ||
        code == 1276 ||
        code == 1279 ||
        code == 1282) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/snow.png';
    }
  }

  MaterialColor gettheme() {
    if (code == 1000) {
      return Colors.orange;
    } else if (code == 1003 ||
        code == 1006 ||
        code == 1009 ||
        code == 1030 ||
        code == 1135 ||
        code == 1087 ||
        code == 1273 ||
        code == 1276 ||
        code == 1279 ||
        code == 1282) {
      return Colors.grey;
    } else if (code == 1063 ||
        code == 1150 ||
        code == 1153 ||
        code == 1180 ||
        code == 1183 ||
        code == 1186 ||
        code == 1189 ||
        code == 1192 ||
        code == 1195 ||
        code == 1240 ||
        code == 1243) {
      return Colors.blueGrey;
    } else {
      return Colors.lightBlue;
    }
  }
}
