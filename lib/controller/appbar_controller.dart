import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:yaml_validator/app_tour_target.dart';
import 'package:yaml_validator/controller/parseyaml_controller.dart';

abstract class AppBarController extends GetxController {
  void onchanged(int currentPage);
}

class AppBarControllerImpl extends AppBarController {
  final BuildContext context;
  AppBarControllerImpl(this.context);
  final appBarkey = GlobalKey();
  late TutorialCoachMark tutorialCoachMark;
  late int activePage;
  
  @override
  void onchanged(int currentPage) {
    activePage = currentPage;
    update();
  }

  @override
  void onInit() async {
    activePage = 0;
    update();

    if (GetStorage().read("appbar") == null) {
      await showTutorialCoachMarkForAppBar();

      // await Future.delayed(const Duration(seconds: 2));
    }

    super.onInit();
  }

  Future<void> showTutorialCoachMarkForAppBar() async {
    tutorialCoachMark = TutorialCoachMark(
        onFinish: () {
          GetStorage().write("appbar", true);
          Get.find<ParseYAMLControllerImp>()
              .showTutorialCoachMarkForParserPage();
        },
        hideSkip: true,
        targets: appbarTarget(appBarkey),
        paddingFocus: 12,
        opacityShadow: 0.8,
        colorShadow: const Color.fromARGB(255, 0, 0, 0));
    tutorialCoachMark.show(context: context);
  }
}
