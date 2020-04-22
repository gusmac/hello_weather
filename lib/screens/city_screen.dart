import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: FlatButton(
              color: Colors.blueGrey,
              child: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (value) {
                cityName = value;
              },
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pop(context, cityName);
            },
            child: Text(
              'Get Weather',
            ),
          ),
        ],
      )),
    );
  }
}
