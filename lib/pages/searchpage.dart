import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/providers/weatherProvider.dart';
import 'package:weather_app/services/weather_services.dart';

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  String? searchdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            style: const TextStyle(fontSize: 24),
            onChanged: (value) {
              searchdata = value;
            },
            onSubmitted: (value) async {
              searchdata = value;
              weatherService service = weatherService();
              weatherModel? weather = await service.getWeather(cityName: value);
              Provider.of<weatherProvider>(context, listen: false).weatherData =
                  weather;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              hintText: 'Enter a city name for ex: Cairo',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintStyle: const TextStyle(fontSize: 24),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 18),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () async {
                  weatherService service = weatherService();
                  weatherModel? weather =
                      await service.getWeather(cityName: searchdata!);
                  Provider.of<weatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Navigator.pop(context);
                },
              ),
              label: const Text('Search for a City'),
              labelStyle: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
