import 'package:get/get.dart';
import 'package:utube_clone_app/src/controller/app_controller.dart';
import 'package:utube_clone_app/src/repository/youtube_repository.dart';

class InitBinding implements Bindings{

  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(YoutubeRepository() , permanent: true);
  }

}