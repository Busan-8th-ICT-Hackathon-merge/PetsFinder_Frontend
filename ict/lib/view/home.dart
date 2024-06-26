import 'package:flutter/material.dart';
import 'package:ict/view/Landing.dart';
import 'package:ict/view/example.dart';
import 'package:ict/view/map.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: getPage(curIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(
              () {
                curIndex = index;
              },
            );
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: curIndex == 0
                    ? const Color(0xffDAD0C2)
                    : const Color(0xff1A120B),
              ),
              label: "Landing",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                size: 30,
                color: curIndex == 1
                    ? const Color(0xffDAD0C2)
                    : const Color(0xff1A120B),
              ),
              label: "map",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.api,
                size: 30,
                color: curIndex == 2
                    ? const Color(0xffDAD0C2)
                    : const Color(0xff1A120B),
              ),
              label: "label",
            ),
          ],
        ),
      ),
    );
  }
}

Widget getPage(int curIndex) {
  late Widget page;
  switch (curIndex) {
    case 0:
      page = const Landing();
      break;
    case 1:
      page = const map();
      break;
    case 2:
      page = const Example();
      break;
  }
  return page;
}
