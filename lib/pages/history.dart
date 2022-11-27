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
    if(globals.historyList.isEmpty){

          setState(() {
            
          });
          return const Center(
            child: Text("No History To Show", style: TextStyle(color: Colors.red),),
          );
    }
        else if(globals.historyList.isNotEmpty){
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
              height: 90,
              width:400,
              // color: globals.historyList[index].myColor,
              decoration: BoxDecoration(border: Border.all(color: (globals.historyList[index].myColor)!), borderRadius: const BorderRadius.all(Radius.circular(50)) ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: [
                  // SizedBox(height: 20,),
                  
                  Column(
                    children: [
                      SizedBox(height: 10,),
                      Text("${globals.historyList[index].location}, ${globals.historyList[index].countryName}", style: TextStyle(color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("${globals.historyList[index].temp} °C", style: TextStyle(color: Colors.white),),
                      SizedBox(height: 10,),
                      Text("${globals.historyList[index].date}", style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 35,),
                       GestureDetector(
                        onTap: () {
                          globals.historyList.removeAt(index);
                          print(globals.historyList.isNotEmpty);
                          setState(() {
                            print(globals.historyList.isEmpty);
                          });
                        },
                        child:  const Text("Delete", style: TextStyle(color: Colors.redAccent),),
                      )
                    ]
                  ),
                  
                ],
              )
            ),

           const SizedBox(height: 20),
          ],
        );
      },

    );
  }else{
    return Center(

    );
  }
}
}