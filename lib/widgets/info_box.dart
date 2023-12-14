import 'package:flutter/material.dart';
import 'package:weather_app/models/todays.dart';

class InfoBox extends StatelessWidget {
  final TodaysWeather todaysWeather;

  const InfoBox({Key? key, required this.todaysWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (todaysWeather.city == 'not found' || todaysWeather.city == 'City') {
      return Container(
        height: 100,
        width: 100,
        alignment: Alignment.center,
        child: Text('Please enter valid name of the city', textAlign: TextAlign.center,),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'City: ${todaysWeather.city}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Time: ${todaysWeather.updatedAt}'),
            Text('Temperature: ${todaysWeather.temperature}°C'),
            Text('Condition: ${todaysWeather.condition}'),
          ],
        ),
      );
    }
  }
}
