import 'package:flutter/material.dart';

import '../models/artist_album_model.dart';
import '../service/artist_album_service.dart';

class ArtistAlbumProvider extends ChangeNotifier{
  ArtistAlbumModel? artistAlbumData;
  bool isArtistAlbumDataLoaded =false;

  GetArtistAlbumData(String id) async {
    artistAlbumData=await getArtistAlbumService(id);
    isArtistAlbumDataLoaded=true;
    notifyListeners();
  }
}