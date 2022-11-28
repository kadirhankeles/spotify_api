

import 'package:flutter/material.dart';
import 'package:spotify_api/service/search_track_service.dart';

import '../models/search_track_model.dart';

class SearchTrackProvider extends ChangeNotifier{
  
  SearchTrackModel? searchTrackData;
  bool isActive =false;
  bool isSearchLoaded =false;
  

  GetSearchTrackData(String search) async{
    searchTrackData = await GetSearchTrackService(search);
    isSearchLoaded=true;
    notifyListeners();
  }
  
  textActive(bool choice){
    isActive =choice;
    notifyListeners();
  }
}