import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utube_clone_app/src/components/custom_appbar.dart';
import 'package:utube_clone_app/src/components/vedio_widget.dart';
import 'package:utube_clone_app/src/controller/home_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: CustomAppBar(),
              floating: true,
              snap: true,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed("/detail/239587");
                    },
                    child: VideoWidget(video : controller.youtubeResult.value.items?[index],),
                  ),
                );
              },
              childCount: controller.youtubeResult.value.items == null ? 0
                  : controller.youtubeResult.value.items?.length,
            )),
          ],
        ),
      ),
    );
  }
}
