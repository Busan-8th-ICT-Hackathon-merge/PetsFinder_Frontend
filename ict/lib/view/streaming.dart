import 'package:flutter/material.dart';

class streaming extends StatefulWidget {
  const streaming({super.key});

  @override
  State<streaming> createState() => _streamingState();
}

class _streamingState extends State<streaming> {
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
        body: const Text("스트리밍보여줌"),
      ),
    );
  }
}
