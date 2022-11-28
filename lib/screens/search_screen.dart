import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/core/constant.dart';
import 'package:spotify_api/models/artist_track_model.dart';
import 'package:spotify_api/providers/artist_track_provider.dart';
import 'package:spotify_api/providers/search_track_provider.dart';
import 'package:spotify_api/providers/several_browse_provider.dart';
import 'package:spotify_api/widgets/search_category.dart';
import 'package:spotify_api/widgets/search_list.dart';
import 'package:spotify_api/widgets/search_textfield.dart';
import 'package:spotify_api/widgets/shimmer_category.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SeveralBrowseProvider? severalBrowseData;
  
  @override
  void initState() {
    super.initState();
    severalBrowseData = Provider.of<SeveralBrowseProvider>(context, listen: false);
    severalBrowseData!.GetSeveralBrowseData();

    
  }
  String? search;
  final searchCon = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 3.h, right: 3.h, top: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: AppConstant().baslikStyle,
              ),
              SizedBox(
                height: 2.h,
              ),
              STextField(searchCon: searchCon),
              SizedBox(
                height: 2.h,
              ), 
              
               Consumer(
                builder: (context, SearchTrackProvider value, child) {
                  return value.isActive==false? Container(
                  child: Column(
                    children: [
                      Text(
                  "Browse all",
                  style: AppConstant().baslikStyle,
                             ),
                             SizedBox(
                  height: 3.h,
                             ),
                             Consumer(
                  builder: (context, SeveralBrowseProvider value, child) {
                    return Container(
                             
                    width: double.infinity,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: value.isSeveralBrowseLoaded==true ? GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: value.browseData!.categories!.items!.length,
                        shrinkWrap: true,
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1),
                        itemBuilder: (context, index) {
                          return SCategory(
                            imagePath:
                                '${value.browseData!.categories!.items![index].icons![0].url}',
                            categoryName: '${value.browseData!.categories!.items![index].name}',
                          );
                        },
                      ): ShimmerCategory(),
                    ),
                  );
                  },
                             ),
                    ],
                  ),
                             ): SearchList();
                },
               ),
              
            //  SearchList(search: search.toString(),),
            ],
          ),
        ),
      ),
    );
  }
}
