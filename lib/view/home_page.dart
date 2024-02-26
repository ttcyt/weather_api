import 'package:flutter/material.dart';
import 'package:refactor_weather_api/view/forecast_page.dart';
import 'package:refactor_weather_api/model/weathers.dart';
import 'package:refactor_weather_api/weather_api.dart';
import 'package:refactor_weather_api/component/location.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isInit = true;
  int _selectedIndex = 0;
  List<Weather> cityWeathers = [];
  final FocusNode _focus = FocusNode();
  String _location = '';
  final TextEditingController _textController = TextEditingController();


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }
  Future<void> init() async {
    cityWeathers = await WeatherService.getWeatherData(_location);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focus.addListener(() {
      showSearch(context: context, delegate: CustomSearchDelegate(queryLocation:(location){
        _location = location;
        _textController.text = location;
      }));
    });
    init();
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) {
                },
                focusNode:_focus,
                controller: _textController,
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

          ],
        ),
      ),
      // body:SearchAnchor(builder: context, suggestionsBuilder: suggestionsBuilder),
    );
  }
}
