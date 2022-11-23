import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/providers/playlist_provider.dart';
import 'package:spotify_api/providers/profile_provider.dart';
import 'package:spotify_api/widgets/playlist.dart';
import 'package:spotify_api/widgets/top_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileProvider? profileData;
  PlaylistProvider? playlistData;

  @override
  void initState() {
    super.initState();
    profileData = Provider.of<ProfileProvider>(context,listen: false);
    profileData!.GetProfileData();

    playlistData= Provider.of<PlaylistProvider>(context, listen: false);
    playlistData!.GetPlaylistData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (BuildContext context, ProfileProvider value, widget) {
                if (profileData!.isProfileDataLoaded==true) {
                   
                  return TopProfile(
                    imagePath:
                      profileData!.profileData!.images![0].url!
                        ,
                    email: '${value.profileData!.email}',
                    profileName: "${value.profileData!.displayName}",
                    takipEdilenSayisi: value.profileData!.followers!.total!.toInt(),
                    takipciSayisi: 300);
                } else {
                  return Container();
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 7.w, top: 3.h),
              child: Text(
                "PUBLIC PLAYLIST",
                style: AppConstant().araBaslikStyle,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              //height: 100.h,
              width: double.infinity,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Consumer(
                  builder: (context, PlaylistProvider value, child) {
                    return value.isPlaylistDataLoaded==true? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.playlistData!.items!.length,
                    itemBuilder: (context, index) {
                      return Playlist(
                        imagePath:
                            '${value.playlistData!.items![index].images![0].url}',
                        songName: '${value.playlistData!.items![index].name}',
                        artistName: '${value.playlistData!.items![index].owner!.displayName}',
                      );
                    },
                  ):Container();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
