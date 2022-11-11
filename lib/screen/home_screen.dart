import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_project/screen/search_screen.dart';
import 'package:weather_project/service/location.dart';

import '../service/weather_helper.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen(this.cityNameSearch);
  String cityNameSearch = '';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double temp = 0.0;
  String cityName = '';
  @override
  void initState() {
    var locationManager = LocationHelper();
    locationManager.getCurrentLocation();

    super.initState();
  }

  Future<void> getWeather() async {
    var networkHelper = NetworkHelper(widget.cityNameSearch);
    var data = await networkHelper.getData();
    if (data != 'Error') {
      cityName = jsonDecode(data)['name'];
      temp = jsonDecode(data)['main']['temp'];
    } else {
      cityName = "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    getWeather();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset('images/background.png', fit: BoxFit.fitWidth),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    cityName,
                    style: TextStyle(color: Colors.white, fontSize: 34),
                  ),
                  Text(
                    '19°',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(
                    'Mostly Clear',
                    style: TextStyle(color: Color(0xffa5a8c0), fontSize: 20),
                  ),
                  Text(
                    'H:24°   L:18°',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Image.asset('images/house.png'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
