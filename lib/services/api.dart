import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_weather_app/models/weather_model.dart';

class ApiServices {
  // baseurl &apiKey
  String? baseUrl = 'http://api.weatherapi.com/v1/';
  String? apiKey = 'fcd94fccb731490681692820241204';
  // method to fetch data from api using http
  Future<WeatherModel>? getWeatherData({required String? location}) async {
    // to convert
    final url =Uri.parse('$baseUrl/current.json?key=$apiKey&q=$location');
    // to get data from url
    http.Response response = await http.get(url);
    // to decode response body
    var weatherBody = await jsonDecode(response.body);
    print('warherdata : $weatherBody');
    return WeatherModel.fromJson(weatherBody!);
  }
}
