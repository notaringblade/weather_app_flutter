import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather.dart';

class WeahterApi{
  Future<Weather>? getCurrentWeather(String? location) async{


    // var endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=8c672b6cda43a2483c8add5b90da821c&units=metric");

    var response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=8c672b6cda43a2483c8add5b90da821c&units=metric"));

    var body = jsonDecode(response.body);

    if(response.statusCode == 200){
      return Weather.fromJson(body);

    }else{
      // return Weather.fromJson(body);
      return Future.error('NO Data');
    }
    // Weather.fromJson(body).error;
  }
}