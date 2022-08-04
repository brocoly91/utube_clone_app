
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utube_clone_app/src/models/youtube_video_result.dart';
import 'package:utube_clone_app/src/repository/youtube_repository.dart';

class HomeController extends GetxController{
  static HomeController get to => Get.find();

  ScrollController scrollController = ScrollController();
  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _videoLoad();
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPagetoken != "") {
        _videoLoad();
      }
    });
  }


  void _videoLoad() async {
    print("1111");
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .loadVideos(youtubeResult.value.nextPagetoken ?? "");
    // print("dsakfjskdjf ==== " + YoutubeVideoResult);
    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.isNotEmpty) {
      print("222");
      youtubeResult.update((youtube) {
        print("33");
        youtube!.nextPagetoken = youtubeVideoResult.nextPagetoken;
        youtube.items!.addAll(youtubeVideoResult.items!);
        // youtube.items?.addAll(youtubeVideoResult.items)
      });
    }
  }
}