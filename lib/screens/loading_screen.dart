import 'package:flutter/material.dart';
import 'package:hello_weather/screens/location.dart';
import 'package:hello_weather/screens/weather_home_screen.dart';
import 'package:hello_weather/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello_weather/services/weather_model.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherHomeScreen(
        locationWeather: weatherData,
      );
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
