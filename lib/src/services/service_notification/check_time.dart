import 'dart:async';
import 'package:intl/intl.dart';
import 'package:weather_app/src/services/serializers.dart';
import 'package:weather_app/src/services/api_service.dart';

import './notifications.dart';

void startEventLoop(String time) {
  // Запускаем фоновую задачу каждую минуту
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
  startHourlyBackgroundTask(time);
}

bool stopBackgroundTask = false; // Условие для остановки задачи

void startHourlyBackgroundTask(String time) {
  Timer.periodic(Duration(minutes: 1), (Timer timer) async {
    // Выполняем фоновую задачу, если условие для остановки равно false
    if (await checkTime(time)) {
      timer.cancel();
      print('Фоновая задача остановлена.');
    } else {
      bool rain = await runHourlyTask();
      if (rain) {
        timer.cancel();
        print('Фоновая задача остановлена.');
      }
    }
  });
}


Future<bool> checkTime(String time) async {
  DateTime now = DateTime.now();
  DateTime targetTime = DateFormat('HH:mm').parse(time);

  // Преобразование текущего времени и времени targetTime в UTC
  now = DateTime.utc(now.year, now.month, now.day, now.hour, now.minute);
  targetTime = DateTime.utc(now.year, now.month, now.day, targetTime.hour, targetTime.minute);

  // Сравниваем времена
  if (now.isBefore(targetTime)) {
    print('object');
    return false;
  }
  print('323');
  showNotificationForRain();
  return true;
  
}

Future<bool> runHourlyTask() async {
  print('Начало выполнения фоновой задачи (каждую минуту)');
  
  late SerializerJsonWeather weather;
  weather = await ApiService.getWeather(49.233082, 28.468218);

  var current_main_weather = weather.main;
  print('Температура: $current_main_weather');

  if (current_main_weather == 'Rain') {
      print('object');
      showNotificationForRain();
      return true;
    }
  return false;
  }
