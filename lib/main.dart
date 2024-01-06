import 'package:flutter/material.dart';
import 'src/services/service_notification/notifications.dart';
import 'src/widgets/display_widget.dart';
import 'src/services/api_service.dart';
import 'src/services/serializers.dart';

void main() {
  initializeNotifications(); 
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<SerializerJsonWeather> futureWeather;

  @override
  void initState() {
    checkNotificationPermission();
    super.initState();
    futureWeather = ApiService.getWeather(49.233082, 28.468218);
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
              return CircularProgressIndicator();  // Пока данные загружаются, отобразите индикатор загрузки
            },
          ),
        ),
      ),
    );
  }
}
