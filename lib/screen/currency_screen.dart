import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_project/service/currency_helper.dart';

import '../const/utils.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  var value = 0.0;

  @override
  void initState() {
    getCurrency();
    super.initState();
  }

  Future<void> getCurrency() async {
    var currencyHelper = CurrencyHelper();
    var data = await currencyHelper.getData();
    setState(() {
      value = jsonDecode(data)['rate'];
    });
  }

  String dropdownValue = listCurrency.first;

  CupertinoPicker IOSCurrencyPicker() {
    return CupertinoPicker(
      children: listCurrency
          .map(
            (e) => Text(
              e,
              style: TextStyle(fontSize: 18),
            ),
          )
          .toList(),
      itemExtent: 32,
      onSelectedItemChanged: (index) {},
    );
  }

  DropdownButton<String> AndroidCurrencyPicker() {
    return DropdownButton(
      value: dropdownValue,
      items: listCurrency.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) => {
        setState(
          () {
            dropdownValue = value!;
          },
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Coin Ticker'),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '1 BTC = ${value} USD',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.cyan,
              child: Center(
                child: Platform.isIOS
                    ? IOSCurrencyPicker()
                    : AndroidCurrencyPicker(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
