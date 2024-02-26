import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({required this.queryLocation,});

  Function queryLocation;
  var searchTerms = [
    '宜蘭縣',
    '花蓮縣',
    '台東縣',
    '澎湖縣',
    '金門縣',
    '連江縣',
    '台北市',
    '新北勢',
    '桃園市',
    '台中市',
    '台南市',
    '高雄市',
    '基隆市',
    '新竹縣',
    '新竹市',
    '苗栗縣',
    '彰化縣',
    '南投縣',
    '雲林縣',
    '嘉義縣',
    '嘉義市',
    '屏東縣',
  ];
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      Navigator.pop(context);
    }, icon: const Icon(Icons.arrow_back),);
  }

  @override
  List<Widget>?buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.dangerous_outlined)),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    var suggestLocation = [];
    for (String location in searchTerms) {
      if (location.contains(query)) {
        suggestLocation.add(location);
      }
    }
    return ListView.builder(
        itemCount: suggestLocation.length,
        itemBuilder: (context, index) {
          var result = suggestLocation[index];
          return ListTile(
            title: Text(suggestLocation[index]),
            leading: const Icon(FontAwesomeIcons.mapLocationDot),
            onTap: (){
              queryLocation(result);
              close(context, null);
              Navigator.pop(context);
            },
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var suggestLocation = [];
    for (String location in searchTerms) {
      if (location.contains(query)) {
        suggestLocation.add(location);
      }
    }
    return ListView.builder(
        itemCount: suggestLocation.length,
        itemBuilder: (context, index) {
          var result = suggestLocation[index];
          return ListTile(
            title: Text(suggestLocation[index]),
            leading: const Icon(FontAwesomeIcons.mapLocationDot),
            onTap: (){
                queryLocation(result);
                close(context, null);
                Navigator.pop(context);
            },

          );
        }
    );
  }


}

