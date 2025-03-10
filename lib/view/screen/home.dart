import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yaml_validator/controller/appbar_controller.dart';
import 'package:yaml_validator/data/datasourse/static/navigationitemslist.dart';
import 'package:yaml_validator/view/widget/bottomappbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppBarControllerImpl(context));
    
    return GetBuilder<AppBarControllerImpl>(
        builder: (controller) =>  Scaffold(
      bottomNavigationBar:   ButtomAppBar(key: controller.appBarkey),
      body: navigationItemList[controller.activePage].page,
      ),
    );
  }
}
