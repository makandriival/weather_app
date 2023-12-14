import 'package:flutter/material.dart';

class WeatherForecast extends ChangeNotifier {
  List<ForecastDay> weatherForecast = [];

  void updateWeatherForecast(List<ForecastDay> newWeatherForecast) {
    weatherForecast = newWeatherForecast;

    notifyListeners();
  }

  int get length => weatherForecast.length;

  ForecastDay get(int index) => weatherForecast[index];
}

class ForecastDay {
  String date;
  String maxtemp_c;
  String mintemp_c;
  String avgtemp_c;
  String condition;
  String conditionIcon;

  ForecastDay({
    required this.date,
    required this.maxtemp_c,
    required this.mintemp_c,
    required this.avgtemp_c,
    required this.condition,
    required this.conditionIcon,
  });
}
