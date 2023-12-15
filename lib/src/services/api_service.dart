import 'package:http/http.dart' as http;

import 'serializers.dart';
import 'dart:convert';

class ApiService {
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static const String _apiKey = '2ac56478e32f9f637a96fcde4eeab164';

  static Future<SerializerJsonWeather> getWeather(double lat, double lon) async {
    var response = await http.get(Uri.parse('$_baseUrl?lat=$lat&lon=$lon&appid=$_apiKey'));
    if (response.statusCode == 200){
      SerializerJsonWeather weather = SerializerJsonWeather.fromJson(json.decode(response.body));
      double temp_c = weather.temp - 273.15;
      // Вывод информации о температуре
      print('${response.body}');
      print('${weather.description}, ${weather.main}');
      return SerializerJsonWeather.fromJson(json.decode(response.body));
    }else {
      print('error an api request');
      throw Exception('Ошибка при запросе к API');
    }
  }
}