import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => LandingState();
}

class LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PetsFinder'),
        ),
        body: const Text("첫화면"),
      ),
    );
  }
}
