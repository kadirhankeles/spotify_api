import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/providers/releases_provider.dart';
import 'package:spotify_api/widgets/homescreen_banner.dart';
import 'package:spotify_api/widgets/homescreen_category.dart';
import 'package:spotify_api/widgets/homescreen_playlist.dart';
import 'package:spotify_api/widgets/homescreen_song.dart';
import 'package:spotify_api/widgets/homescreen_topbar.dart';

import '../providers/profile_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ReleasesProvider? releasesData;

  @override
  void initState() {
    super.initState();
    releasesData = Provider.of<ReleasesProvider>(context, listen: false);
    releasesData!.GetReleasesData();
  }

  List<String> categoryName = ["News", "Video", "Artist", "Podcast"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 3.h, right: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                TopBar(),
                HomeBanner(),
                Positioned(
                  child: Image.asset("assets/billie.png"),
                  top: 2.2.h,
                )
              ]),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 6.h,
                width: double.infinity,
                child: MediaQuery.removePadding(
                  context: context,
                  removeLeft: true,
                  removeRight: true,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryName.length,
                    itemBuilder: (context, index) {
                      return HCategory(
                        categoryName: categoryName[index],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Consumer(
                builder: (context, ReleasesProvider value, child) {
                  return Container(
                    height: 28.h,
                    width: double.infinity,
                    child: value.isReleasesDataLoaded == true
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                value.releasesData!.albums!.items!.length,
                            itemBuilder: (context, index) {
                              return HSong(
                                imagePath:
                                    '${value.releasesData!.albums!.items![index].images![0].url}',
                                songName:
                                    '${value.releasesData!.albums!.items![index].name}',
                                artist:
                                    '${value.releasesData!.albums!.items![index].artists![0].name}',
                              );
                            },
                          )
                        : Container(),
                  );
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                "Playlist",
                style: AppConstant().baslikStyle,
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return HPlaylist();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
