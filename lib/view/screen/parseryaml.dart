import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yaml_validator/controller/parseyaml_controller.dart';
import 'package:yaml_validator/view/widget/customappbar.dart';
import 'package:yaml_validator/view/widget/customcard.dart';
import 'package:yaml_validator/view/widget/customfloatingbutton.dart';
import 'package:yaml_validator/view/widget/uploadfilebutton.dart';

class ParserYaml extends StatelessWidget {
  const ParserYaml({super.key});

  @override
  Widget build(BuildContext context) {
  ParseYAMLControllerImp controller =  Get.put(ParseYAMLControllerImp());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButton(
        textButtonfloating: 'Download Parsed YAML',
        onPressed: () {
          controller.saveFile();
        },
      ),
      appBar: const CustomAppBar(
        titleBar: "Parser YAML",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, right: 10, left: 10),
        child: GetBuilder<ParseYAMLControllerImp>(
          builder: (controller) => ListView(
            children: [
              UploadFileButton(
                onPressed: () {
                  controller.pickFile();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  controller.fileName,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                "Format Validation Result",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomCard(
                text: controller.resultValidation,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                textAlign: TextAlign.center,
                "Parsing Result ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
              CustomCard(text: controller.jsonData, textAlign: TextAlign.start),
            ],
          ),
        ),
      ),
    );
  }
}
