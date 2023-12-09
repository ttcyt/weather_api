import 'package:flutter/material.dart';
import 'package:refactor_weather_api/view/forecast_page.dart';
import 'package:refactor_weather_api/model/weathers.dart';
import 'package:refactor_weather_api/weather_data.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInit = true;
  String location = '';
  int _selectedIndex = 0;
  List<Weather> weathers = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WeatherData weatherData = WeatherData();
    weathers = weatherData.mockDataInit();

  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Visibility(
        visible: isInit,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.sunny_snowing),
              label: '0-6',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny),
              label: '6-18',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mode_night),
              label: '18-0',
            ),
          ],
          onTap: _onItemTapped,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value){
                  location = value;
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.clear),
                  labelText: 'City Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Expanded(child: ForecastPage(weather: weathers[_selectedIndex],)),
          ],
        ),
      ),
      // body:SearchAnchor(builder: context, suggestionsBuilder: suggestionsBuilder),
    );
  }
}
