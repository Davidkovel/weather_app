import 'package:flutter/material.dart';
import '../../services/service_api/api_service.dart';
import '../../services/service_api/serializers.dart';
import '../main_widget/display_widget.dart';

class MyApp2 extends StatefulWidget {
  final String lat;
  final String lon;
  final String? Country;

  MyApp2({this.lat = "49.233082", this.lon = "28.468218", this.Country});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  late Future<SerializerJsonWeather> futureWeather;
  String? country;

  @override
  void initState() {
    super.initState();
    print('${widget.lat} ${widget.lon}');
    country = widget.Country;
    futureWeather = ApiService.getWeather(double.parse(widget.lat), double.parse(widget.lon));
  }

  @override
  Widget build(BuildContext context) {
    print('$country');
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
                    return WidgetClouds(weather: snapshot.data!, coutryName: country);
                  case ('Sunny'):
                    return WidgetSunny(weather: snapshot.data!, coutryName: country);
                  case ('Rain'):
                    return WidgetRain(weather: snapshot.data!, coutryName: country);  
                  case ('Snow'):
                    return WidgetSnow(weather: snapshot.data!, coutryName: country); 
                  case ('Clear'):
                    return WidgetClear(weather: snapshot.data!, coutryName: country); 
                  default:
                    // return WidgetSunny(weather: snapshot.data!, coutryName: country);
                  
                    return WidgetRain(weather: snapshot.data!, coutryName: country);
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
