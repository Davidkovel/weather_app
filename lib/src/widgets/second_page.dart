import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/services/service_notification/check_time.dart';
import 'package:workmanager/workmanager.dart';

import '../db/model.dart';

void runBackgroundTask(){
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);
  Workmanager().registerPeriodicTask("1", "simplePeriodicTask", 
      frequency: Duration(minutes: 15));
}

void callbackDispatcher(int id) {
  print('started background task');
  Workmanager().executeTask((task, inputData) async {
    startEventLoop(id);
    return Future.value(true);
  });
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Time _time = Time(hour: 1, minute: 02, second: 2);
  bool iosStyle = false;


  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
      print('$_time');
      print('$newTime');
    });
  }
  
  String formatTime(DateTime time) {
    String year = '${time.year}';
    String month = time.month < 10 ? '0${time.month}' : '${time.month}';
    String day = time.day < 10 ? '0${time.day}' : '${time.day}';
    String hour = time.hour < 10 ? '0${time.hour}' : '${time.hour}';
    String minute = time.minute < 10 ? '0${time.minute}' : '${time.minute}';
    print('$year-$month-$day $hour:$minute');
    return '$year-$month-$day $hour:$minute';
  }

  String processAndDisplayTime(TimeOfDay newTime){
    DateTime currentDate = DateTime.now();

    DateTime combinedDateTime = DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      newTime.hour,
      newTime.minute,
    );
    final formattedTime = formatTime(combinedDateTime);
    featureCheckingTime(combinedDateTime);
    return "Ви вибрали: $formattedTime";
  }

  Future<String> featureCheckingTime(DateTime combinedDateTime) async {
    print('$combinedDateTime');
    final formattedTime = formatTime(combinedDateTime);
    int id = await WeatherAPICreate(combinedDateTime);
    print('hhhbbk ${formattedTime}');

    if (formattedTime != '01:02'){
      List<String> lst = [formattedTime];
      startEventLoop(id);
      //callbackDispatcher(id);
      print('${lst}');
    }
    return "Ви вибрали: $formattedTime";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(253, 13, 13, 18),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "${processAndDisplayTime(_time)}"
                      .toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                // Render inline widget
                showPicker(
                  isInlinePicker: true,
                  elevation: 1,
                  value: _time,
                  onChange: onTimeChanged,
                  minuteInterval: TimePickerInterval.FIVE,
                  iosStylePicker: iosStyle,
                  minHour: 1,
                  maxHour: 23,
                  is24HrFormat: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Popup Picker Style",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "${_time.hour}:${_time.minute}:${_time.second} ${_time.period.name}"
                      .toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      showPicker(
                        showSecondSelector: true,
                        context: context,
                        value: _time,
                        onChange: onTimeChanged,
                        minuteInterval: TimePickerInterval.FIVE,
                        // Optional onChange to receive value as DateTime
                        onChangeDateTime: (DateTime dateTime) {
                          // print(dateTime);
                          debugPrint("[debug datetime]:  $dateTime");
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Open time picker",
                    style: TextStyle(color: Colors.white),
                  ),
                ),*/