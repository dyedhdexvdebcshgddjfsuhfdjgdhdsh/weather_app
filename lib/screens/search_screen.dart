import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/provider/weather_provider.dart';
import 'package:simple_weather_app/services/api.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key, required this.location}) : super(key: key);
  String? location;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Search Screen'),
        centerTitle: true,
        backgroundColor: Color(0xFFFFFFFF),
      ),
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              onChanged: (data) {
                setState(() {
                  widget.location = data;
                });
              },
              onFieldSubmitted: (data) async {
                setState(() {
                  widget.location = data;
                });
                ApiServices apiService = ApiServices();
                var weather = await apiService.getWeatherData(location: widget.location);
                Provider.of<WeatherProvider>(context, listen: false).getWeatherData(weatherModel: weather);
                Navigator.of(context).pop();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: 'Search for City',
                hintStyle: TextStyle(fontSize: 16),
                contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                suffixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 50),
            Image.asset(
              'images/search_anim.gif',
              height: 250,
              width: 250,
              fit: BoxFit.fill,
              color: Colors.black45,
            ),
            Text(
              'Searching....',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
