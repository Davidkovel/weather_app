import 'package:http/http.dart' as http;
import 'dart:convert';

import 'serializers.dart';
import 'filter_api.dart';

class ApiService {
  static const String _apiUrl = 'http://api.openweathermap.org/data/2.5/forecast';
  static const String _apiKey = '2ac56478e32f9f637a96fcde4eeab164';
  static const int cnt = 40;

  static Future<SerializerJsonWeather> getWeather(double lat, double lon) async {
    var response = await http.get(Uri.parse('$_apiUrl?lat=$lat&lon=$lon&cnt=$cnt&appid=$_apiKey'));
    if (response.statusCode == 200){
      var responseData = json.decode(response.body); // С JSON на обычний типа данных DART
      List<Map<String, dynamic>> filteredData = await FilterApiService.filterWeatherData(responseData, 5);
      print('-- $filteredData');
      //double temp_c = weather.temp - 273.15;
      return SerializerJsonWeather.fromJson(filteredData);
    }else {
      print('error an api request');
      throw Exception('Ошибка при запросе к API');
    }
  }
}

class GetCoordinate {
  static const String _apiUrl = 'http://api.openweathermap.org/geo/1.0/direct';
  static const String _apiKey = '2ac56478e32f9f637a96fcde4eeab164';
  static const String limit = '1';
  String q;  

  GetCoordinate({
    required this.q,
  });

  Future<Map<String, double>> fetchCoordinates() async {
    var httpResponse = await http.get(Uri.parse('$_apiUrl?q=$q&limit=$limit&appid=$_apiKey'));
    if (httpResponse.statusCode == 200){
      var responseData = json.decode(httpResponse.body); // С JSON на обычний типа данных DART
      double latitude = responseData[0]['lat'];
      double longitude = responseData[0]['lon'];
      return {'latitude': latitude, 'longitude': longitude};
    }
    return {'latitude': 0.0, 'longitude': 0.0}; // Возвращаем нулевые координаты, если запрос не удался
  }
}