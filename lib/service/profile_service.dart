import 'dart:convert';

import 'package:dio/dio.dart';
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

  var url = 'https://api.spotify.com/v1/me';
  var res = await Dio().get(url, options: Options(headers: headers));
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  data = ProfileModel.fromJson(res.data);
  return data;
 
}