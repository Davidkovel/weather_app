import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

/// Flutter code sample for [SearchBar].

void main() => runApp(const SearchBarApp());

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

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

    // Использование данных для генерации списка
    List<ListTile> listTiles = data.entries.map((entry) {
      return ListTile(
        title: Text(entry.value),
        onTap: () {
          // Ваш код здесь
        },
      );
    }).toList();

    return listTiles;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: Scaffold(
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
                    isSelected: isDark,
                    onPressed: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                    icon: const Icon(Icons.wb_sunny_outlined),
                    selectedIcon: const Icon(Icons.brightness_2_outlined),
                  ),
                )
              ],
            );
          }, suggestionsBuilder:
                  (BuildContext context, SearchController controller) async {
            return await fileCoutriesNames();
          }),
        ),
      ),
    );
  }
}
