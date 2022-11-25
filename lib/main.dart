import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api/providers/artist_album_provider.dart';
import 'package:spotify_api/providers/artist_provider.dart';
import 'package:spotify_api/providers/main_provider.dart';
import 'package:spotify_api/providers/playlist_provider.dart';
import 'package:spotify_api/providers/profile_provider.dart';
import 'package:spotify_api/providers/releases_provider.dart';
import 'package:spotify_api/providers/top_track_provider.dart';
import 'package:spotify_api/screens/artist_screen.dart';
import 'package:spotify_api/screens/home_screen.dart';
import 'package:spotify_api/screens/profile_screen.dart';

void main() {
  runApp(MultiProvider(child: MyApp(),providers:[
    ChangeNotifierProvider(create:(context) => ProfileProvider(),),
    ChangeNotifierProvider(create: (context) => PlaylistProvider(),),
    ChangeNotifierProvider(create: (context) => ReleasesProvider(),),
    ChangeNotifierProvider(create: (context) => TopTracksProvider(),),
    ChangeNotifierProvider(create: (context) => ArtistProvider(),),
    ChangeNotifierProvider(create: (context) => ArtistAlbumProvider(),),
    ChangeNotifierProvider(create: (context) => MainProvider(),),
  ]));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Responsive Sizer Example',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        );
      },
      maxTabletWidth: 900, // Optional
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, });

  

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  final List<Widget> _choice = [
    HomeScreen(),
    ArtistScreen(id: "3VooEK5HkkcSc4Tv7FCBzb",),
    ProfileScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
   
    return Consumer(
      builder: (context, MainProvider value, child) {
        return Scaffold(
       bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_max, size: 36,),
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 36,),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 36,),
              label: '',
            ),
          ],
          currentIndex: value.selectedIndex,
          selectedItemColor: Colors.green[400],
       onTap: (de) {
         
         value.onItemTapped(de);
       },
        ),
        body:  _choice[value.selectedIndex]
    ,
      );
      },
    );
  }
}
