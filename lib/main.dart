import 'package:flutter/material.dart';
import 'package:weather_app/model/weather.dart';
import 'package:weather_app/service/weather_api.dart';
import 'package:weather_app/widgets/weather_display/additional_info.dart';
import 'package:weather_app/widgets/weather_display/current_weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeahterApi client = WeahterApi();
  Weather? data;
  final TextEditingController _textController = TextEditingController();
  String? location = "goa";
  String? error = "";
  IconData? myIcon = Icons.cloud;
  Color myColor = Colors.blue;

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
    if (data!.temp! >= 20.0) {
      myColor = Colors.orangeAccent;

      if (data!.description! == "Clear") {
        myIcon = Icons.sunny;
      } else if (data!.description! == "Rain") {
        myColor = Colors.blue;
        myIcon = Icons.cloudy_snowing;
      } else {
        myIcon = Icons.wb_sunny_outlined;
      }
    } else if (data!.temp! < 20.0) {
      myColor = Colors.lightBlue;
      if (data!.description! == "Clear") {
        myIcon = Icons.sunny;
      } else if (data!.description! == "Rain") {
        myColor = Colors.blue;
        myIcon = Icons.cloudy_snowing;
      } else if (data!.description! == "Snow") {
        myColor = Colors.lightBlue;
        myIcon = Icons.cloudy_snowing;
      } else {
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
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: const Text("Weather-App"),
          centerTitle: true,
          elevation: 0,
          toolbarHeight: 45,
        ),
        body: SingleChildScrollView(
          child:
          Column(children: [

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
                          currentWeather("${data!.temp?.round()} °C",
                              "${data!.locationName},", "${data!.countryName}", myColor),
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
                              "${data!.deg}"),
                        ]);
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Column(
                    children: [
                      const SizedBox(height: 100,),
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
          ],)

        ));
  }
}
