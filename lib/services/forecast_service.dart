import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_provider.dart';
import 'package:weather_app/models/forecastday.dart';
import '../constants//api_constants.dart';
import 'package:provider/provider.dart';

void getForecastList(String city, String qtyDays, BuildContext context) async {
  final dio = Dio();
  final String url ='$weather_map_base_url/$forcastEndpoint?q=$city&days=$qtyDays&key=$weather_api_key';

  print('forecast url: $url');

  try {
    final response = await dio.get(url);
    WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context, listen: false);
    final forecastData = response.data['forecast']['forecastday'];
    List<ForecastDay> formattedResponse = [];

    forecastData.forEach((element) {
      formattedResponse.add(ForecastDay(
        date: element['date'],
        mintemp_c: element['day']['mintemp_c'].toString(),
        maxtemp_c: element['day']['maxtemp_c'].toString(),
        avgtemp_c: element['day']['avgtemp_c'].toString(),
        condition: element['day']['condition']['text'],
        conditionIcon: element['day']['condition']['icon'],
      ));
    });


    weatherProvider.weatherForecast.updateWeatherForecast(formattedResponse);

    if (response.statusCode == 200) {
      print('forecast fetch: ${response.statusCode}');
    } else {
      print('Error!: ${response.statusCode}');
    }
  } catch (error) {
    print('Error?: $error');
  }
}