import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String url = 'http://101.101.217.144:3002/';
    return MaterialApp(
      home: Scaffold(
          body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button(
              context: context,
              title: 'In App Webview',
              onTap: () async {
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                }
              },
            ),
            const SizedBox(height: 48),
            _button(
              context: context,
              title: 'Out App Webview',
              onTap: () async {
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url,
                      mode: LaunchMode.externalApplication);
                }
              },
            ),
          ],
        ),
      )),
    );
  }

  GestureDetector _button({
    required BuildContext context,
    required String title,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromRGBO(135, 135, 135, 1),
          ),
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ))),
    );
  }
}
