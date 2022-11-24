import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api/models/releases_model.dart';

import '../core/api_key.dart';

Future<ReleasesModel> getReleasesService() async {

  ReleasesModel? data = ReleasesModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  var params = {
    'country': 'TR',
    'limit': '5',
    'offset': '5',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/browse/new-releases?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  data = ReleasesModel.fromJson(jsonDecode(res.body));
  return data;
}