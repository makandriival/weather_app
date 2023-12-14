import 'package:flutter/material.dart';
import 'package:weather_app/models/forecastday.dart';

class Forecast extends StatelessWidget {
  final ForecastDay forecastDay;

  const Forecast({Key? key, required this.forecastDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Date: ${forecastDay.date}'),
          Text('Min °C: ${forecastDay.mintemp_c}'),
          Text('Max °C: ${forecastDay.maxtemp_c}'),
          Text('Avg °C: ${forecastDay.avgtemp_c}'),
          Text('Condition: ${forecastDay.condition}'),
          Image(image: NetworkImage('https:${forecastDay.conditionIcon}')),
        ],
      ),
    );
  }
}