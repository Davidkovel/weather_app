import 'package:http/http.dart' as http;

void WeatherAPICreate(DateTime time) async {
  String formattedTime = time.toIso8601String();
  
  var response = await http.post(Uri.parse('http://127.0.0.1:8000/api/v1/timecreate/?allertTime=$formattedTime'));
  print('$response');
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