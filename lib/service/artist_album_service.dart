import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:spotify_api/core/api_key.dart';
import 'package:spotify_api/models/artist_album_model.dart';

Future<ArtistAlbumModel?> getArtistAlbumService(String id) async {
  
  
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

  ArtistAlbumModel? artistAlbumData;
    var url = 'https://api.spotify.com/v1/artists/$id/albums?$query';
    var res = await Dio().get(url, options: Options(headers: headers));
    artistAlbumData = ArtistAlbumModel.fromJson(res.data);
    return artistAlbumData;
  

}