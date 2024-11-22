import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class AnimatedBut extends StatefulWidget {
  final String text2;
  final int index;
  final bool isSelected;
  final Function(int) onPressed;
  const AnimatedBut({super.key, required this.text2, required this.index, required this.isSelected, required this.onPressed});

  @override
  State<AnimatedBut> createState() => _AnimatedButState();
}

class _AnimatedButState extends State<AnimatedBut> {
   late String userInput;
   

  @override
  void initState() {
    super.initState();
    userInput = widget.text2;
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        height: 50,
        width: 250,
        text: userInput,
        isReverse: true,
        selectedTextColor: Colors.white,
        selectedGradientColor: LinearGradient(colors: [Color(0xFF081827),Color(0xFF081827)]),
        transitionType: TransitionType.LEFT_TO_RIGHT,
        textStyle: TextStyle(fontSize: 20),
        backgroundColor: Colors.white.withOpacity(0.7),
        borderColor: Colors.white,
        borderRadius: 50,
        borderWidth: 2, 
        isSelected: widget.isSelected,
      onPress: () {
        widget.onPressed(widget.index);
      },);
  }
}