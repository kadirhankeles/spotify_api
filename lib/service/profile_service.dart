import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/api_key.dart';
import '../models/profile_model.dart';

Future<ProfileModel> getProfileService() async {
  
  ProfileModel? data = ProfileModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

  var url = Uri.parse('https://api.spotify.com/v1/me');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  data = ProfileModel.fromJson(jsonDecode(res.body));
  return data;
 
}