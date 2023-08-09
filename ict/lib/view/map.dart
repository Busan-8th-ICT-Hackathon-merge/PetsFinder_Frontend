import 'package:flutter/material.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PetsFinder'),
        ),
        body: const Text("지도밑 버튼"),
      ),
    );
  }
}
