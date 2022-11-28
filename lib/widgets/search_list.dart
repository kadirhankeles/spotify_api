import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/providers/artist_track_provider.dart';
import 'package:spotify_api/providers/search_track_provider.dart';
import 'package:spotify_api/screens/artist_screen.dart';

class SearchList extends StatefulWidget {

  const SearchList({super.key});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  ArtistTrackProvider? artistTrackData;
  SearchTrackProvider? searchTrackData;

 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
          children: [
            Consumer(
              builder: (context, ArtistTrackProvider value, child) {
                return Container(
                height: 12.5.h,
                width: double.infinity,
                child: MediaQuery.removePadding(
                  context: context,
                  removeLeft: true,
                  child: value.isArtistTrackDataLoaded==true? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.artistTrackData!.artists!.items!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ArtistScreen(id: value.artistTrackData!.artists!.items![index].id.toString()),));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 1.h),
                          height: 12.h,
                          width: 10.h,
                          child: Column(
                            children: [
                              Container(
                                height: 9.h,
                                width: 9.h,
                                child: AppConstant().profilePhotos( value.artistTrackData!.artists!.items![index].images!.isEmpty? "https://cdn-icons-png.flaticon.com/512/21/21104.png": "${value.artistTrackData!.artists!.items![index].images![0].url}", 50),
                                
                              ),
                              SizedBox(height: 1.h,),
                              Center(child: Text("${value.artistTrackData!.artists!.items![index].name}",maxLines: 1, overflow: TextOverflow.ellipsis,),),
                            ],
                          ),
                        ),
                      );
                    },
                  ):Container(),
                ),
              );
              },
            ),
            Divider(height: 1.h,),
            Consumer(builder: (context, SearchTrackProvider value, child) {
              return Container(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: value.isSearchLoaded==true? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.searchTrackData!.tracks!.items!.length,
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
                            child: AppConstant().profilePhotos(value.searchTrackData!.tracks!.items![index].album!.images!.isEmpty? "https://cdn-icons-png.flaticon.com/512/21/21104.png": "${value.searchTrackData!.tracks!.items![index].album!.images![0].url}", 50),
        
                          ),
                          SizedBox(width: 2.h,),
                          Container(
                            width: 33.h,
                            child:Column(children: [
                             // Text("${value.searchTrackData!.tracks!.items![index].album!.name}", maxLines: 1, overflow: TextOverflow.ellipsis,),
                              //Text("${value.searchTrackData!.tracks!.items![index].album!.artists![0].name}")
                            ],) ),
                        ],
                      ),
                    );
                  },
                ):Container(),
              ),
            );
            },)
          ],
              ),
        );
      
  }
}
