import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weatherModel.dart';

class weatherService {
  weatherModel? weather;
  Future<weatherModel?> getWeather({required String cityName}) async {
    try {
      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = 'b2998079e644497faec151054231105';
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = weatherModel.fromJson(data);
    } catch (ex) {}
    return weather;
  }
}
