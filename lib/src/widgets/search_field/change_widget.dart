import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../services/serializers.dart';
import '../display_widget.dart';

class MyApp2 extends StatefulWidget {
  final String lat;
  final String lon;

  MyApp2({this.lat = "49.233082", this.lon = "28.468218"});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {
  late Future<SerializerJsonWeather> futureWeather;

  @override
  void initState() {
    super.initState();
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
                Widget widget;
                switch (sky) {
                  case ('Clouds'):
                    return WidgetClouds(weather: snapshot.data!);
                  case ('Sunny'):
                    widget = Center(child: Text('Sunny +'),);
                    break;
                  default:
                    return WidgetClouds(weather: snapshot.data!);
                }
                return widget;
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
