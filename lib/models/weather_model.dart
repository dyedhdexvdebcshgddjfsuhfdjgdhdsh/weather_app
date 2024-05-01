class WeatherModel {
  String? name;
  double? temp;
  double? maxTemp;
  String? icon;
  int? humidity;
  double? windSpeed;
  double? pressure;

  WeatherModel(
      {required this.name,
      required this.temp,
      required this.maxTemp,
      required this.icon,
      required this.humidity,
      required this.windSpeed,
      required this.pressure});
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    var weatherData=json['current'];
    return WeatherModel(
        name: json['location']['name'],
        temp: weatherData['temp_c'],
        maxTemp: weatherData['temp_f'],
        icon: weatherData['condition']['icon'],
        humidity: weatherData['humidity'],
        windSpeed:weatherData['wind_kph'],
        pressure: weatherData['pressure_in']);
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'name': name,
  //     'temp': temp,
  //     'maxTemp': maxTemp,
  //     'icon': icon,
  //     'humidity': humidity,
  //     'windSpeed': windSpeed,
  //     'pressure': pressure
  //   };
}
