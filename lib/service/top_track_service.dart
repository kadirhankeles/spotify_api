import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api/models/top_track_model.dart';

import '../core/api_key.dart';

Future<TopTracksModel> getTopTracksService(String id) async {

    TopTracksModel? data = TopTracksModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };
  //print(id);
  var params = {
    'market': 'TR',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/artists/$id/top-tracks?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  data = TopTracksModel.fromJson(jsonDecode(res.body));
  return data;
  print(res.body);
}