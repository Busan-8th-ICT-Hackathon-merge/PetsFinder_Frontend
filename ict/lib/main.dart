import 'package:flutter/material.dart';
import 'package:ict/view/home.dart';

void main() {
  runApp(const MaterialApp(
    home: Ict(),
  ));
}

class Ict extends StatefulWidget {
  const Ict({super.key});

  @override
  State<Ict> createState() => _IctState();
}

class _IctState extends State<Ict> {
  @override
  Widget build(BuildContext context) {
    return const home();
  }
}
