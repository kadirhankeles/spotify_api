import 'package:flutter/cupertino.dart';
import 'package:spotify_api/models/profile_model.dart';
import 'package:spotify_api/service/profile_service.dart';

class ProfileProvider extends ChangeNotifier{

  ProfileModel? profileData ;
  bool isProfileDataLoaded=false;

  GetProfileData() async {
    profileData=await getProfileService();
    print(profileData!.displayName);
    isProfileDataLoaded=true;
    notifyListeners();
  }


}