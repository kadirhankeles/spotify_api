import 'package:dio/dio.dart';
import 'package:spotify_api/core/api_key.dart';
import 'package:spotify_api/models/search_track_model.dart';

Future<SearchTrackModel?> GetSearchTrackService(String search) async {
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': '$apiKey',
  };

  var params = {
    'q': '$search',
    'type': 'track',
    'market': 'TR',
    'limit': '10',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  SearchTrackModel? searchTrackData = SearchTrackModel();
    var url = 'https://api.spotify.com/v1/search?$query';
    
  var res = await Dio().get(url, options: Options(headers: headers));
  searchTrackData = SearchTrackModel.fromJson(res.data);
  
  return searchTrackData;
  
}