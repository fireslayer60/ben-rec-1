import 'package:flutter/material.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(backgroundColor: Color(0xFF081827),
    
    body: Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Enter your Activities here :",style: TextStyle(color: Colors.white,fontSize: 20),),

        ],
      ),
    ),
    
    ));
  }
}