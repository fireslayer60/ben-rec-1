import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: maxHeight,
        width: maxWidth,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/imgnew.jpg"),fit: BoxFit.contain)),
        child:  Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 130),
            child: Text("Rhythms",style: TextStyle(fontSize: 55,color: Color(0xFFF4BE0A),fontWeight: FontWeight.bold),textAlign:TextAlign.left,),
          ),
          Padding(
            padding: EdgeInsets.only(right:70),
            child: Text("That shake",style: TextStyle(fontSize: 55,color: Colors.white,fontWeight: FontWeight.bold,),),
          ),
          Padding(
            padding: EdgeInsets.only(right:110),
            child: Text("your soul",style: TextStyle(fontSize: 55,color: Colors.white,fontWeight: FontWeight.bold),),
          ),
          SizedBox(height:230),
          Container(
      width: 350, // Adjust width as needed
      height: 60, // Adjust height as needed
      child: ElevatedButton(
        onPressed: () {
          // Add your button onPressed functionality here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF4BE0A), // Background color
          foregroundColor: Color(0xFF1C252F), // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          'Spicy Music here --->',
          style: TextStyle(fontSize: 18),
        ),
      ),
    ),
    SizedBox(height: 20,),
    Container(
      width: 350, // Adjust width as needed
      height: 60, // Adjust height as needed
      child: ElevatedButton(
        onPressed: () {
          // Add your button onPressed functionality here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF4BE0A), // Background color
          foregroundColor: Color(0xFF1C252F), // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          '<--- Your feelings here',
          style: TextStyle(fontSize: 18),
        ),
      ),
    )
        ],)
      ),

    ));
  }
}