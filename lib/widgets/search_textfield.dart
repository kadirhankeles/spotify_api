import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/providers/artist_album_provider.dart';
import 'package:spotify_api/screens/search_screen.dart';
import 'package:spotify_api/widgets/search_list.dart';

import '../providers/artist_track_provider.dart';

class STextField extends StatefulWidget {
  final TextEditingController searchCon;
  const STextField({super.key, required this.searchCon});

  @override
  State<STextField> createState() => _STextFieldState();
}

class _STextFieldState extends State<STextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: double.infinity,
      child: TextField(
        controller: widget.searchCon,
        style: TextStyle(fontSize: 18, height: 0.15.h),
        decoration: InputDecoration(
          focusColor: Color(0xff42C83C),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xff42C83C)),
          ),
          isDense: false,
          contentPadding: EdgeInsets.only(bottom: 0, top: 0, left: 0, right: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: 'Artist, songs, or Podcasts',
          labelStyle: AppConstant().araBaslikStyle,
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff42C83C),
          ),
        ),

        onChanged: (value) {
          if(value.length > 2){
            Provider.of<ArtistTrackProvider>(context, listen: false).textActive(true);
            print("Yollanan Değer: "+value);
            Provider.of<ArtistTrackProvider>(context, listen: false).GetArtistTrackData(value);
          }else{
            Provider.of<ArtistTrackProvider>(context, listen: false).textActive(false);
          }
        },
      ),
    );
  }
}
