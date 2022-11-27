import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_api/core/api_key.dart';
import 'package:spotify_api/models/artist_track_model.dart';

Future<ArtistAndTrackModel?> GetArtistAndTrackService(String search) async {
  
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  var params = {
    'q': '$search',
    'type': 'track,artist',
    'market': 'TR',
    'limit': '10',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  try {ArtistAndTrackModel? artistAndTrackData = ArtistAndTrackModel();
    var url = 'https://api.spotify.com/v1/search?$query';
  var res = await Dio().get(url, options: Options(headers: headers));
  artistAndTrackData = ArtistAndTrackModel.fromJson(res.data);
  return artistAndTrackData;
  }catch(e){
    print(e.toString());
  }

  
}