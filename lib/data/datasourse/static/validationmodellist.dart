
import 'package:yaml_validator/data/model/validation/car_validation.dart';
import 'package:yaml_validator/data/model/validation/product_validation.dart';
import 'package:yaml_validator/data/model/validation/student_validation.dart';
import 'package:yaml_validator/data/model/validationmodels.dart';


List<ValidationModel> validationModelList = [
    ValidationModel('student model', StudentValidator(), "Student data must contain the following fields: name (string), surname (string), age (int), and grad (object with 'math', 'physical', and 'compilation' grades as integers between 0 and 20). Email(string) field is optional.")
    ,ValidationModel('product model', ProductValidator(), "Product data must contain the following fields: name (string), id (string), quantity (int), price (number), and isNew (boolean). The 'price' field can be either an integer or a floating-point number. All other fields are required except desctiption."
)
, ValidationModel('Car model', CarValidator(), "Car data must contain the following fields: brand (string), model (string), year (int), engine (object with 'type' and 'power' fields), features (list of strings), price (double), and isNew (boolean).")
    
   
  ];