library globals;
import 'package:flutter/material.dart';


class LocationHistory{
  String? location;
  String? temp;
  String? date;
  Color? myColor;
  String? countryName;

// added '?'
  
  LocationHistory({this.location, this.temp, this.date, this.myColor, this.countryName});
  // can also add 'required' keyword
}

List<LocationHistory> historyList = [];
String persistLocation = "Goa";