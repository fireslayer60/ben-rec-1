import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:hack/pages/NotesPage.dart';
import 'package:hack/pages/Reminder.dart';
import 'package:hack/pages/mainpage.dart';
import 'package:hack/pages/sentiment.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {


  int _selectedIndex = 1;
   List<Widget> yoo = [MyJournalApp(), HomePage(),SentimentPage() ];
  

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: yoo[_selectedIndex],
      
      bottomNavigationBar: GNav(
      onTabChange: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
      selectedIndex: _selectedIndex,
      color: Colors.black,
      backgroundColor: Colors.black,
      activeColor: Colors.black,
      tabBackgroundColor: Color(0xFFF4BE0A),
      tabMargin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      
      gap: 7,
      iconSize: 25,
      tabs: [
      
      GButton(text:"Notes",
      
        iconColor: Colors.white,
        icon: Icons.note_outlined,
        
        
        ),
      
      GButton(text: "Home",
      iconColor: Colors.white,
        icon: Icons.home_outlined,
              ),
      
      GButton(text:"Journal",
      iconColor: Colors.white,
        icon: Icons.book_outlined)
    
    
    
    ]),));
  }
}