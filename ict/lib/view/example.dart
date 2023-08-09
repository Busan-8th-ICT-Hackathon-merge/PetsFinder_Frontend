import 'package:flutter/material.dart';

class example extends StatefulWidget {
  const example({super.key});

  @override
  State<example> createState() => _exampleState();
}

class _exampleState extends State<example> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PetsFinder'),
        ),
        body: const Text("예시"),
      ),
    );
  }
}
