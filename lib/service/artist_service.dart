import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api/core/api_key.dart';
import 'package:spotify_api/models/artist_model.dart';

Future<ArtistModel> getArtistService(String id) async {
  ArtistModel? artistData = ArtistModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  var url = Uri.parse('https://api.spotify.com/v1/artists/$id');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  artistData = ArtistModel.fromJson(jsonDecode(res.body));
  return artistData;
}