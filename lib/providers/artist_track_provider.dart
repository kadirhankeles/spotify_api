import 'package:flutter/material.dart';
import 'package:spotify_api/models/artist_track_model.dart';
import 'package:spotify_api/service/artist_track_service.dart';

class ArtistTrackProvider extends ChangeNotifier{
  ArtistAndTrackModel? artistTrackData;
  bool isArtistTrackDataLoaded =false;
  bool isActive =false;
  GetArtistTrackData(String search) async {
    artistTrackData=await GetArtistAndTrackService(search);
    isArtistTrackDataLoaded=true;
    notifyListeners();
  }
  
  textActive(bool choice){
    isActive =choice;
    notifyListeners();
  }
}