import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hello_weather/screens/city_screen.dart';
import 'package:hello_weather/services/weather_model.dart';

class WeatherHomeScreen extends StatefulWidget {
  WeatherHomeScreen({this.locationWeather});

  final locationWeather;

  @override
  _WeatherHomeScreenState createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends State<WeatherHomeScreen> {
  WeatherModel weather = WeatherModel();
  //properties
  int temperature;
  double temp;
  String main;
  String icon;
  String description;
  String cityName;
  int pressure;
  String iconurl;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        icon = 'Error';
        description = 'Unable to get weatehr data';
        cityName = '';
        return;
      }
      temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      main = weatherData['weather'][0]['main'];
      icon = weatherData['weather'][0]['icon'];
      iconurl = "http://openweathermap.org/img/w/" + icon + ".png";
      description = weatherData['weather'][0]['description'];
      cityName = weatherData['name'];
      pressure = weatherData['main']['pressure'];
    });
  }

  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    print(position);
  }

  Widget _buildForecast(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: ListTile(
        title: Text('9th March'),
        subtitle: Text('Sunny • Max 31 • Min 21 • UV Max 5'),
        dense: true,
        trailing: Icon(Icons.more_vert),
        onTap: () => print('Go to detailed forecast'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () async {
          var typedName = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CityScreen();
              },
            ),
          );
          if (typedName != null) {
            var weatherData = await weather.getCityWeather(typedName);
            updateUI(weatherData);
          }
        },
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 80.0),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '$cityName',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Currently $temperature°, $main and $description',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                  Image.network(iconurl),
                ],
              ),
            );
          }
          //TODO - add another area similar to the Yahoo Weather app, possibly the radar feature or the hourly forecast.
          return _buildForecast(
              index); // TODO - a future list of the next few days of forcasts
        },
      ),
    );
  }
}
