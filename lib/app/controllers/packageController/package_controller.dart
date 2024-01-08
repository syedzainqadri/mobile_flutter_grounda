import 'package:get/get.dart';

class PackageController extends GetxController {
  var checkboxStates1 = List<bool>.filled(10, false).obs;
  var checkboxStates2 = List<bool>.filled(10, false).obs;
  var checkboxStates3 = List<bool>.filled(10, false).obs;

  var totalPrice = 0.0.obs;
  var totalItems = 0.obs;
  var totalAds = 0.obs;
  var isSend = false.obs;

  void resetValues() {
    checkboxStates1.value = List<bool>.filled(10, false);
    checkboxStates2.value = List<bool>.filled(10, false);
    checkboxStates3.value = List<bool>.filled(10, false);
    totalPrice.value = 0.0;
    totalItems.value = 0;
    totalAds.value = 0;
    isSend.value = false;
  }

  void handleCheckboxChange1(bool value, int index) {
    checkboxStates1[index] = value;
    calculateTotal();
  }

  void handleCheckboxChange2(bool value, int index) {
    checkboxStates2[index] = value;
    calculateTotal();
  }

  void handleCheckboxChange3(bool value, int index) {
    checkboxStates3[index] = value;
    calculateTotal();
  }

  void calculateTotal() {
    double price = 0.0;
    int items = 0;
    int ads = 0;

    for (int i = 0; i < checkboxStates1.length; i++) {
      if (checkboxStates1[i]) {
        price += (i + 1) * 100;
        items += 1;
        ads += i + 1;
      }
    }

    for (int i = 0; i < checkboxStates2.length; i++) {
      if (checkboxStates2[i]) {
        price += (i + 1) * 500;
        items += 1;
        ads += i + 1;
      }
    }

    for (int i = 0; i < checkboxStates3.length; i++) {
      if (checkboxStates3[i]) {
        price += (i + 1) * 1000;
        items += 1;
        ads += i + 1;
      }
    }
    totalPrice.value = price;
    totalItems.value = items;
    totalAds.value = ads;
  }
}
