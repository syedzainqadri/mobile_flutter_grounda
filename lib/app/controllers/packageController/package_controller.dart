import 'package:get/get.dart';

class PackageController extends GetxController {
  var checkboxStates1 = List<bool>.filled(10, false).obs;
  var checkboxStates2 = List<bool>.filled(10, false).obs;
  var checkboxStates3 = List<bool>.filled(10, false).obs;

  void handleCheckboxChange1(bool value, int index) {
    checkboxStates1[index] = value;
  }

  void handleCheckboxChange2(bool value, int index) {
    checkboxStates2[index] = value;
  }

  void handleCheckboxChange3(bool value, int index) {
    checkboxStates3[index] = value;
  }
}
