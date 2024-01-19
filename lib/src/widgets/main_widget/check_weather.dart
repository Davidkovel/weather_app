import 'package:flutter/material.dart';

import 'style.dart';
// import 'package:flutter/widgets.dart';


class DailyWeather extends StatelessWidget {
  final List<String> temperatures;
  final List<String> mainWeathers;

  DailyWeather({required this.temperatures, required this.mainWeathers});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < temperatures.length; i++) {
      print('-- ${mainWeathers[i]}');
    }
    return Row(
      children: [
        for (int i = 0; i < temperatures.length; i++)
          Column(
            children: [
              if (mainWeathers[i] == 'Clouds')
                Image.asset('images/cloud-cloudy-day-forecast-sun-icon.png', width: 58, height: 50, fit: BoxFit.fill),
              if (mainWeathers[i] == 'Rain')
                Image.asset('images/if-weather-32-2682819_90762.png', width: 58, height: 50, fit: BoxFit.fill),
              if (mainWeathers[i] == 'Snow')
                Image.asset('images/snow icon.png', width: 40, height: 42, fit: BoxFit.fill),  
              if (mainWeathers[i] == 'Clear')
                Image.asset('images/clear icon.png', width: 58, height: 50, fit: BoxFit.fill),    
              SizedBox(height: 8),        
              Text(temperatures[i], style: TextStyle(color: white, fontSize: 12)),
            ]
          ),
      ],
    );
  }
}





/*class DailyWeahter extends StatelessWidget {
  DailyWeahter({required this.temperatures, });

  const DailyWeahter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Image.asset('images/cloud-cloudy-day-forecast-sun-icon.png', width: 58, height: 50, fit: BoxFit.fill),
            SizedBox(height: 8),
            Text(temperatures[0], style: TextStyle(color: Colors.white, fontSize: 12),),
          ]
        ),
        SizedBox(width: 14,),
        Column(
          children: [
            Image.asset('images/cloud-cloudy-day-forecast-sun-icon.png', width: 58, height: 50, fit: BoxFit.fill),
            SizedBox(height: 8),
            Text(temperatures[1], style: TextStyle(color: Colors.white, fontSize: 12),),
          ]
        ),
        SizedBox(width: 14,),
        Column(
          children: [
            Image.asset('images/if-weather-32-2682819_90762.png', width: 58, height: 50, fit: BoxFit.fill),
            SizedBox(height: 8),
            Text(temperatures[2], style: TextStyle(color: Colors.white, fontSize: 12),),
          ]
        ),
        SizedBox(width: 14,),
        Column(
          children: [
            Image.asset('images/unnamed.png', width: 58, height: 50, fit: BoxFit.fill),
            SizedBox(height: 8),
            Text(temperatures[3], style: TextStyle(color: Colors.white, fontSize: 12),),
          ]
        ),
        SizedBox(width: 14,),
        Column(
          children: [
            Image.asset('images/if-weather-32-2682819_90762.png', width: 58, height: 50, fit: BoxFit.fill),
            SizedBox(height: 8),
            Text(temperatures[4], style: TextStyle(color: Colors.white, fontSize: 12),),
          ]
        ),
      ]
    )
  }
}*/