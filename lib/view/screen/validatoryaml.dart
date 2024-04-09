import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yaml_validator/controller/validatoryaml_controller.dart';
import 'package:yaml_validator/view/widget/customappbar.dart';
import 'package:yaml_validator/view/widget/customcard.dart';
import 'package:yaml_validator/view/widget/customfloatingbutton.dart';
import 'package:yaml_validator/view/widget/uploadfilebutton.dart';

class ValidatorYaml extends StatelessWidget {
  const ValidatorYaml({super.key});

  @override
  Widget build(BuildContext context) {
    ValidatorYamlControllerImp controller =
        Get.put(ValidatorYamlControllerImp());
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButton(
        textButtonfloating: 'Select a model ',
        onPressed: () {
          controller.selectModel();
        },
      ),
      appBar: const CustomAppBar(
        titleBar: "Validator YAML",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, right: 10, left: 10),
        child: GetBuilder<ValidatorYamlControllerImp>(
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
                "Validating Result",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
              CustomCard(text: controller.resultValidationFormat, textAlign: TextAlign.start),
            ],
          ),
        ),
      ),
    );
  }
}
