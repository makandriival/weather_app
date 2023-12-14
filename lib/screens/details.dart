import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_provider.dart';
import 'package:weather_app/services/forecast_service.dart';
import 'package:weather_app/widgets/forcast_day.dart';
import 'package:weather_app/widgets/info_box.dart';

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  String qtyDays = '3'; // TODO: add dropdown to select qty of days
  String city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Consumer<WeatherProvider>(
            builder: (context, weatherProvider, child) {
              getForecastList(weatherProvider.todaysWeather.city, qtyDays, context);

              return InfoBox(todaysWeather: weatherProvider.todaysWeather);
            },
            ),
          SizedBox(height: 16),
          Text(
            'Weather Forecast:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Consumer<WeatherProvider>(
              builder: (context, weatherProvider, child) {
                return ListView.builder(
                  itemCount: weatherProvider.weatherForecast.length,
                  itemBuilder: (context, index) {
                    return Forecast(forecastDay: weatherProvider.weatherForecast.get(index));
                  },
                );
              },
             
            ),
          ),
        ],
      ),
    );
  }
}
