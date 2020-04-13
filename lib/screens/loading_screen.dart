import 'package:flutter/material.dart';
import 'package:hello_weather/screens/location.dart';
import 'package:hello_weather/screens/weather_home_screen.dart';
import 'package:hello_weather/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '976e3e57f3839084e5e766d9a51813a5';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();

    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherHomeScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blueGrey,
          size: 80.0,
        ),
      ),
    );
  }
}
