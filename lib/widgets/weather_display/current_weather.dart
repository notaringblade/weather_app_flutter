import 'package:flutter/material.dart';

Widget currentWeather(String temp, String location, String country, Color myColor){
  return Center(
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              
              Text(
                temp,
                style: TextStyle(
                  fontSize: 52.0,
                  color: myColor,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),

              Wrap(
                spacing: 8,
                children: [
                  Text(
                location,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),

              Text(
                country,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              
                ],
              ),
              
            ],
          ),
        ]),
      );
}