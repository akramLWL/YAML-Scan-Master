import 'package:get/get_state_manager/src/simple/get_controllers.dart';

abstract class AppBarController extends GetxController {
  void onchanged(int currentPage);
}

class AppBarControllerImpl extends AppBarController {
  late int activePage;

  @override
  void onchanged(int currentPage) {
    activePage = currentPage;
    update();
  }

  @override
  void onInit() {
    activePage = 0;
    super.onInit();
  }
}
