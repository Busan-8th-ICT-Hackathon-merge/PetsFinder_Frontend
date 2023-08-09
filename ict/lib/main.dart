import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ict/repository/place_repository.dart';
import 'package:ict/view/home.dart';
import 'package:ict/view_model/place_view_model.dart';
import 'package:provider/provider.dart';

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
  final PlaceRepository placeRepository = PlaceRepository(Client());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlaceViewModel(placeRepository),
      builder: (context, _) => const MaterialApp(
          home: Scaffold(
        body: home(),
      )),
    );
  }
}
