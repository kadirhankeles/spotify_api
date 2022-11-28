import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_api/core/api_key.dart';
import 'package:spotify_api/models/playlist_model.dart';

Future<PlaylistModel?> getPlaylistService() async {

  
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  var params = {
    'limit': '20',
    'offset': '0',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

    PlaylistModel playlistData =PlaylistModel();
    var url = 'https://api.spotify.com/v1/users/8kdfzahazbluvjd5tc99367gz/playlists?$query';
    var res = await Dio().get(url, options: Options(headers: headers));
    playlistData = PlaylistModel.fromJson(res.data);
    return playlistData;
  

}