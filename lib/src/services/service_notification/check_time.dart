import 'dart:async';
import 'package:intl/intl.dart';

import 'package:weather_app/src/services/serializers.dart';
import 'package:weather_app/src/services/api_service.dart';
import '../../db/model.dart';
import 'notifications.dart';

void startEventLoop(int id) async {
  checkConditions(id);
}

void checkConditions(int id) async {
  String allertTime = await WeatherAPIRetrieve(id);

  bool coditionTime = await hasTimePassed(allertTime);
  if (coditionTime) {
    // время прошло
    print('Время меньше за рамки текущего. Выберите больше времени');
    print('Или за это время не было дощщ');
  } else {
      bool conditionRain = await checkRain(allertTime);
      if (conditionRain) {
        // Дощщ || Уведомления должно срабатувать тут !!!
        RainyNotification();
        print('Дощщщ!!!');
      }
      else {
        print('Нету дощ');
      }
  }
  
  print('[TEST] $allertTime');
}


bool hasTimePassed(String alertTime) {
  DateTime now = DateTime.now();
  DateTime alert = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(alertTime);

  // Если текущее время больше или равно времени alert, возвращаем false
  if (now.isAfter(alert) || now.isAtSameMomentAs(alert)) {
    return true;
  } else {
    return false;
  }
}

Future<bool> checkRain(String allertTime) async {
//  print('Начало выполнения фоновой задачи (каждую минуту)');
  DateTime alertDateTime = DateTime.parse(allertTime);

  late SerializerJsonWeather weather;
  weather = await ApiService.getWeather(49.233082, 28.468218);
  var current_main_weather = weather.main;

  bool checkRain30Min = await get60MinForecast(alertDateTime);

  if (checkRain30Min) {
    print('Уведомления что дощ будет через 60 минут');
    return true;
  }
  if (current_main_weather == 'Rain') {
      print('trueee');
      // showNotificationForRain();
      return true;
    }
  return false;
  }

Future<bool> get60MinForecast(DateTime userInputTime) async {
  DateTime now = DateTime.now();
  Duration difference = userInputTime.difference(now);

  // Проверяем, находится ли введенное время в пределах следующих 30 минут
  if (difference.inMinutes <= 60 && difference.inMinutes >= 0) {
    // Если да, проверяем прогноз погоды
    late SerializerJsonWeather weather;
    weather = await ApiService.getWeather(49.233082, 28.468218);

    var current_main_weather = weather.main;
    print('Температура: $current_main_weather');

    if (current_main_weather == 'Rain') {
      print('Дощщщ в течение следующих 60 минут!!!');
      return true;
    }
  }

  return false;
}

/*void startEventLoop(String time) {
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
*/