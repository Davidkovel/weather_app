class FilterApiService {
  // Фильтрация для API запроса
  static List<Map<String, dynamic>> filterWeatherData(Map<String, dynamic> data, int days) {
    List<Map<String, dynamic>> filteredData = [];
    for (var item in data['list']) {
      DateTime forecastDate = DateTime.parse(item['dt_txt']);
      DateTime currentDate = DateTime.now();
      DateTime endDate = currentDate.add(Duration(days: days));

      // Если дата прогноза входит в указанный период (например, 5 дней)
      if (forecastDate.isAfter(currentDate) && forecastDate.isBefore(endDate)) {
        filteredData.add(item);
      }
    }

    // Отбираем только первую запись для каждого дня
    List<Map<String, dynamic>> finalData = [];
    Set<String> processedDates = Set();

    for (var item in filteredData) {
      DateTime forecastDate = DateTime.parse(item['dt_txt']);
      String dateKey = "${forecastDate.year}-${forecastDate.month}-${forecastDate.day}";

      if (!processedDates.contains(dateKey)) {
        finalData.add(item);
        processedDates.add(dateKey);
      }
    }
    print('[INFO TEST] - $finalData');
    
    return finalData;
  }
}
