import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:spotify_api/core/api_key.dart';
import 'package:spotify_api/models/search_track_model.dart';
import 'package:http/http.dart' as http;


Future<SearchTrackModel?> GetSearchTrackService(String search) async {
  SearchTrackModel? searchTrackData = SearchTrackModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  var params = {
    'q': '$search',
    'type': 'track',
    'market': 'TR',
    'limit': '10',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/search?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  searchTrackData = SearchTrackModel.fromJson(jsonDecode(res.body));
  return searchTrackData;

  
}