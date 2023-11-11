import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weatherModel.dart';
import 'package:weather_app/pages/searchpage.dart';
import 'package:weather_app/providers/weatherProvider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  weatherModel? weather;

  @override
  Widget build(BuildContext context) {
    weather = Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return searchpage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: weather == null
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'There\'s no weather 😔 start',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  weather!.gettheme(),
                  weather!.gettheme()[300]!,
                  weather!.gettheme()[100]!
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    weather!.name,
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Updated at: ${weather!.date}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weather!.getweather()),
                      Text(
                        '${weather!.temp.toInt()}°',
                        style: const TextStyle(fontSize: 50),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'max: ${weather!.maxTemp.toInt()}°',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            'min: ${weather!.minTemp.toInt()}°',
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    weather!.condition,
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
    );
  }
}
