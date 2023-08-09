import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';

import '../model/place.dart';

class PlaceRepository {
  static const String url =
      "http://101.101.217.144:3001/path?area=%ED%95%B4%EC%9A%B4%EB%8C%80%EA%B5%AC";

  final Client _client;

  PlaceRepository(this._client);

  Future<List<Place>> fetchData() async {
    Uri uri = Uri.parse(url);

    Response response = await _client.get(uri);

    List<dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));

    List<Place> data = json.map((e) => Place.fromJson(e)).toList();

    return data;
  }
}
