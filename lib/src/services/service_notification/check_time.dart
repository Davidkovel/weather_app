import 'dart:async';
import 'package:intl/intl.dart';

import 'package:weather_app/src/services/service_api/serializers.dart';
import 'package:weather_app/src/services/service_api/api_service.dart';
import 'package:workmanager/workmanager.dart';

import '../../db/model.dart';
import 'notifications.dart';

void startEventLoop(int id) async {
  print('fdsfds');
  // RainyNotification();
  checkConditions(id);

}

void checkConditions(int id) async {
  String allertTime = await WeatherAPIRetrieve(id);

  bool coditionTime = await hasTimePassed(allertTime);
  if (coditionTime) {
    // время прошло
    await WeatherAPIDelete(id);
    TimeIsEnd();
    print('Або за цей час не було дощу');
  } else {
      bool conditionRain = await checkRain(allertTime);
      if (conditionRain) {
        // Дощ || Повідомлення має спрацювати тут !!!
        RainyNotification();
        Workmanager().cancelByUniqueName("1");
        await WeatherAPIDelete(id);
        print('Дощщщ!!!');
      }
      else {
        print('Немає дощ');
      }
  }
  
  print('[TEST] $allertTime');
}


bool hasTimePassed(String alertTime) {
  DateTime now = DateTime.now();
  DateTime alert = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(alertTime);

  // Якщо поточний час більший або рівний часу сповіщення, повертаємо true
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
  print('object $current_main_weather');
  bool checkRain30Min = await get60MinForecast(alertDateTime);

  if (checkRain30Min) {
    print('Повідомлення, що дощ буде через 60 хвилин');
    return true;
  }
  if (current_main_weather == 'Rain') {
      print('trueee');
      RainyNotification();
      return true;
    }
  return false;
  }

Future<bool> get60MinForecast(DateTime userInputTime) async {
  DateTime now = DateTime.now();
  Duration difference = userInputTime.difference(now);

  // Перевіряємо, чи знаходиться введений час у межах наступних 60 хвилин
  if (difference.inMinutes <= 60 && difference.inMinutes >= 0) {
    // Якщо да, перевіряємо прогноз погоди
    late SerializerJsonWeather weather;
    weather = await ApiService.getWeather(49.233082, 28.468218);

    var current_main_weather = weather.main;
    print('Температура: $current_main_weather');

    if (current_main_weather == 'Rain') {
      print('Дощ протягом наступних 60 хвилин!!!');
      return true;
    }
  }

  return false;
}