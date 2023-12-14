import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/todays.dart';
import 'package:weather_app/models/weather_provider.dart';
import '../constants//api_constants.dart';
import 'package:provider/provider.dart';

Future<String> getCurrentWeather(String city, BuildContext context) async {
  final dio = Dio();
  final String url ='$weather_map_base_url/$todayEndpoint?q=$city&key=$weather_api_key';
  WeatherProvider weatherProvider = Provider.of<WeatherProvider>(context, listen: false);

  try {
    final response = await dio.get(url);

    TodaysWeather formattedResponse = TodaysWeather(
      city: response.data['location']['name'],
      updatedAt: response.data['location']['localtime'],
      temperature: response.data['current']['temp_c'].toString(),
      condition: response.data['current']['condition']['text'],
    );
    weatherProvider.todaysWeather.updateTodaysWeather(formattedResponse);

    if (response.statusCode == 200) {
      print('todays weather: ${response.statusCode}');
      return '${response.statusCode}';
    } else {
      print('Error!: ${response.statusCode}');
      return 'not found';
    }
  } catch (error) {
    print('Error?: $error');

    TodaysWeather formattedResponse = TodaysWeather(
      city: 'not found',
      updatedAt: 'not found',
      temperature: 'not found',
      condition: 'not found',
    );
    weatherProvider.todaysWeather.updateTodaysWeather(formattedResponse);

    return 'not found';
  }
}
