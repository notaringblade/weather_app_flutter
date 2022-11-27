import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
// import 'package:weather_app/pages/history.dart';
import 'package:weather_app/service/weather_api.dart';
import 'package:weather_app/widgets/weather_display/additional_info.dart';
import 'package:weather_app/widgets/weather_display/current_weather.dart';
import 'package:intl/intl.dart';
import '../globals.dart' as globals;



class WeatherHome extends StatefulWidget {
  const WeatherHome({super.key});

  @override
  State<WeatherHome> createState() => _WeatherState();
}

class _WeatherState extends State<WeatherHome> {
  WeahterApi client = WeahterApi();
  Weather? data;
  final TextEditingController _textController = TextEditingController();
  String location = globals.persistLocation;
  String? error = "";
  String prevLocation = "";
  IconData? myIcon = Icons.cloud;
  Color myColor = Colors.blue;

  // List<Object> locationHistory = [];
  

  
  Future<void> getData() async {
    try {
      data = await client.getCurrentWeather(location);
      checkConditions();
      error = "";
    } catch (e) {
      // print(e);
      error = "'$location' IS AN INVALID LOCATION!!!";
    }
  }


  void checkConditions() {
    String date = DateFormat("hh:mm a").format(DateTime.now());

          globals.persistLocation = location;


    print(globals.historyList);

    if (data!.temp! >= 20.0) {
      myColor = Colors.orangeAccent;
    globals.historyList.insert(0,
      globals.LocationHistory(location: "${data!.locationName}", temp: "${data!.temp}", date: date, myColor: myColor, countryName: data!.countryName),
      
    );

      if (data!.description! == "Clear") {
        myIcon = Icons.sunny;
      } else if (data!.description! == "Rain") {
        myColor = Colors.blue;
        myIcon = Icons.cloudy_snowing;
      } else if(data!.description! == "Clouds"){
        myIcon = Icons.cloud_outlined;
      }
      else {
        myIcon = Icons.wb_sunny_outlined;
      }
    } else if (data!.temp! < 20.0) {
      myColor = Colors.lightBlue;
      globals.historyList.insert(0,
      globals.LocationHistory(location: "${data!.locationName}", temp: "${data!.temp}", date: date, myColor: myColor, countryName: data!.countryName),
      
    );
      if (data!.description! == "Clear") {
        myIcon = Icons.sunny;
      } else if (data!.description! == "Rain") {
        myColor = Colors.blue;
        myIcon = Icons.cloudy_snowing;
      } else if (data!.description! == "Snow") {
        myColor = Colors.lightBlue;
        myIcon = Icons.cloudy_snowing;
      } else if(data!.description! == "Clouds"){
        myIcon = Icons.cloud_outlined;
      }
      else {
        myIcon = Icons.wb_sunny_outlined;
      }
    } else if (data!.temp! > 30) {
      myColor = Colors.redAccent;
    }
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0x14140F80),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
              controller: _textController,
              decoration: const InputDecoration(
                hintText: "Enter a location",
                hintStyle: TextStyle(color: Colors.white60),
              ),
              onFieldSubmitted: (value) {
                if (_textController.text != "") {
                  location = _textController.text;
                  setState(() {});
                  _textController.text = "";

                }
              },
              textInputAction: TextInputAction.search,
            ),
            FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (error != "") {
                    return Center(
                      child: Text(
                        error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Icon(
                            myIcon,
                            color: myColor,
                            size: 86.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          currentWeather(
                              "${data!.temp?.round()} °C",
                              "${data!.locationName},",
                              "${data!.countryName}",
                              myColor),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Divider(
                            color: myColor,
                            thickness: 1,
                          ),
                          additionalInfo(
                            "${data!.description}",
                            "${data!.additionalDescription}",
                            "${data!.humidity}",
                            "${data!.wind}",
                            "${data!.deg}",
                            "${data!.feelsLike}  °C",
                            "${data!.maxTemp}  °C",
                            "${data!.minTemp}  °C",
                          ),
                        ]);
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      CircularProgressIndicator(color: myColor),
                    ],
                  );
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return const Center(
                    child: Text(
                      "Nope",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return const Center(
                  child: Text(
                    "Server timed out!",
                    style: TextStyle(color: Colors.amber),
                  ),
                );
              },
            )
          ],
          
        ),
        
      ),
       
  
    );
  }
  }