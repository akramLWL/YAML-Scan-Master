class CarValidator {
  (bool, String) validate(dynamic data) {
    if (data is! Map<dynamic, dynamic>) {
      return (false, "Invalid data format; expected a map.");
    }

    if (data.containsKey("cars") && data["cars"] is List) {
      List<dynamic> cars = data["cars"];
      for (var car in cars) {
        final validation = _validateCar(car);
        if (!validation.$1) {
          return validation;
        }
      }
      return (true, "All cars are valid.");
    } else {
      return _validateCar(data);
    }
  }

  (bool, String) _validateCar(Map<dynamic, dynamic> carData) {
    final requiredFields = ['brand', 'model', 'year', 'engine', 'features', 'price', 'isNew'];
    for (var field in requiredFields) {
      if (!carData.containsKey(field)) {
        return (false, "Field '$field' is missing.");
      }
    }

    if (carData.length != 7) {
      return (false, "Unexpected fields found.");
    }

    final brand = carData['brand'];
    final model = carData['model'];
    final year = carData['year'];
    final engine = carData['engine'];
    final features = carData['features'];
    final price = carData['price'];
    final isNew = carData['isNew'];

    if (brand is! String || model is! String || 
        year is! int || engine is! Map || 
        features is! List || !(price is double || price is int) || 
        isNew is! bool) {
      return (false, "Field types are incorrect.");
    }

    if (brand.isEmpty || model.isEmpty || year <= 0 || engine.isEmpty || features.isEmpty) {
      return (false, "One of the fields is empty or has an invalid value.");
    }

    if (engine['type'] is! String || engine['power'] is! int) {
      return (false, "Engine data has incorrect format.");
    }

    return (true, "Car is valid.");
  }
}
