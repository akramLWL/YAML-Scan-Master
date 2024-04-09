import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaml_validator/controller/appbar_controller.dart';

import 'package:yaml_validator/data/datasourse/static/navigationitemslist.dart';
import 'package:yaml_validator/view/widget/iconbuttonbar.dart';

class ButtomAppBar extends GetView<AppBarControllerImpl> {
  const ButtomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppBarControllerImpl);
    return Container(
      
      color: Colors.white, // Set background color to white
      child: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              navigationItemList.length,
              (index) => IconButtonBar(
                isActive: controller.activePage == index,
                text: navigationItemList[index].text,
                icon: navigationItemList[index].icon,
                onPressed: () => controller.onchanged(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
