import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class HistoryP extends StatefulWidget {
  const HistoryP({super.key});

  @override
  State<HistoryP> createState() => _HistoryPState();
}

class _HistoryPState extends State<HistoryP> {
  Color myclr = Colors.blue;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: globals.historyList.length,
      // padding: const EdgeInsets.all(8),
      // reverse: true,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Container(
              height: 70,
              width:400,
              // color: globals.historyList[index].myColor,
              decoration: BoxDecoration(border: Border.all(color: (globals.historyList[index].myColor)!), borderRadius: const BorderRadius.all(Radius.circular(50)) ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("${globals.historyList[index].location}, ${globals.historyList[index].countryName}", style: TextStyle(color: Colors.white),),
                  Text("${globals.historyList[index].temp} °C", style: TextStyle(color: Colors.white),),
                  Text("${globals.historyList[index].date}", style: TextStyle(color: Colors.white),),
                  // Text("${globals.historyList[index].countryName}", style: TextStyle(color: Colors.white),),

                ],
              )
            ),

            SizedBox(height: 20),
          ],
        );
      },

    );
  }
}
