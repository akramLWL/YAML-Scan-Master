import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:yaml_validator/core/constant/approute.dart';
import 'package:yaml_validator/view/screen/home.dart';


List<GetPage<dynamic>> routes = [
   GetPage(name: AppRoutes.picker, page: ()=> const Home())


];
