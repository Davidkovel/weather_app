import 'package:flutter/material.dart';
import 'package:weather_app/src/services/serializers.dart';
import 'package:intl/intl.dart';

class WidgetClouds extends StatelessWidget {
  final SerializerJsonWeather weather;

  WidgetClouds({required this.weather});

  @override
  Widget build(BuildContext context) {
    double temp = weather.temp - 273.15;
    String text_temp = '+${temp.toStringAsFixed(0)}°C';
    List a = weather.day2;
    print(a);
    print('[INFO LST] ${a[0] - 273.15}, ---- ${a[1]}');
    String formattedDate = DateFormat('EEEE, d MMMM').format(DateTime.now());

    return Column(
      children: <Widget>[
        Image.asset('images/clouds.gif', width: 140, height: 140, fit: BoxFit.fill),
        Container(
          height: 167,
          width: 169,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text_temp, style: TextStyle(fontSize: 24, color: Colors.white)),
                Text(formattedDate, style: TextStyle(fontSize: 17, color: const Color.fromARGB(255, 64, 84, 85))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
