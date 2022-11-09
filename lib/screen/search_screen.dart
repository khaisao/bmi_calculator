import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xffA2A1BB),
                      size: 27,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Weather',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0x3cEBEBF5),
                ),
                hintText: 'Search for a city',
                hintStyle: TextStyle(
                  color: Color(0x3cEBEBF5),
                ),
                border: InputBorder.none,
              ),
            )
          ],
        ),
        backgroundColor: Color(0xff2E335A),
      ),
    );
  }
}
