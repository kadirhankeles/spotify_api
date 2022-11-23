import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/providers/profile_provider.dart';
import 'package:spotify_api/widgets/playlist.dart';
import 'package:spotify_api/widgets/top_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileProvider? data;

  @override
  void initState() {
    super.initState();
    data = Provider.of<ProfileProvider>(context,listen: false);
    data!.GetProfileData();
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
                if (data!.isProfileDataLoaded==true) {
                   
                  return TopProfile(
                    imagePath:
                      data!.profileData!.images![0].url!
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
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Playlist(
                      imagePath:
                          'https://images.unsplash.com/photo-1628563694622-5a76957fd09c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8aW5zdGFncmFtJTIwcHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                      songName: 'Şemmame',
                      artistName: 'Billie Eilish',
                    );
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
