import 'model/weathers.dart';

class WeatherData{
  List<Weather> _weathers = [];
  List<Weather> mockDataInit(){
    _weathers.add(Weather(minT: 30, maxT: 40, wx: 'wx1', ci: 'ci1', pop: 10, city: 'city'));
    _weathers.add(Weather(minT: 20, maxT: 30, wx: 'wx2', ci: 'ci2', pop: 10, city: 'city'));
    _weathers.add(Weather(minT: 10, maxT: 20, wx: 'wx3', ci: 'ci3', pop: 10, city: 'city'));

    return _weathers;
  }


}