import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api/models/playlist_model.dart';

Future<PlaylistModel> getPlaylistService() async {
  PlaylistModel playlistData =PlaylistModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQCCqPw-2z_a7tG0NQh2i9yYO9Wm1LqddejmzoieeI9eHVfnMOWa5g9oLBQHqz8dIghSz16uFn7VQqaZsYPXXK0e0m2mxPvBwMtlBKCG2Lg1UzMD9Bt81_EigOEwEbCQGibfGFztJkB8T4OHohYxJKmlr5R1jZXtxfEkdx4Pk3PCS1wDiabFrLHL2vBb6FGoNXTvx5Mvc-LpGAvUmh67wzm4CWlB6c5PDbxjuDh3_X4JTWQ4glUTfxzYdAviCeY0s9hKNKH-4-KL6lx9-wbzBpm3xeREAXt9ROk0tIGyga64',
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