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
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                icon: Icon(Icons.home, color: Colors.blueGrey),
                hintText: 'Enter City Name',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
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
            color: Colors.blueGrey,
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Get Weather',
            ),
          ),
        ],
      )),
    );
  }
}
