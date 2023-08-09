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

    Future<void> _autoLaunchUrl() async {
      if (await canLaunchUrlString(url)) {
        await launchUrlString(url);
      }
    }

    return MaterialApp(
      home: FutureBuilder<void>(
        future: _autoLaunchUrl(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                    child: Text(
                        'URL launched successfully!')), // 이 메시지는 필요에 따라 변경하거나 제거할 수 있습니다.
              ),
            );
          } else {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
