import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_api/models/top_track_model.dart';

import '../core/api_key.dart';

Future<TopTracksModel?> getTopTracksService(String id) async {

    
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
    
  TopTracksModel? data = TopTracksModel();
    var url = 'https://api.spotify.com/v1/artists/$id/top-tracks?$query';
    var res = await Dio().get(url, options: Options(headers: headers));

    data = TopTracksModel.fromJson(res.data);
    return data;
  

  
  
}