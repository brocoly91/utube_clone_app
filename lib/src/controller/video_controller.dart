import 'package:get/get.dart';
import 'package:utube_clone_app/src/models/statistics.dart';
import 'package:utube_clone_app/src/models/video.dart';
import 'package:utube_clone_app/src/models/youtuber.dart';
import 'package:utube_clone_app/src/repository/youtube_repository.dart';

class VideoController extends GetxController{
  Video ?video;
  VideoController({this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;
  @override
  void onInit() async {
    Statistics? loadStatistics =
    await YoutubeRepository.to.getVideoInfoById(video!.id!.videoId.toString());
    statistics(loadStatistics);
    Youtuber? loadYoutuber =
    await YoutubeRepository.to.getYoutuberInfoById(video!.snippet!.channelId.toString());
    youtuber(loadYoutuber);
    super.onInit();
  }

  String get viewCountString => "조회수 ${statistics.value.viewCount ?? '-'}회";
  String? get youtuberThumbnailUrl {
    if (youtuber.value.snippet == null)
      return "https://cdn4.iconfinder.com/data/icons/small-n-flat/24/user-alt-512.png";
    return youtuber.value.snippet!.thumbnails!.medium!.url;
  }
}