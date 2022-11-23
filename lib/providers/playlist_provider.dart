import 'package:flutter/cupertino.dart';
import 'package:spotify_api/models/playlist_model.dart';
import 'package:spotify_api/service/playlist_service.dart';

class PlaylistProvider extends ChangeNotifier{
  PlaylistModel? playlistData;
  bool isPlaylistDataLoaded =false;

  GetPlaylistData() async {
    playlistData=await getPlaylistService();
    print(playlistData!.items![0].name);
    isPlaylistDataLoaded=true;
    notifyListeners();
  }
}