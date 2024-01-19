import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/src/services/service_api/serializers.dart';
import 'package:weather_app/src/widgets/main_widget/check_weather.dart';
import 'package:weather_app/src/widgets/search_field/search_widget.dart';

import '../second_page/time_picker.dart';
import 'style.dart';

List<dynamic> wind_and_humidity_from_serializer(weather){
  String wind_speed = weather.wind_speed[0]; // <- from 5.01 to 5 
  String humidity = weather.humidity;

  wind_speed += ' км/ч';
  humidity += '%';

  return [wind_speed, humidity];
}

List<String> temp_from_serializer(weather){
  double temp = weather.temp - 273.15;
  String day1_temp = '${temp.toStringAsFixed(0)}°C';

  dynamic temp2 = weather.day2[0];
  double day2 = temp2 - 273.15;
  String day2_temp = '${day2.toStringAsFixed(0)}°C';

  dynamic temp3 = weather.day3[0];
  double day3 = temp3 - 273.15;
  String day3_temp = '${day3.toStringAsFixed(0)}°C';

  dynamic temp4 = weather.day4[0];
  double day4 = temp4 - 273.15;
  String day4_temp = '${day4.toStringAsFixed(0)}°C';

  dynamic temp5 = weather.day5[0];
  double day5 = temp5 - 273.15;
  String day5_temp = '${day5.toStringAsFixed(0)}°C';

  return [day1_temp, day2_temp, day3_temp, day4_temp, day5_temp];
}

List<String> main_from_serializer(weather){
  String day1_main = weather.main;

  dynamic main2 = weather.day2[1];
  String day2_main = main2.toString();

  dynamic main3 = weather.day3[1];
  String day3_main = main3.toString();

  dynamic main4 = weather.day4[1];
  String day4_main = main4.toString();

  dynamic main5 = weather.day5[1];
  String day5_main = main5.toString();

  return [day1_main, day2_main, day3_main, day4_main, day5_main];
}


class WidgetClouds extends StatelessWidget {
  final SerializerJsonWeather weather;
  final String? coutryName;
 
  WidgetClouds({required this.weather, this.coutryName});
  
  @override
  Widget build(BuildContext context) {
    var temperatures = temp_from_serializer(weather);
    var main_weathers = main_from_serializer(weather);
    var weather_descriptions = wind_and_humidity_from_serializer(weather);
    // createDatabase();
     print('$coutryName');
    String formattedDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
    var i = 0;
  return Scaffold(
      backgroundColor: indigo,
      appBar: AppBar(
        title: Text(
          coutryName?? 'Kiev',
          style: TextStyle(fontSize: 32, color: white),
        ),
        centerTitle: true,
        backgroundColor: indigo,
      ),
      body: Container(
        child: Stack(
          children: [
            SearchBarApp(),
            SizedBox(height: 50,),
            Positioned(
              left: 120,
              top: 68,
              child: Image.asset('images/clouds.gif', width: 140, height: 140, fit: BoxFit.fill),
            ),
            Positioned(
              left: 56,
              top: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    temperatures[0],
                    style: TextStyle(color: white, fontSize: 36),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formattedDate,
                    style: TextStyle(color: white, fontSize: 24),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset('images/54332.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            'low',
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/3741354-weather-wind-windy_108870.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            weather_descriptions[0],
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/Humidity-icon.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            weather_descriptions[1],
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                     // SizedBox(height: 150,),
                    ],
                  ),// -- 3 objects
                  SizedBox(height: 40,),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: DailyWeather(temperatures: temperatures, mainWeathers: main_weathers)
                  ),
                  SizedBox(height: 50 ,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                    }, child: Text('Запланувати час'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetSunny extends StatelessWidget {
  final SerializerJsonWeather weather;
  final String? coutryName;
 
  WidgetSunny({required this.weather, this.coutryName});
  
  @override
  Widget build(BuildContext context) {
    var temperatures = temp_from_serializer(weather);
    var main_weathers = main_from_serializer(weather);
    var weather_descriptions = wind_and_humidity_from_serializer(weather);
    // createDatabase();
     print('$coutryName');
    String formattedDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
    var i = 0;
  return Scaffold(
      backgroundColor: indigo,
      appBar: AppBar(
        title: Text(
          coutryName?? 'Kiev',
          style: TextStyle(fontSize: 32, color: white),
        ),
        centerTitle: true,
        backgroundColor: indigo,
      ),
      body: Container(
        child: Stack(
          children: [
            SearchBarApp(),
            SizedBox(height: 50,),
            Positioned(
              left: 120,
              top: 50,
              child: Image.asset('images/sunny.gif', width: 140, height: 140, fit: BoxFit.fill),
            ),
            Positioned(
              left: 56,
              top: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    temperatures[0],
                    style: TextStyle(color: white, fontSize: 36),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formattedDate,
                    style: TextStyle(color: white, fontSize: 24),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset('images/54332.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            'low',
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/3741354-weather-wind-windy_108870.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            weather_descriptions[0],
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/Humidity-icon.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            weather_descriptions[1],
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                     // SizedBox(height: 150,),
                    ],
                  ),// -- 3 objects
                  SizedBox(height: 40,),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: DailyWeather(temperatures: temperatures, mainWeathers: main_weathers)
                  ),
                  SizedBox(height: 50 ,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                    }, child: Text('Запланувати час'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetRain extends StatelessWidget {
  final SerializerJsonWeather weather;
  final String? coutryName;
 
  WidgetRain({required this.weather, this.coutryName});
  
  @override
  Widget build(BuildContext context) {
    var temperatures = temp_from_serializer(weather);
    var main_weathers = main_from_serializer(weather);
    var weather_descriptions = wind_and_humidity_from_serializer(weather);
    // createDatabase();
     print('$coutryName');
    String formattedDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
    var i = 0;
  return Scaffold(
      backgroundColor: indigo,
      appBar: AppBar(
        title: Text(
          coutryName?? 'Kiev',
          style: TextStyle(fontSize: 32, color: white),
        ),
        centerTitle: true,
        backgroundColor: indigo,
      ),
      body: Container(
        child: Stack(
          children: [
            SearchBarApp(),
            SizedBox(height: 50,),
            Positioned(
              left: 120,
              top: 68,
              child: Image.asset('images/rain.gif', width: 140, height: 140, fit: BoxFit.fill),
            ),
            Positioned(
              left: 56,
              top: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    temperatures[0],
                    style: TextStyle(color: white, fontSize: 36),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formattedDate,
                    style: TextStyle(color: white, fontSize: 24),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset('images/54332.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            'low',
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/3741354-weather-wind-windy_108870.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            weather_descriptions[0],
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/Humidity-icon.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            weather_descriptions[1],
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                     // SizedBox(height: 150,),
                    ],
                  ),// -- 3 objects
                  SizedBox(height: 40,),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: DailyWeather(temperatures: temperatures, mainWeathers: main_weathers)
                  ),
                  SizedBox(height: 50 ,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                    }, child: Text('Запланувати час'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetSnow extends StatelessWidget {
  final SerializerJsonWeather weather;
  final String? coutryName;
 
  WidgetSnow({required this.weather, this.coutryName});
  
  @override
  Widget build(BuildContext context) {
    var temperatures = temp_from_serializer(weather);
    var main_weathers = main_from_serializer(weather);
    var weather_descriptions = wind_and_humidity_from_serializer(weather);
    // createDatabase();
     print('$coutryName');
    String formattedDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
    var i = 0;
  return Scaffold(
      backgroundColor: indigo,
      appBar: AppBar(
        title: Text(
          coutryName?? 'Kiev',
          style: TextStyle(fontSize: 32, color: white),
        ),
        centerTitle: true,
        backgroundColor: indigo,
      ),
      body: Container(
        child: Stack(
          children: [
            SearchBarApp(),
            SizedBox(height: 50,),
            Positioned(
              left: 120,
              top: 50,
              child: Image.asset('images/snow.gif', width: 140, height: 140, fit: BoxFit.fill),
            ),
            Positioned(
              left: 56,
              top: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    temperatures[0],
                    style: TextStyle(color: white, fontSize: 36),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formattedDate,
                    style: TextStyle(color: white, fontSize: 24),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset('images/54332.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            'low',
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/3741354-weather-wind-windy_108870.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            weather_descriptions[0],
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/Humidity-icon.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            weather_descriptions[1],
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                     // SizedBox(height: 150,),
                    ],
                  ),// -- 3 objects
                  SizedBox(height: 40,),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: DailyWeather(temperatures: temperatures, mainWeathers: main_weathers)
                  ),
                  SizedBox(height: 50 ,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                    }, child: Text('Запланувати час'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetClear extends StatelessWidget {
  final SerializerJsonWeather weather;
  final String? coutryName;
 
  WidgetClear({required this.weather, this.coutryName});
  
  @override
  Widget build(BuildContext context) {
    var temperatures = temp_from_serializer(weather);
    var main_weathers = main_from_serializer(weather);
    var weather_descriptions = wind_and_humidity_from_serializer(weather);
    // createDatabase();
     print('$coutryName');
    String formattedDate = DateFormat('EEEE, d MMMM').format(DateTime.now());
    var i = 0;
  return Scaffold(
      backgroundColor: indigo,
      appBar: AppBar(
        title: Text(
          coutryName?? 'Kiev',
          style: TextStyle(fontSize: 32, color: white),
        ),
        centerTitle: true,
        backgroundColor: indigo,
      ),
      body: Container(
        child: Stack(
          children: [
            SearchBarApp(),
            SizedBox(height: 50,),
            Positioned(
              left: 120,
              top: 68,
              child: Image.asset('images/clear.gif', width: 130, height: 140, fit: BoxFit.fill),
            ),
            Positioned(
              left: 56,
              top: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    temperatures[0],
                    style: TextStyle(color: white, fontSize: 36),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formattedDate,
                    style: TextStyle(color: white, fontSize: 24),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Column(
                        children: [
                          Image.asset('images/54332.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            'low',
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/3741354-weather-wind-windy_108870.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            weather_descriptions[0],
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/Humidity-icon.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            weather_descriptions[1],
                            style: TextStyle(color: white, fontSize: 18),
                          ),
                        ],
                      ),
                     // SizedBox(height: 150,),
                    ],
                  ),// -- 3 objects
                  SizedBox(height: 40,),
                  Positioned(
                    top: 12,
                    left: 12,
                    child: DailyWeather(temperatures: temperatures, mainWeathers: main_weathers)
                  ),
                  SizedBox(height: 50 ,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                    }, child: Text('Запланувати час'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
