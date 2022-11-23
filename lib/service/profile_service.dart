import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/profile_model.dart';

Future<ProfileModel> getProfileService() async {
  ProfileModel? data = ProfileModel();
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer BQBDjix_mCvMWGKbYP5ADlRauriD_AN-7JKOdXzjm6-gYy07fdr8AcpRNb7DqlGcSl0xekZXva5LKeQrY1rZvy6oHt85vOjsdGLmhV_DeCB82H5eyiXm5ogYjIl7EsOid06cWbmPAot34w4o9C48pSEwOPcKlWIHgNIMNrPCQL8kwodGP8aE6dJEnASo3KkjtYTjdtu0kR8GGiClsICB00dUTq_QIbIziAT5m4cAcPacVYLV5PFgjSv6IknEc5FBVM1m4UPVNz4MmeBR6mVOGP86DTDXoFXji4QLEXwjHS3h',
  };

  var url = Uri.parse('https://api.spotify.com/v1/me');
  var res = await http.get(url, headers: headers);
  if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
  data = ProfileModel.fromJson(jsonDecode(res.body));
  return data;
 
}