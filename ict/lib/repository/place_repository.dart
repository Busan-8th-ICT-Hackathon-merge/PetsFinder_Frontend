import 'dart:convert';
import 'package:http/http.dart';

import '../model/place.dart';

class PlaceRepository {
  static const String url = "http://101.101.217.144:3001/path";

  final Client _client;

  PlaceRepository(this._client);

  Future<List<Place>> fetchData(String area) async {
    Uri uri = Uri.parse("$url?area=$area");

    Response response = await _client.get(uri);

    List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

    List<Place> data = json.map((e) => Place.fromJson(e)).toList();

    return data;
  }
}
