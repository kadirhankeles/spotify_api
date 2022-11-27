import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/providers/artist_track_provider.dart';
import 'package:spotify_api/screens/artist_screen.dart';

class SearchList extends StatefulWidget {

  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  ArtistTrackProvider? artistTrackData;

 
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context,ArtistTrackProvider value, child) {
        return SingleChildScrollView(
          child: Column(
          children: [
            Container(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: value.isArtistTrackDataLoaded==true? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.artistTrackData!.artists!.items!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArtistScreen(id: value.artistTrackData!.artists!.items![index].id.toString()),));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 1.h),
                        height: 6.h,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              height: 6.h,
                              width: 6.h,
                              child: AppConstant().profilePhotos( value.artistTrackData!.artists!.items![index].images!.isEmpty? "https://cdn-icons-png.flaticon.com/512/21/21104.png": "${value.artistTrackData!.artists!.items![index].images![0].url}", 50),
                              
                            ),
                            SizedBox(width: 2.h,),
                            Text("${value.artistTrackData!.artists!.items![index].name}"),
                          ],
                        ),
                      ),
                    );
                  },
                ):Container(),
              ),
            ),
            Divider(height: 1.h,),
            Container(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: value.isArtistTrackDataLoaded==true? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.artistTrackData!.tracks!.items2!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 1.h),
                      height: 6.h,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 6.h,
                            width: 6.h,
                            child: AppConstant().profilePhotos(value.artistTrackData!.tracks!.items2![index].album!.images!.isEmpty? "https://cdn-icons-png.flaticon.com/512/21/21104.png": "${value.artistTrackData!.tracks!.items2![index].album!.images![0].url}", 50),
        
                          ),
                          SizedBox(width: 2.h,),
                          Container(
                            width: 33.h,
                            child: Text("${value.artistTrackData!.tracks!.items2![index].album!.name}", maxLines: 1, overflow: TextOverflow.ellipsis,)),
                        ],
                      ),
                    );
                  },
                ):Container(),
              ),
            )
          ],
              ),
        );
      },

    );
  }
}
