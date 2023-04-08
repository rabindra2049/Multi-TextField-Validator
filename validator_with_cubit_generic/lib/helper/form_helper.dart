import 'package:validator_with_cubit_generic/models/generic_model.dart';

class FormHelper {
  static bool isExpiryEnabled(String? idType) {
    switch (idType?.toLowerCase()) {
      case "citizenship":
        return false;
      case "driving license":
        return true;
    }
    return true;
  }

  static List<GenericModel> generateModels() {
    List<String>? items = ["Citizenship", "Driving License"];
    final List<GenericModel> searchModels = [];
    for (String item in items) {
      searchModels.add(GenericModel(
        id: item,
        title: item,
      ));
    }
    return searchModels;
  }
}
