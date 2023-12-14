import 'package:flutter/material.dart';
import 'package:weather_app/models/forecastday.dart';
import 'package:weather_app/models/todays.dart';

class WeatherProvider extends ChangeNotifier {
  TodaysWeather todaysWeather = TodaysWeather(
    city: 'City',
    updatedAt: 'Time',
    temperature: 'Temperature',
    condition: 'Condition',
  );

  WeatherForecast weatherForecast = WeatherForecast();
}
