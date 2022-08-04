import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:utube_clone_app/src/controller/app_controller.dart';
import 'package:utube_clone_app/src/pages/explore.dart';
import 'package:utube_clone_app/src/pages/home.dart';
import 'package:utube_clone_app/src/pages/library.dart';
import 'package:utube_clone_app/src/pages/subscribe.dart';

// StatelessWidget
class App extends GetView<AppController>{
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {

        switch(RouteName.values[controller.currentIndex.value]){
          case RouteName.Home:
            return Home();
            break;
          case RouteName.Explore:
            return Explore();
            break;
          case RouteName.Subs:
            return Subscribe();
            break;
          case RouteName.Library:
            return Library();
            break;
          case RouteName.Add:
            print("???" + RouteName.values[controller.currentIndex.value].toString());
            // return Get.bottomSheet(Container(););
            break;
        }
        return Container();
      }),
      bottomNavigationBar:
        Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            selectedItemColor: Colors.black,
            onTap: controller.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/home_off.svg",width: 22,),
                activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg",width: 22,),
                label: "홈",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/compass_off.svg",width: 22,),
                activeIcon: SvgPicture.asset("assets/svg/icons/compass_on.svg",width: 22,),
                label: "탐색",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SvgPicture.asset("assets/svg/icons/plus.svg",width: 35,),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/subs_off.svg",width: 22,),
                activeIcon: SvgPicture.asset("assets/svg/icons/subs_on.svg",width: 22,),
                label: "구독",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/icons/library_off.svg",width: 22,),
                activeIcon: SvgPicture.asset("assets/svg/icons/library_on.svg",width: 22,),
                label: "보관함",
              ),
            ],
          ),
        ),
    );
  }
}
