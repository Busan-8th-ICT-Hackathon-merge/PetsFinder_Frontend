import 'package:flutter/cupertino.dart';
import 'package:ict/repository/place_repository.dart';

import '../model/place.dart';

class PlaceViewModel extends ChangeNotifier {
  final PlaceRepository placeRepository;

  PlaceViewModel(this.placeRepository);

  List<Place> data = [];

  Future<void> getData(String area) async {
    List<Place> fetch = await placeRepository.fetchData(area);

    data = fetch;

    notifyListeners();
  }
}
