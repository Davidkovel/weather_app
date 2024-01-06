import 'package:http/http.dart' as http;
import 'dart:convert';

Future<int> WeatherAPICreate(DateTime time) async {
  String formattedTime = time.toIso8601String();

  var response = await http.post(Uri.parse('http://127.0.0.1:8000/api/v1/timecreate/?allertTime=$formattedTime'));
  print('hhhh ${response.body}');
  
  Map<String, dynamic> responseBody = jsonDecode(response.body);
  int id = responseBody['id'];
  
  return id;
}

Future<String> WeatherAPIRetrieve(int id) async {
  var response = await http.get(Uri.parse('http://127.0.0.1:8000/api/v1/timelist/$id'));

  Map<String, dynamic> responseBody = jsonDecode(response.body);
  String allertTime = responseBody['alertTime'];

  return allertTime;
}

Future<void> WeatherAPIDelete(int id) async {
  var response = await http.delete(Uri.parse('http://127.0.0.1:8000/api/v1/timedelete/$id'));
}

/*import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void createDatabase() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'weather_app-db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE WeatherAlerts(id INTEGER PRIMARY KEY, alertTime TEXT NOT NULL)",
      );
    },
    version: 1,
  );
}

void insertTime(String formattedTime) async {
  print('dkfdsjfkdsjfiwjdfKSNFSFASSAN');
  print('AAAAAAAAAAA $formattedTime');
  final database = await openDatabase(
    join(await getDatabasesPath(), 'weather_app-db'),
    version: 1,
  );

  await database.transaction((txn) async {
    await txn.rawInsert(
      'INSERT INTO WeatherAlerts(alertTime) VALUES(?)',
      [formattedTime],
    );
  });
}

*/