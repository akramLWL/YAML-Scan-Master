import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

Future<void> createAndSaveJsonFile(String jsonData) async {
  try {
    final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/data_${DateTime.now().millisecondsSinceEpoch}.json');
  await file.writeAsString(json.encode(jsonData));
  Get.defaultDialog(
          title: "success",
          middleText: "Your file was saved successfully.\nFile path: ${file.path}",
          confirm: TextButton(
              onPressed: () {
                Get.back();
              },
              child:const  Text("OK!")));
       
    
  } catch (e) {
    Get.defaultDialog(
          title: "Error",
          middleText: "Failed to save JSON (parser file) to file: $e.",
          confirm: TextButton(
              onPressed: () {
                Get.back();
              },
              child:const  Text("OK!")));
    
  }

}


