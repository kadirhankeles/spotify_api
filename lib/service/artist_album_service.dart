import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api/core/api_key.dart';
import 'package:spotify_api/models/artist_album_model.dart';

Future<ArtistAlbumModel> getArtistAlbumService(String id) async {
  
  ArtistAlbumModel? artistAlbumData = ArtistAlbumModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  var params = {
    'include_groups': 'single,appears_on',
    'market': 'TR',
    'limit': '10',
    'offset': '5',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/artists/$id/albums?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  artistAlbumData = ArtistAlbumModel.fromJson(jsonDecode(res.body));
  return artistAlbumData;

}