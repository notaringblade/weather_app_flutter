import 'package:flutter/material.dart';
import 'package:weather_app/pages/history.dart';
import 'package:weather_app/pages/home.dart';


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


  //bottom bar
    int selectedIndex = 0;

      List<Widget> pages = const [
    WeatherHome(),
    HistoryP()
    // TestPageTwo(),
    // TestPageThree(),
  ];

  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0x14140F80),
      appBar: AppBar(
        backgroundColor: const Color(0x14140F80),
        title: const Text("Weather-App"),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 45,
      ),
      body: pages[selectedIndex],
      
       bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor: const Color(0x14140F80),
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(color: Colors.lightBlueAccent, size: 40),
        selectedItemColor: Colors.lightBlueAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.white,
        unselectedIconTheme: const IconThemeData(size: 20),
        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_outlined),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          
        ],
          currentIndex: selectedIndex,
          onTap: (index) => setState(() => selectedIndex = index),
      ),
  
    );
  }
}
