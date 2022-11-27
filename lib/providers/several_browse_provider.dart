

import 'package:flutter/material.dart';
import 'package:spotify_api/models/several_browse_model.dart';
import 'package:spotify_api/service/several_browse_service.dart';

class SeveralBrowseProvider extends ChangeNotifier{

  SeveralBrowseModel? browseData;
  bool isSeveralBrowseLoaded=false;

  GetSeveralBrowseData() async {
    browseData=await getSeveralBrowseService();
    isSeveralBrowseLoaded=true;
    notifyListeners();
  }


}