import 'package:flutter/cupertino.dart';
import 'package:spotify_api/models/top_track_model.dart';
import 'package:spotify_api/service/top_track_service.dart';

class TopTracksProvider extends ChangeNotifier{
  TopTracksModel? topTracksData ;
  bool isTopTracksDataLoaded=false;

  GetTopTracksData(String id) async {
    topTracksData=await getTopTracksService("${id}");
    isTopTracksDataLoaded=true;
    notifyListeners();
  }


}