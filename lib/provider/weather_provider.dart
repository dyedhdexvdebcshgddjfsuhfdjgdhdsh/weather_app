import 'package:flutter/cupertino.dart';
import 'package:simple_weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier{
  WeatherModel? weatherProvider;
  void getWeatherData({required WeatherModel? weatherModel}){
    weatherProvider=weatherModel;
   notifyListeners();
  }
}