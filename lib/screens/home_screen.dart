import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/providers/releases_provider.dart';
import 'package:spotify_api/providers/top_track_provider.dart';
import 'package:spotify_api/screens/artist_screen.dart';
import 'package:spotify_api/screens/profile_screen.dart';
import 'package:spotify_api/service/releases_service.dart';
import 'package:spotify_api/service/top_track_service.dart';
import 'package:spotify_api/widgets/homescreen_banner.dart';
import 'package:spotify_api/widgets/homescreen_category.dart';
import 'package:spotify_api/widgets/homescreen_playlist.dart';
import 'package:spotify_api/widgets/homescreen_song.dart';
import 'package:spotify_api/widgets/homescreen_topbar.dart';
import 'package:spotify_api/widgets/shimmer_playlist.dart';
import 'package:spotify_api/widgets/shimmer_song.dart';

import '../providers/profile_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  String id = "3VooEK5HkkcSc4Tv7FCBzb";
  ReleasesProvider? releasesData;
  TopTracksProvider? topTracksData;
  

  @override
  void initState() {
    
    super.initState();Future.delayed(Duration(seconds: 5));
    releasesData = Provider.of<ReleasesProvider>(context, listen: false);
    releasesData!.GetReleasesData();

    topTracksData = Provider.of<TopTracksProvider>(context, listen: false);
    topTracksData!.GetTopTracksData(id);
  }

  List<String> categoryName = ["News", "Video", "Artist", "Podcast"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                              return  GestureDetector(
                                onTap: () {
                                  id = value.releasesData!.albums!.items![index]
                                      .artists![0].id
                                      .toString();
                                      print("ID: "+id);
                                  topTracksData!.GetTopTracksData(id);
                                 // print(id);
                                },
                                child: HSong(
                                  imagePath:
                                      '${value.releasesData!.albums!.items![index].images![0].url}',
                                  songName:
                                      '${value.releasesData!.albums!.items![index].name}',
                                  artist:
                                      '${value.releasesData!.albums!.items![index].artists![0].name}',
                                  id: value.releasesData!.albums!.items![index]
                                      .artists![0].id
                                      .toString(),
                                ),
                              );
                            },
                          )
                        : SSong(),
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
              Consumer(
                builder: (context, TopTracksProvider value, child) {
                  return Container(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: value.isTopTracksDataLoaded == true
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: value.topTracksData!.tracks!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    id = value.topTracksData!.tracks![index].artists![0].id.toString();
                                    
                                  },
                                  child: HPlaylist(
                                    songName:
                                        '${value.topTracksData!.tracks![index].name}',
                                    artist:
                                        '${value.topTracksData!.tracks![index].artists![0].name}', id: value.topTracksData!.tracks![index].artists![0].id.toString(),
                                  ),
                                );
                              },
                            )
                          : SPlaylist(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
      
    
  }
}
