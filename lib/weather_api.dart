import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:refactor_weather_api/model/weathers.dart';

class WeatherService {
  static Future <List<Weather>> getWeatherData (String city) async{
    String apiKey = 'https://opendata.cwa.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=CWB-2DEB9FC9-DBD5-49DD-A6CE-B5FE20BDCBBC';
    http.Response response = await http.get(Uri.parse(apiKey));
    var weatherMap = jsonDecode(response.body);
    var location = weatherMap['records']['location'];
    dynamic weatherElement;

    List<Weather> weatherData = [];
    String wx = '';
    String ci = '';
    int pop = 0;
    int minT = 0;
    int maxT = 0;
    for (var cityName in location) {
      if (cityName['locationName'] == city) {
        weatherElement = cityName['weatherElement'];
      }
    }
    for (int i = 0; i <= 2; i++) {
      for (var element in weatherElement) {
        if (element['elementName'] == 'Wx') {
          wx = element['time'][i]['parameter']['parameterName'];

        }
        if (element['elementName'] == 'PoP') {
          pop = int.parse('${element['time'][i]['parameter']['parameterName']}');
        }
        if (element['elementName'] == 'MinT') {
          minT = int.parse('${element['time'][i]['parameter']['parameterName']}');
        }
        if (element['elementName'] == 'MaxT') {
          maxT = int.parse('${element['time'][i]['parameter']['parameterName']}');
        }
        if (element['elementName'] == 'CI') {
          ci = element['time'][i]['parameter']['parameterName'];
        }

      }
      Weather weather = Weather(minT: minT,
          maxT: maxT,
          wx: wx,
          ci: ci,
          pop: pop,
          city: city);
      weatherData.add(weather);
    }
    return weatherData;
  }
}





