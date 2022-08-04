
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:utube_clone_app/src/app.dart';
import 'package:utube_clone_app/src/binding/init_binding.dart';
import 'package:utube_clone_app/src/components/YouTubeDetail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// import 'video_list.dart';a

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'YouTube Clone App',
      theme:  ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: "/", page: ()=>App()),
        GetPage(name: "/detail/:videoId", page: () => YouTubeDetail()),
      ],
    );
  }
}

