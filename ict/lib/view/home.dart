import 'package:flutter/material.dart';
import 'package:ict/view/analysis.dart';
import 'package:ict/view/data.dart';
import 'package:ict/view/streaming.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Infantory'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const analysis()),
                  );
                },
                child: const Text('analysis'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const streaming()),
                  );
                },
                child: const Text('streaming'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const data()),
                  );
                },
                child: const Text('어제자 데이터 분석'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
