import 'package:flutter/cupertino.dart';
import 'package:spotify_api/models/profile_model.dart';
import 'package:spotify_api/models/releases_model.dart';
import 'package:spotify_api/service/profile_service.dart';
import 'package:spotify_api/service/releases_service.dart';

class ReleasesProvider extends ChangeNotifier{

  ReleasesModel? releasesData ;
  bool isReleasesDataLoaded=false;

  GetReleasesData() async {
     isReleasesDataLoaded=false;
         releasesData=await getReleasesService();
    isReleasesDataLoaded=true;
    notifyListeners();
  }


}