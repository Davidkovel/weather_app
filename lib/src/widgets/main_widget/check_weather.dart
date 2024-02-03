import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'style.dart';
// import 'package:flutter/widgets.dart';


class DailyWeather extends StatelessWidget {
  final List<String> temperatures;
  final List<String> mainWeathers;
  final String countryCode;
  final String city;

  DailyWeather({required this.temperatures, required this.mainWeathers, required this.countryCode, required this.city});

  void _launchURL() async {
    final url = 'https://www.accuweather.com/en/$countryCode/$city-weather';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchURL,
      child: Row(
        children: [
          for (int i = 0; i < temperatures.length; i++)
            Column(
              children: [
                if (mainWeathers[i] == 'Clouds')
                  Image.asset('assets/images/cloud-cloudy-day-forecast-sun-icon.png', width: 58, height: 50, fit: BoxFit.fill),
                if (mainWeathers[i] == 'Rain')
                  Image.asset('assets/images/if-weather-32-2682819_90762.png', width: 58, height: 50, fit: BoxFit.fill),
                if (mainWeathers[i] == 'Snow')
                  Image.asset('assets/images/snow icon.png', width: 40, height: 42, fit: BoxFit.fill),  
                if (mainWeathers[i] == 'Clear')
                  Image.asset('assets/images/clear icon.png', width: 58, height: 50, fit: BoxFit.fill),    
                SizedBox(height: 8),        
                Text(temperatures[i], style: TextStyle(color: white, fontSize: 12)),
              ]
            ),
        ],
      ),
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
            Image.asset('assets/images/cloud-cloudy-day-forecast-sun-icon.png', width: 58, height: 50, fit: BoxFit.fill),
            SizedBox(height: 8),
            Text(temperatures[0], style: TextStyle(color: Colors.white, fontSize: 12),),
          ]
        ),
        SizedBox(width: 14,),
        Column(
          children: [
            Image.asset('assets/images/cloud-cloudy-day-forecast-sun-icon.png', width: 58, height: 50, fit: BoxFit.fill),
            SizedBox(height: 8),
            Text(temperatures[1], style: TextStyle(color: Colors.white, fontSize: 12),),
          ]
        ),
        SizedBox(width: 14,),
        Column(
          children: [
            Image.asset('assets/images/if-weather-32-2682819_90762.png', width: 58, height: 50, fit: BoxFit.fill),
            SizedBox(height: 8),
            Text(temperatures[2], style: TextStyle(color: Colors.white, fontSize: 12),),
          ]
        ),
        SizedBox(width: 14,),
        Column(
          children: [
            Image.asset('assets/images/unnamed.png', width: 58, height: 50, fit: BoxFit.fill),
            SizedBox(height: 8),
            Text(temperatures[3], style: TextStyle(color: Colors.white, fontSize: 12),),
          ]
        ),
        SizedBox(width: 14,),
        Column(
          children: [
            Image.asset('assets/images/if-weather-32-2682819_90762.png', width: 58, height: 50, fit: BoxFit.fill),
            SizedBox(height: 8),
            Text(temperatures[4], style: TextStyle(color: Colors.white, fontSize: 12),),
          ]
        ),
      ]
    )
  }
}*/