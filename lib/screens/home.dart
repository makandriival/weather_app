import 'package:flutter/material.dart';
import 'package:weather_app/models/todays.dart';
import 'package:weather_app/models/weather_provider.dart';
import 'package:weather_app/screens/details.dart';
import 'package:weather_app/services/current_wether_service.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/widgets/info_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _cityName = '';

  Future<void> getWeather() async {
    await getCurrentWeather(_cityName, context);

    setState(() {
      _cityName = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200.0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Weather App',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _cityName = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search for a city...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _cityName.isEmpty ? null : () => getWeather(), 
                      child: const Text('Get Weather'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: Consumer<WeatherProvider>(
          builder: (context, weatherProvider, child) {
            final TodaysWeather todaysWeather = weatherProvider.todaysWeather;
            final String city = todaysWeather.city;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InfoBox(todaysWeather: todaysWeather),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: city == 'not found' ? null : () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherWidget()))
                  }, 
                  child: Text('Go to Details/Forecast'),
                  ),
                ),
              ]
            );
          },
        )
      ),
    );
  }
}
