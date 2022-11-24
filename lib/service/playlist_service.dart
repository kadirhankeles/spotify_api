import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api/models/playlist_model.dart';

Future<PlaylistModel> getPlaylistService() async {
  String apiKey="BQCb6-mKLE7zOliwpjvNRURgvUghK9yw2FiJ3YB2RDY73UqzYW3A2SPUxZjmeZ3ZDA_i89Lekd6bn3SDzU3zy28U_ORf_UySjiW3yTOXVcGxDevv1aQz7Uxaftn183FhMELz-8E4WK-EEvSy-v6ogx2aitYpjiSg2TmpxRX1x1QWmSS6ilGMP2GVpLPTdyikZubCP3IlOjmODo7Abel9j46tSIMA-FxqSBtxacvDhzempVFYlKPmwp7VxgTyUUURGG6R41FLA6GQhjoQ5HDMwYuxXimAUiTeeVD__yR0Jg1R";
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