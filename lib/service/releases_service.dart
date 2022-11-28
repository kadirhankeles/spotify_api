import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_api/models/releases_model.dart';

import '../core/api_key.dart';

Future<ReleasesModel?> getReleasesService() async {

  
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

  
    ReleasesModel? data;
    var url = 'https://api.spotify.com/v1/browse/new-releases?$query';
    var res = await Dio().get(url, options: Options(headers: headers));
    data = ReleasesModel.fromJson(res.data);
    return data;
 
}

