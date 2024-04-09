import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

List<TargetFocus> appbarTarget(GlobalKey appBarkey) {
  List<TargetFocus> list = [];
  list.add(TargetFocus(
      keyTarget: appBarkey,
      alignSkip: Alignment.center,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return const Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "This is the bottom app bar where you can switch between the YAML parsing mode and the YAML validation mode.\n(^_^) click on it to go next(^_^) ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          },
        )
      ]));
  return list;
}

List<TargetFocus> parserTarget({required GlobalKey pickFileKey,required GlobalKey  resultValidationFormatKey ,required GlobalKey parsingResultKey ,required GlobalKey  floatingButtonKey}) {
  List<TargetFocus> list = [];
  list.add(TargetFocus(
      keyTarget: pickFileKey,
      alignSkip: Alignment.center,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return const Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "This button allows you to select a file for testing purposes. Please note that only .txt files are supported on mobile devices, as YAML and YML files are not compatible. However, in the PC version, these formats are fully supported.(The version for other platforms will be available soon.) \n\n(^_^) click on it to go next(^_^) ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          },
        )
      ]));
      /////////////////////////////////////////////////////////////////////////
      
       list.add(TargetFocus(
      keyTarget: resultValidationFormatKey,
      alignSkip: Alignment.center,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return const Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "This space serves to display whether the YAML is well-formed or not. If the YAML structure is incorrect, the app will provide information on the specific location of the error.\n(^_^) click on it to go next(^_^) ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          },
        )
      ]));
       /////////////////////////////////////////////////////////////////////////
      
       list.add(TargetFocus(
      keyTarget: parsingResultKey,
      alignSkip: Alignment.center,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return const Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "This space will provide updates on the YAML parsing process. It will convert the YAML file into a JSON format. \n(^_^) click on it to go next(^_^) ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          },
        )
      ]));
       /////////////////////////////////////////////////////////////////////////
      
       list.add(TargetFocus(
      keyTarget: floatingButtonKey,
      alignSkip: Alignment.center,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return const Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "This button allows you to download the parsed result as a JSON file. \n(^_^) click on it to go next(^_^) ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          },
        )
      ]));
  return list;
}
List<TargetFocus> validatorTarget({required GlobalKey pickFileKey,required GlobalKey  resultValidationFormatKey ,required GlobalKey parsingResultKey ,required GlobalKey  floatingButtonKey}) {
  List<TargetFocus> list = [];
  list.add(TargetFocus(
      keyTarget: pickFileKey,
      alignSkip: Alignment.center,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.bottom,
          builder: (context, controller) {
            return const Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "This button allows you to select a file for testing purposes. Please note that only .txt files are supported on mobile devices, as YAML and YML files are not compatible. However, in the PC version, these formats are fully supported.(The version for other platforms will be available soon.) \n\n(^_^) click on it to go next(^_^) ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          },
        )
      ]));
      /////////////////////////////////////////////////////////////////////////
      
       list.add(TargetFocus(
      keyTarget: resultValidationFormatKey,
      alignSkip: Alignment.center,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return const Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "This space serves to display whether the YAML is well-formed or not. If the YAML structure is incorrect, the app will provide information on the specific location of the error.\n(^_^) click on it to go next(^_^) ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          },
        )
      ]));
       /////////////////////////////////////////////////////////////////////////
      
       list.add(TargetFocus(
      keyTarget: parsingResultKey,
      alignSkip: Alignment.center,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return const Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "This space displays the requirements of the selected model before choosing a file. After selecting the file, it will indicate whether the YAML file is valid with the chosen model, and if not, it will show you the error. \n(^_^) click on it to go next(^_^) ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          },
        )
      ]));
       /////////////////////////////////////////////////////////////////////////
      
       list.add(TargetFocus(
      keyTarget: floatingButtonKey,
      alignSkip: Alignment.center,
      radius: 10,
      shape: ShapeLightFocus.RRect,
      contents: [
        TargetContent(
          align: ContentAlign.top,
          builder: (context, controller) {
            return const Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "This button allows you to select the model to test your YAML with. Please ensure that you select a model first. If you require additional models, please contact the developer.\n(^_^) click on it to go next(^_^) ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w800),
                )
              ],
            );
          },
        )
      ]));
  return list;
}
