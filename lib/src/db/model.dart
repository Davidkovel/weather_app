import 'package:sqflite/sqflite.dart';
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

