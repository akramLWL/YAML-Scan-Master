

import 'package:flutter/material.dart';
import 'package:yaml_validator/data/model/navigationitem.dart';
import 'package:yaml_validator/view/screen/parseryaml.dart';
import 'package:yaml_validator/view/screen/validatoryaml.dart';

List<NavigationItem> navigationItemList = [
    NavigationItem('Parser', Icons.account_tree_outlined, const  ParserYaml()),
    NavigationItem('Validator', Icons.error_rounded,const  ValidatorYaml()),
   
  ];