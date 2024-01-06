import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:weather_app/src/services/api_service.dart';
import 'change_widget.dart';

/// Flutter code sample for [SearchBar].

void main() => runApp(const SearchBarApp());

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({Key? key}) : super(key: key);

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;
  
  Future<List<ListTile>> fileCoutriesNames() async {
    // Загрузка содержимого JSON-файла
    String jsonString = await rootBundle.loadString('files/coutries_names.json');

    // Хэш таблицы
    Map<String, dynamic> data = jsonDecode(jsonString);

    List<ListTile> listTiles = data.entries.map((entry) {
      return ListTile(
        title: Text(entry.value),
        onTap: () {
          // Ваш код здесь
          print('ENTRY $entry');
        },
      );
    }).toList();

    return listTiles;
  }

  Future<Map<String, dynamic>> fetchAndPrintCoordinates(String countryName) async {
    var coordinates = await GetCoordinate(q: countryName).fetchCoordinates();
    print('Latitude: ${coordinates['latitude']}, Longitude: ${coordinates['longitude']}');
    return {'latitude': coordinates['latitude'], 'longitude': coordinates['longitude']};
  }


  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return Scaffold(
        backgroundColor: Color.fromARGB(253, 13, 13, 18),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
              trailing: <Widget>[
                Tooltip(
                  message: 'Change brightness mode',
                  child: IconButton(
                    icon: isDark ? const Icon(Icons.brightness_2_outlined) : const Icon(Icons.wb_sunny_outlined),
                    onPressed: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                  ),
                )
              ],
            );
          }, suggestionsBuilder: (BuildContext context, SearchController controller) async {
              List<ListTile> countries = await fileCoutriesNames();
              return countries.map((ListTile countryTile) {
                return ListTile(
                  title: countryTile.title,
                  onTap: () {
                    setState(() {
                      controller.closeView((countryTile.title as Text).data);
                      print('fsdfds{${countryTile.title}}');
                      String countryName = (countryTile.title as Text).data!;
                      fetchAndPrintCoordinates(countryName).then((coordinates) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => MyApp2(lat: coordinates['latitude'].toString(), lon: coordinates['longitude'].toString(), Country: countryName,),
                        ),
                      );
                    });

                      },
                    );
                  });
                }
              );
            },
          ),
        ),
      );
  }
}
