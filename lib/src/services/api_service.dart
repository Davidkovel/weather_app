import 'package:http/http.dart' as http;
import 'dart:convert';

import 'serializers.dart';
import 'filter_api.dart';

class ApiService {
  static const String _apiUrl = 'http://api.openweathermap.org/data/2.5/forecast';
  static const String _apiKey = '2ac56478e32f9f637a96fcde4eeab164';
  static const int cnt = 40;
  // http://api.openweathermap.org/data/2.5/forecast?lat=49.233082&lon=28.468218&cnt=7&appid=2ac56478e32f9f637a96fcde4eeab164
  static Future<SerializerJsonWeather> getWeather(double lat, double lon) async {
    var response = await http.get(Uri.parse('$_apiUrl?lat=$lat&lon=$lon&cnt=$cnt&appid=$_apiKey'));
    print('\n 463476382946932648923423 dfjg            ');
    if (response.statusCode == 200){
      // print('-- ${response.body}');
      var responseData = json.decode(response.body); // С JSON на обычний типа данных DART
      // print('-- $responseData');
      //print(responseData);
      List<Map<String, dynamic>> filteredData = await FilterApiService.filterWeatherData(responseData, 5);
      print('-- $filteredData');
      //SerializerJsonWeather weather = SerializerJsonWeather.fromJson(json.decode(filteredData));
      //double temp_c = weather.temp - 273.15;
      // Вывод информации о температуре

      
      //print('${weather.description}, ${weather.main}');
      return SerializerJsonWeather.fromJson(filteredData);
    }else {
      print('error an api request');
      throw Exception('Ошибка при запросе к API');
    }
  }
}