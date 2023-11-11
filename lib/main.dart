import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/homepage.dart';
import 'package:weather_app/providers/weatherProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return weatherProvider();
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<weatherProvider>(context).weatherData ==
                  null
              ? Colors.blue
              : Provider.of<weatherProvider>(context).weatherData!.gettheme()),
      debugShowCheckedModeBanner: false,
      home: const homepage(),
    );
  }
}
