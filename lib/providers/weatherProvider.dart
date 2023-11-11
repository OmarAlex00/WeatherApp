import 'package:flutter/material.dart';
import 'package:weather_app/models/weatherModel.dart';

class weatherProvider extends ChangeNotifier {
  weatherModel? _weatherData;
  set weatherData(weatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  weatherModel? get weatherData => _weatherData;
}
