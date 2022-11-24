import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/providers/artist_album_provider.dart';
import 'package:spotify_api/providers/artist_provider.dart';
import 'package:spotify_api/providers/top_track_provider.dart';
import 'package:spotify_api/widgets/artist_albums.dart';
import 'package:spotify_api/widgets/artist_info.dart';
import 'package:spotify_api/widgets/homescreen_playlist.dart';

class ArtistScreen extends StatefulWidget {
  final String id;
  const ArtistScreen({super.key, required this.id});

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {

  ArtistProvider? artistData;
  ArtistAlbumProvider? artistAlbumData;
  TopTracksProvider? topTracksData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    artistData = Provider.of<ArtistProvider>(context,listen: false);
    artistData!.GetArtistData(widget.id);

    artistAlbumData = Provider.of<ArtistAlbumProvider>(context, listen: false);
    artistAlbumData!.GetArtistAlbumData(widget.id);

    topTracksData = Provider.of<TopTracksProvider>(context, listen: false);
    topTracksData!.GetTopTracksData(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ArtistProvider value, child) {
                return value.isArtistDataLoaded==true ? AInfo(imagePath: '${value.artistData!.images![0].url}', name: '${value.artistData!.name}', followers: value.artistData!.followers!.total!.toInt(),): Container();
              },
              ),
            Padding(
                padding: EdgeInsets.only(left: 3.h, right: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Albums",
                      style: AppConstant().araBaslikStyle,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Consumer(
                      builder: (context, ArtistAlbumProvider value, child) {
                        return Container(
                        height: 19.h,
                        width: double.infinity,
                        child: MediaQuery.removePadding(
                          context: context,
                          removeLeft: true,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: value.artistAlbumData!.items!.length,
                            itemBuilder: (context, index) {
                              return AAlbums(imagePath: '${value.artistAlbumData!.items![index].images![0].url}', name: '${value.artistAlbumData!.items![index].name}',);
                            },
                          ),
                        ),
                      );
                      },
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Text(
                      "Songs",
                      style: AppConstant().araBaslikStyle,
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
                          child: value.isTopTracksDataLoaded==true? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: value.topTracksData!.tracks!.length,
                            itemBuilder: (context, index) {
                              return HPlaylist(
                                songName: '${value.topTracksData!.tracks![index].name}',
                                artist: '${value.topTracksData!.tracks![index].artists![0].name}',
                              );
                            },
                          ): Container(),
                        ),
                      );
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
