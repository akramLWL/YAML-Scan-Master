import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yaml_validator/controller/validatoryaml_controller.dart';
import 'package:yaml_validator/data/datasourse/static/validationmodellist.dart';


Future<void> showModels() async {
  
  Get.bottomSheet(GetBuilder<ValidatorYamlControllerImp>(builder: (controller) => Container(
    height: Get.height / 2,
    width: double.infinity,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            textAlign: TextAlign.center,
            "press on one model : ",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800),
          ),
          Expanded(
              child: ListView(
            children: [
              ...List.generate(
                validationModelList.length,
                (index) => ModelContainer(
                  data: validationModelList[index].title,
                  onPressed: () => {
                    // print(controller.activeModel)
                   controller.onchanged(index) , controller.resultValidationFormat = controller.activeModel == -1
        ? "upload file first."
        : validationModelList[controller.activeModel].description
        ,  Get.back()},
                ),
              ),
            ],
          )),const Text(
            textAlign: TextAlign.center,
            "If you need more models, please call the developer" ,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
          ),
          ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black)),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.white),
            ),
          ),

        ],
      ),
    ),
  ),));
}

class ModelContainer extends StatelessWidget {
  final void Function()? onPressed;
  final String data;
  const ModelContainer(
      {super.key, required this.onPressed, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:const  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 3,
        child: MaterialButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            child: Text(
              data,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
