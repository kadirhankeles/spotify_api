import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_api/core/api_key.dart';
import 'package:spotify_api/models/several_browse_model.dart';

Future<SeveralBrowseModel?> getSeveralBrowseService() async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  var params = {
    'country': 'TR',
    'locale': 'tr_TR',
    'limit': '20',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  try{  SeveralBrowseModel? data = SeveralBrowseModel();
    var url = 'https://api.spotify.com/v1/browse/categories?$query';
    var res = await Dio().get(url, options: Options(headers: headers));
    data = SeveralBrowseModel.fromJson(res.data);
    return data;
  }catch(e){
    print(e.toString());
  }

}