import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spotify_api/models/releases_model.dart';

Future<ReleasesModel> getReleasesService() async {
  ReleasesModel? data = ReleasesModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQAoFg-x3no4VAkXvjfqizUoYLCtfq6tQqH0Rdow2fU82rZJHA88rXejP3b8JAIDbCezKlMemuXXyg2Vm4m8_AXrGbLFW3nXDB6Gcs13z6kUC06qIe5HpA7RIcToBRSIto3jaHgy89uJVRST7riRL5EqwYSI4bCzB4yvLcMFUna7lb_K7koUto5-yosx3-wvuQMkIwkgUXXjzA0a2421Ldvc6fMwYA74VdZA9P8qja2CiqVX64A1ZeDc_QwvqmJGiMUTJkjYMlv2IyQLlxEhBx5vtxv4VJjzXPCJGZ37nkcE',
  };

  var params = {
    'country': 'TR',
    'limit': '5',
    'offset': '5',
  };
  var query = params.entries.map((p) => '${p.key}=${p.value}').join('&');

  var url = Uri.parse('https://api.spotify.com/v1/browse/new-releases?$query');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  data = ReleasesModel.fromJson(jsonDecode(res.body));
  return data;
}