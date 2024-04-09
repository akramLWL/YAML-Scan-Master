import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_validator/core/function/createnewfile.dart';


abstract class ParseYAMLController extends GetxController {
  pickFile();
}

class ParseYAMLControllerImp extends ParseYAMLController {
  FilePickerResult? result;
  File? file;
  late String fileName;
  String? fileContent;
  late String resultValidation;
  dynamic jsonFormat;
  dynamic yamlMap;
  dynamic jsonData = "hello";
  @override
  pickFile() async {
   
    fileName = "waitng ...";
    update();
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['yaml', 'txt', 'yml'],
      );
      if (result != null) {
        fileName =
            "Selected File: ${result!.files.first.name}"; // to load file name
        update();
        _formatValidation();
      } else {
        Get.defaultDialog(
  title: "Why Did You Cancel?",
  middleText: "Hey, don't play with me, please!\nI'm about to call 911...",
            confirm: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const  Text("OK!")));
      }
    } catch (e) {
      Get.defaultDialog(
title: "Error" , 
middleText: "There is an error in accessing the storage." , 

            confirm: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const  Text("OK!")));
    }
  }

  _formatValidation() async {
    file = File(result!.files.single.path!);
    fileContent = await file?.readAsString();
    
    try {
      yamlMap = loadYaml(fileContent ?? "hello");
      resultValidation = "YAML data is well-formed.";

      // var validator = StudentValidator();
      // var s = json.encode(yamlMap);
      // var isValid = validator.validate(jsonDecode(s)).$1;
      // var stringValid = validator.validate(jsonDecode(s)).$2;
          
              

      // print('Student data is valid: $isValid');
      // print('Student data is valid: $stringValid');
      update();
      _parsingYAML();
    } catch (e) {
      resultValidation = 'YAML data is not well-formed.\nError: $e';
      update();
      // print('Error: $e');
      // print('YAML data is not well-formed.');
    }
  }

  _parsingYAML() async {
    if (yamlMap != null) {
      var jsonFormat = json.encode(yamlMap);

      // to make 4 space
      var encoder = const JsonEncoder.withIndent('    ');

      jsonData = encoder.convert(jsonDecode(jsonFormat));

      // print(jsonData);

      update();
      // print(jsonData);
    } else {
      Get.defaultDialog(
          title: "Error",
          middleText: "pls select a well-formed file first.",
          confirm: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("OK!")));
    }
  }

  saveFile() {
    if (jsonData != "upload file first.") {
      createAndSaveJsonFile(jsonData);
    } else {
      Get.defaultDialog(
          title: "Error",
          middleText: "pls select a well-formed file first.",
          confirm: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const  Text("OK!")));
    }
  }

  @override
  void onInit() {
    jsonData = "upload file first.";
    resultValidation = "not upload file yet ";
    fileName =
        "Please note: The app only accepts .txt files for validation and parsing. Make sure to save your YAML data in a text file (.txt) before proceeding.";
    super.onInit();
  }
}

// jsonFormat = json.encode(yamlMap);
//           var hello= json.decode(jsonFormat);
//           hello.forEach((key, value) {
//             print('$key: $value\n');

//           });
//  String printYaml(dynamic data, [String prefix = '']) {
//     StringBuffer buffer = StringBuffer();
//     _printYaml(data, buffer, prefix);
//     return buffer.toString();
//   }

//   void _printYaml(dynamic data, StringBuffer buffer, [String prefix = '']) {
//     if (data is Map) {
//       print("hehe");
//       data.forEach((key, value) {
//         buffer.writeln('$prefix$key:');
//         _printYaml(value, buffer, '$prefix  ');
//       });
//     } else if (data is List) {
//       print("zrooooooooooodiya ");
//       for (var item in data) {
//         if (item is Map) {
//           _printYaml(item, buffer, '$prefix- ');
//         } else {
//           buffer.writeln('$prefix$item');
//         }
//       }
//     } else {
//       print("battttttttttttttttataaaaaaaaaa");
//       buffer.writeln('$prefix$data');
//     }
//   }
