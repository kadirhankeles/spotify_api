import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/profile_model.dart';

Future<ProfileModel> getProfileService() async {
  String apiKey = "BQAurk6Jvp8AjPBUSx8YGb-JBDZiTojUyfMOEQCHehBHjuOJEqZER4G67HGBDUZ89dFaFXo75jA_zoU4ag3fODqCsg65s9Utsxo0Pm7ady78HQfGuNTrLt0XwNH0jqzxPhPguThrfwy_T_sFyINL5p9Ir7Tmnm1V3juuwmR2TF0_G_URwh60byYQCgU_ZGBhYACgFFVw6qqgDkLc07paHgSxshA8pJUYYDqp4U0l6iHSkwasXrVkToW3MHbcdwDvmbfPi8X-QEIXcQWaQd1CRk0IHUoMOrlUxuY_qWDaGrcVa29uEM51piWG2igWS8GTLXxV";
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