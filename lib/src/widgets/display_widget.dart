import 'package:flutter/material.dart';
import 'package:weather_app/src/services/serializers.dart';
import 'package:intl/intl.dart';

class WidgetClouds extends StatelessWidget {
  final SerializerJsonWeather weather;

  WidgetClouds({required this.weather});

  @override
  Widget build(BuildContext context) {
    double temp = weather.temp - 273.15;
<<<<<<< HEAD
    String text_temp = '${temp.toStringAsFixed(0)}°C';

    String formattedDate = DateFormat('EEEE, d MMMM').format(DateTime.now());

  return Scaffold(
      backgroundColor: Color.fromARGB(253, 13, 13, 18),
      appBar: AppBar(
        title: Text(
          'Kiev',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(253, 13, 13, 18),
      ),
      body: Container(
        child: Stack(
          children: [
            Positioned(
              left: 120,
              top: 50,
              child: Image.asset('images/clouds.gif', width: 140, height: 140, fit: BoxFit.fill),
            ),
            Positioned(
              left: 40,
              top: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text_temp,
                    style: TextStyle(color: Colors.white, fontSize: 36),
                  ),
                  SizedBox(height: 8),
                  Text(
                    formattedDate,
                    style: TextStyle(color: Colors.white, fontSize: 24),
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
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/3741354-weather-wind-windy_108870.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            '12 км/год',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset('images/Humidity-icon.png', width: 45, height: 45, fit: BoxFit.fill),
                          SizedBox(height: 8),
                          Text(
                            '90%',
                            style: TextStyle(color: Colors.white, fontSize: 18),
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
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/cloud-cloudy-day-forecast-sun-icon.png', width: 58, height: 50, fit: BoxFit.fill),
                            SizedBox(height: 8),
                            Text('30', style: TextStyle(color: Colors.white, fontSize: 12),),
                          ]
                        ),
                        SizedBox(width: 14,),
                        Column(
                          children: [
                            Image.asset('images/cloud-cloudy-day-forecast-sun-icon.png', width: 58, height: 50, fit: BoxFit.fill),
                            SizedBox(height: 8),
                            Text('16', style: TextStyle(color: Colors.white, fontSize: 12),),
                          ]
                        ),
                        SizedBox(width: 14,),
                        Column(
                          children: [
                            Image.asset('images/if-weather-32-2682819_90762.png', width: 58, height: 50, fit: BoxFit.fill),
                            SizedBox(height: 8),
                            Text('20', style: TextStyle(color: Colors.white, fontSize: 12),),
                          ]
                        ),
                        SizedBox(width: 14,),
                        Column(
                          children: [
                            Image.asset('images/unnamed.png', width: 58, height: 50, fit: BoxFit.fill),
                            SizedBox(height: 8),
                            Text('7', style: TextStyle(color: Colors.white, fontSize: 12),),
                          ]
                        ),
                        SizedBox(width: 14,),
                        Column(
                          children: [
                            Image.asset('images/if-weather-32-2682819_90762.png', width: 58, height: 50, fit: BoxFit.fill),
                            SizedBox(height: 8),
                            Text('13', style: TextStyle(color: Colors.white, fontSize: 12),),
                          ]
                        ),
                      ]
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




/*return Column(
=======
    String text_temp = '+${temp.toStringAsFixed(0)}°C';
    List a = weather.day2;
    print(a);
    print('[INFO LST] ${a[0] - 273.15}, ---- ${a[1]}');
    String formattedDate = DateFormat('EEEE, d MMMM').format(DateTime.now());

    return Column(
>>>>>>> 963167306d112da0c5ffeee119222fa46c2a6827
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
<<<<<<< HEAD
    );*/
=======
    );
  }
}
>>>>>>> 963167306d112da0c5ffeee119222fa46c2a6827
