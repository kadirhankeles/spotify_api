import 'package:flutter/cupertino.dart';

import '../models/artist_model.dart';
import '../service/artist_service.dart';


class ArtistProvider extends ChangeNotifier{
  ArtistModel? artistData;
  bool isArtistDataLoaded =false;

  GetArtistData(String id) async {
    artistData=await getArtistService(id);
    isArtistDataLoaded=true;
    notifyListeners();
  }
}