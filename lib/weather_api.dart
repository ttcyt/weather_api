import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:refactor_weather_api/model/weathers.dart';

void main() async {
  var apiKey = 'https://opendata.cwa.gov.tw/api/v1/rest/datastore/F-C0032-001?Authorization=CWB-2DEB9FC9-DBD5-49DD-A6CE-B5FE20BDCBBC';
  var response = await http.get(Uri.parse(apiKey));
  var weatherMap = jsonDecode(response.body);
  var location = weatherMap['records']['location'];
  late var weatherElement;
  Weather weather = Weather();
  Weather dawnWeather = Weather();
  Weather dayWeather = Weather();
  Weather nightWeather = Weather();
//
//   print(location);
  for (var cityName in location) {
    if (cityName['locationName'] == '嘉義縣') {
      // print(cityName['weatherElement']);
      weatherElement = cityName['weatherElement'];
    }
  }
  for (var element in weatherElement) {
    if (element['elementName'] == 'Wx') {
      dawnWeather.wx = element['time'][0]['parameter']['parameterName'];
      dayWeather.wx = element['time'][1]['parameter']['parameterName'];
      nightWeather.wx = element['time'][2]['parameter']['parameterName'];

    }
    if (element['elementName'] == 'PoP') {
      dawnWeather.pop = int.parse(element['time'][0]['parameter']['parameterName']);
      dayWeather.pop = int.parse(element['time'][1]['parameter']['parameterName']);;
      nightWeather.pop = int.parse(element['time'][2]['parameter']['parameterName']);;

    }
    if (element['elementName'] == 'MinT') {
      dawnWeather.minT = int.parse(element['time'][0]['parameter']['parameterName']);
      dayWeather.minT = int.parse(element['time'][1]['parameter']['parameterName']);
      nightWeather.minT = int.parse(element['time'][2]['parameter']['parameterName']);

    }
    if (element['elementName'] == 'MaxT') {
      dawnWeather.maxT = int.parse(element['time'][0]['parameter']['parameterName']);
      dayWeather.maxT = int.parse(element['time'][1]['parameter']['parameterName']);
      nightWeather.maxT = int.parse(element['time'][2]['parameter']['parameterName']);
    }
    if (element['elementName'] == 'Ci') {
      dawnWeather.ci = element['time'][0]['parameter']['parameterName'];
      dayWeather.ci= element['time'][1]['parameter']['parameterName'];
      nightWeather.ci = element['time'][2]['parameter']['parameterName'];

    }
  }

}


