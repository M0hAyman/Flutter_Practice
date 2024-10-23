import 'package:flutter/material.dart';
import 'package:lab2/gradient_container.dart';
//Divide project files into srcs,controllers,....,images

void main() {
  const List<Color> colors = [
    Color.fromARGB(255, 0, 243, 16),
    Color.fromARGB(255, 74, 153, 0),
  ];
  //runApp(const MyApp());
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dice Roller',
          style: TextStyle(
              color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      //backgroundColor: Color.fromARGB(255, 5, 200, 80),
      //We want a gradient color instead of a solid color so we will use a container
      body: const GradientContainer(colors),
    ),
    debugShowCheckedModeBanner: false,
  ));
}
