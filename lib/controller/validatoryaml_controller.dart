import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_validator/core/function/showbuttomsheet.dart';
import 'package:yaml_validator/data/datasourse/static/validationmodellist.dart';


abstract class ValidatorYamlController extends GetxController {
  pickFile();
  selectModel();
}

class ValidatorYamlControllerImp extends ValidatorYamlController {
  FilePickerResult? result;
  File? file;
  late String fileName;
  late String resultValidation;
  late String resultValidationFormat;
  late int activeModel;

  String? fileContent;
  dynamic jsonFormat;
  dynamic yamlMap;
  dynamic jsonData = "hello";

  void onchanged(int currentModel) {
    activeModel = currentModel;

    // print(activeModel);
    update();
  }

  @override
  pickFile() async {
    // print(activeModel);
    if (activeModel != -1) {
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
          _formatValidation();

          update();
        } else {
          Get.defaultDialog(
              title: "Why Did You Cancel?",
              middleText:
                  "Hey, don't play with me, please!\nI'm about to call 911...",
              confirm: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child:const  Text("OK!")));
        }
      } catch (e) {
        // print(e);
      }
    } else {
      Get.defaultDialog(
          title: "Choose Model!!",
          middleText: "Please select a model before proceeding.",
          confirm: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("OK!")));
    }
  }

  _formatValidation() async {
    file = File(result!.files.single.path!);
    fileContent = await file?.readAsString();
    // print(fileContent);
    try {
      yamlMap = loadYaml(fileContent ?? "hello");
      resultValidation = "YAML data is well-formed.";
      update();
      _validate();
      // var validator = StudentValidator();
      // var s = json.encode(yamlMap);
      // var isValid = validator.validate(jsonDecode(s)).$1;
      // var stringValid = validator.validate(jsonDecode(s)).$2;

      // print('Student data is valid: $isValid');
      // print('Student data is valid: $stringValid');
      // update();
      _validate();
    } catch (e) {
      resultValidation = 'YAML data is not well-formed.\nError: $e';
      update();
      // print('Error: $e');
      // print('YAML data is not well-formed.');
    }
  }

  _validate() {
    var validator = validationModelList[activeModel].model;
    var s = json.encode(yamlMap);
    
    var stringValid =  "selected model : ${validationModelList[activeModel].title} \n${validator.validate(jsonDecode(s)).$2}";

    resultValidationFormat = stringValid;
    update();
  }

  @override
  Future<void> selectModel() async {
    showModels();
  }

  @override
  void onInit() {
    jsonData = "upload file first.";
    resultValidation = "upload file first.";
    fileName =
        "Please note: The app only accepts .txt files for validation and parsing. Make sure to save your YAML data in a text file (.txt) before proceeding.";
    activeModel = -1;
    resultValidationFormat = "Please select a model before proceeding.";
    super.onInit();
  }
}
