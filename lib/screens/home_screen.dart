import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/provider/weather_provider.dart';
import 'package:simple_weather_app/screens/search_screen.dart';

import 'home_nodata_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var weatherData = Provider.of<WeatherProvider>(context).weatherProvider;
    return Scaffold(

      backgroundColor:Color(0xFFFFFFFF) ,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return SearchScreen(location: weatherData?.name ?? '');
              }));
            },
            icon: Icon(Icons.search),
          )
        ],
        // centerTitle:true,
        title: Text(
          'Weather App',
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: weatherData == null
          ? EmptyHomeScreem()
          : SingleChildScrollView(
            child: Center(
                child: Column(
                  children: [
                 //  Image.asset('images/backgound.png') ,
                    SizedBox(height: 30),
                    Container(
                      height: 80,
                      width: 140,
                      child: Image.network(
                        'https:${weatherData?.icon}',
                        fit: BoxFit.cover,
                        height: 30,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '${weatherData?.temp}',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text('${weatherData?.name}',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                    SizedBox(height: 12),
                    Text(
                      'Additional Information',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Card(
                            elevation: 0,
                            color: const Color(0xFFFFFFFF),
                            child: Column(
                              children: [
                                Text(
                                  '${weatherData?.windSpeed}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset('images/win_speed.png',
                                    height: 80, width: 70,fit:BoxFit.fill,),
                                Text('Wind Speed',
                                    style: TextStyle(fontSize: 30)),
                                SizedBox(width: 8)
                              ],
                            ),
                          ),
                          Spacer(),
                          Card(
                            elevation: 0,
                            color: const Color(0xFFFFFFFF),
                            child: Column(
                              children: [
                                Text(
                                  '${weatherData?.temp}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset('images/temp.png',
                                    height: 60, width: 60),
                                Text('Temp', style: TextStyle(fontSize: 30)),
                                SizedBox(width: 8)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Card(
                            elevation: 0,
                            color: const Color(0xFFFFFFFF),
                            child: Column(
                              children: [
                                Text(
                                  '${weatherData?.humidity}',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset('images/humidity.png',
                                    height: 60, width: 60),
                                Text('Humidity', style: TextStyle(fontSize: 30)),
                                SizedBox(width: 8)
                              ],
                            ),
                          ),
                          Spacer(),
                          Card(
                            elevation: 0,
                            color: const Color(0xFFFFFFFF),
                            child: Column(
                              children: [
                                Text(
                                  '${weatherData?.maxTemp}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image.asset('images/max_temp.png',
                                    height: 60, width: 60),
                                Text('Max Temp', style: TextStyle(fontSize: 20)),
                                SizedBox(width: 8)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
          ),
    );
  }
}
