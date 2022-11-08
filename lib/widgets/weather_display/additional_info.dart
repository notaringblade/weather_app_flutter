import 'package:flutter/material.dart';

Widget additionalInfo(
    String description, String additionalDescription, String humidity, String wind, String deg, String feelsLike,String maxTemp,String minTemp, ) {
  
  return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
                const SizedBox(height: 40,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,              
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Conditions:",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                    const Text(
                      "Additional:",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                    const Text(
                      "humidity:",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                    const Text(
                      "Wind Speed:",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                    const Text(
                      "Deg:",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                    const Text(
                      "Feels Like:",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),const Text(
                      "Max Temp:",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),const Text(
                      "Min Temp:",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    Text(
                      description,
                      style: const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                    Text(
                      additionalDescription,
                      style: const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                    Text(
                      humidity,
                      style: const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                    Text(
                      wind,
                      style: const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                    Text(
                      deg,
                      style: const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                    Text(
                      feelsLike,
                      style: const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),Text(
                      maxTemp,
                      style: const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),Text(
                      minTemp,
                      style: const TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                    const SizedBox(
                        height: 40.0, 
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
}
        
