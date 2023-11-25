class SerializerJsonWeather {
  final double temp;
  final String main;
  final dynamic day2;
  final dynamic day3;
  final dynamic day4;
  final dynamic day5;

  SerializerJsonWeather({
    required this.temp,
    required this.main,
    required this.day2,
    required this.day3,
    required this.day4,
    required this.day5,
  });

  factory SerializerJsonWeather.fromJson(List<Map<String, dynamic>> json) {
    return SerializerJsonWeather(
      temp: json[0]['main']['temp'].toDouble(),
      main: json[0]['weather'][0]['main'],
      day2: SerializerJsonWeather.weatherTomorrow(json[1]),
      day3: SerializerJsonWeather.weatherDay3(json[2]),
      day4: SerializerJsonWeather.weatherDay4(json[3]),
      day5: SerializerJsonWeather.weatherDay5(json[4]),
    );
  }

  static List<dynamic> weatherTomorrow(Map<String, dynamic> json){
    double tmp = json['main']['temp'].toDouble();
    String main = json['weather'][0]['main'];
    
    List lstDay2 = []; 
    lstDay2.addAll([tmp, main]);

    return lstDay2;
  }

  static List<dynamic> weatherDay3(Map<String, dynamic> json){
    double tmp = json['main']['temp'].toDouble();
    String main = json['weather'][0]['main'];

    List lstDay3 = []; 
    lstDay3.addAll([tmp, main]);

    return lstDay3;
  }

  static List<dynamic> weatherDay4(Map<String, dynamic> json){
    double tmp = json['main']['temp'].toDouble();
    String main = json['weather'][0]['main'];

    List lstDay4 = []; 
    lstDay4.addAll([tmp, main]);

    return lstDay4;
  }

  static List<dynamic> weatherDay5(Map<String, dynamic> json){
    double tmp = json['main']['temp'].toDouble();
    String main = json['weather'][0]['main'];

    List lstDay3 = []; 
    lstDay3.addAll([tmp, main]);

    return lstDay3;
  }
}
