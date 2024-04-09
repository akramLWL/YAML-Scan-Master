//  String id;
//    String name;
//    String description;
//    double price;
//    int quantity;
//    bool isNew;


class ProductValidator {
  (bool, String) validate(dynamic data) {
    // print("--------------------------------");
    // print(data);
    // print("--------------------------------");

    if (data is Map<dynamic, dynamic>) {
      if (data.containsKey("products") && data["products"] is List) {
        List<dynamic> products = data["products"];
        for (var product in products) {
          if (!_validateproduct(product).$1) {
            
            return _validateproduct(product);
          }
        }
       

        return (true, "It's valid.");
      } else {
        return _validateproduct(data);
      }
    } else {
 
      return (false, "there is error check your file ");
    }
  }

  (bool, String) _validateproduct(Map<dynamic, dynamic> productData) {
   
    if (!productData.containsKey('id') ||
        !productData.containsKey('name') ||
        
        !productData.containsKey('quantity') ||
        !productData.containsKey('isNew') ||
        !productData.containsKey('price')) {
     
      return (
        false,
        "There is a missing field; one of the following: id, name , quantity , isNew , Price ."
      );
    }
   if (productData.length != 5 &&
    !(productData.length == 6 && productData.containsKey('description'))) {
      
      return (false, "Unexpected fields found in the product data.");
    }

    var id = productData['id'];
    var name = productData['name'];
    var quantity = productData['quantity'];
    var isNew = productData['isNew'];
    var price = productData['price'];

 if (name is! String || id is! String || quantity is! int || (price is! double && price is! int) || isNew is! bool) {
  return (
    false,
    "One item is not correct (name is not a string, id is not a string, quantity is not an integer, or price is not a number, or isNew is not a boolean)."
  );
}


    if (name.isEmpty || id.isEmpty || quantity <= 0) {
      // print("hoho");
      return (false, "One of the fields (name, id, or quantity) is empty.");
    }
    

    if (productData.containsKey('description')) {
      var description = productData['description'];
      if (description != null && description is! String) {
        return (false, "description string not correctly formatted.");
      }
    }

    return (true, "It's valid.");
  }
}
