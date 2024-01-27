import 'package:flutter/material.dart';
import '../../services/service_api/api_service.dart';
import '../../services/service_api/serializers.dart';
import '../main_widget/display_widget.dart';

class MyApp2 extends StatefulWidget {
  final String lat;
  final String lon;
  final String? City;
  final String? CountryCode;

  MyApp2({this.lat = "49.233082", this.lon = "28.468218", this.City, this.CountryCode});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  late Future<SerializerJsonWeather> futureWeather;
  String? city, countryCode;
  @override
  void initState() {
    super.initState();
    print('${widget.lat} ${widget.lon}');
    city = widget.City;
    countryCode = widget.CountryCode;
    futureWeather = ApiService.getWeather(double.parse(widget.lat), double.parse(widget.lon));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder<SerializerJsonWeather>(
            future: futureWeather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String sky = snapshot.data!.main;
                switch (sky) {
                  case ('Clouds'):
                    return WidgetClouds(weather: snapshot.data!, cityName: city, countryCode: countryCode);
                  case ('Sunny'):
                    return WidgetSunny(weather: snapshot.data!, cityName: city, countryCode: countryCode);
                  case ('Rain'):
                    return WidgetRain(weather: snapshot.data!, cityName: city, countryCode: countryCode);  
                  case ('Snow'):
                    return WidgetSnow(weather: snapshot.data!, cityName: city, countryCode: countryCode); 
                  case ('Clear'):
                    return WidgetClear(weather: snapshot.data!, cityName: city, countryCode: countryCode); 
                  default:
                    return WidgetClouds(weather: snapshot.data!, cityName: city, countryCode: countryCode);
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
