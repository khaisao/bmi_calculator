import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_project/service/location.dart';

import '../service/weather_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    var locationManager = LocationHelper();
    locationManager.getCurrentLocation();
    super.initState();
  }

  Future<void> getWeather() async {
    var networkHelper = NetworkHelper();
    var data = await networkHelper.getData();

    print(jsonDecode(data)['main']['temp']);
    print(jsonDecode(data)['name']);
  }

  @override
  Widget build(BuildContext context) {
    getWeather();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TextButton(onPressed: () {}, child: Text('Get location')),
      ),
    );
  }
}
