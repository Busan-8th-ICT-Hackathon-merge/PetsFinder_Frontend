import 'package:flutter/material.dart';

class data extends StatefulWidget {
  const data({super.key});

  @override
  State<data> createState() => _dataState();
}

class _dataState extends State<data> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Infantory'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const Text("날짜에 맞는 데이터 보여줌"),
      ),
    );
  }
}
