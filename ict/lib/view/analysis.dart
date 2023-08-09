import 'package:flutter/material.dart';
import 'package:ict/view/data.dart';

class analysis extends StatefulWidget {
  const analysis({super.key});

  @override
  State<analysis> createState() => _analysisState();
}

class _analysisState extends State<analysis> {
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
        body: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const data()),
                );
              },
              child: const Text("날짜들 주루룩 2주치 정도만"),
            )
          ],
        ),
      ),
    );
  }
}
