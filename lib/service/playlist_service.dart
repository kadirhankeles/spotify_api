import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api/core/api_key.dart';
import 'package:spotify_api/models/playlist_model.dart';

Future<PlaylistModel> getPlaylistService() async {

  PlaylistModel playlistData =PlaylistModel();
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

  var url = Uri.parse('https://api.spotify.com/v1/users/8kdfzahazbluvjd5tc99367gz/playlists?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  playlistData = PlaylistModel.fromJson(jsonDecode(res.body));
  return playlistData;
}