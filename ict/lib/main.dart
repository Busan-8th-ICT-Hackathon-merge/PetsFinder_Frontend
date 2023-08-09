import 'package:flutter/material.dart';
import 'package:ict/view/home.dart';

void main() {
  runApp(const MaterialApp(
    home: Iot(),
  ));
}

class Iot extends StatefulWidget {
  const Iot({super.key});

  @override
  State<Iot> createState() => _IotState();
}

class _IotState extends State<Iot> {
  @override
  Widget build(BuildContext context) {
    return const home();
  }
}
