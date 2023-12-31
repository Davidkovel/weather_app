import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

// Настройка инициализации
final InitializationSettings initializationSettings =
    InitializationSettings(
        android: AndroidInitializationSettings('app_icon'));
        

void showNotificationForRain() async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id', 'your channel name', //'your channel description',
      importance: Importance.max, priority: Priority.high, showWhen: false);
  //var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
  );
    //  iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
      0, 'Уведомление', 'Сейчас идет дождь', platformChannelSpecifics,
      payload: 'item x');
}