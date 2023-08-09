import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  static final LatLng schoolLatlng = const LatLng(
    //위도와 경도 값 지정
    37.540853,
    127.078971,
  );

  static final CameraPosition initialPosition = CameraPosition(
    //지도를 바라보는 카메라 위치
    target: schoolLatlng, //카메라 위치(위도, 경도)
    zoom: 15, //확대 정도
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          '구글지도로 보는 학교',
          style:
              TextStyle(color: Colors.green[900], fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: GoogleMap(
        //구글 맵 사용
        mapType: MapType.satellite, //지도 유형 설정
        initialCameraPosition: initialPosition, //지도 초기 위치 설정
      ),
    ));
  }
}
