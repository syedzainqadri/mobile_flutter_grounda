import 'package:get/get.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter_grounda/app/models/contactPersonModel/contact_person_model.dart';
import 'package:mobile_flutter_grounda/app/models/userModel/profile_model.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class ProfileController extends GetxController {
  var profile = ProfileModel().obs;
  var contactPerson = ContactPerson().obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var token = ''.obs;
  var id = ''.obs;
  var countryCode = ''.obs;
  var countryName = 'PK'.obs;
  var imageUrl =
      'https://static.vecteezy.com/system/resources/previews/009/734/564/large_2x/default-avatar-profile-icon-of-social-media-user-vector.jpg'
          .obs;
  var isLoading = false.obs;
  final Rx<TextEditingController> firstNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> lastNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> address1Controller =
      TextEditingController().obs;
  final Rx<TextEditingController> address2Controller =
      TextEditingController().obs;
  final Rx<TextEditingController> cityNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> stateNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> countryNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> phoneNumberController =
      TextEditingController().obs;
  final Rx<TextEditingController> postCodeController =
      TextEditingController().obs;
  final Rx<TextEditingController> landlineController =
      TextEditingController().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> contactPersonNameController =
      TextEditingController().obs;
  final Rx<TextEditingController> contactMobileNumberCodeController =
      TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token') ?? '';
    id.value = tokenHiveBox.get('userId') ?? '';
    if (id.value == '') {
    } else {
      getProfile(id.value);
    }
  }

  Future<void> createUserProfile(
    String firstName,
    String lastName,
    String addressLine1,
    String addressLine2,
    String city,
    String state,
    String country,
    String phone,
    String postCode,
    String longitude,
    String latitude,
    String images,
    int user,
    String email,
    String mobilePhone,
    String landLine,
    String contactPersonName,
    String contactPersonType,
  ) async {
    var bodyPrepare = {
      "firstName": firstName,
      "lastName": lastName,
      "addressLine1": addressLine1,
      "addressLine2": addressLine2,
      "city": city,
      "state": state,
      "country": country,
      "phone": phone,
      "postCode": postCode,
      "longitude": longitude,
      "latitude": latitude,
      "images": images,
      "user": user,
      "email": email,
      "mobilePhone": mobilePhone,
      "landLine": landLine,
      "contactPersonName": contactPersonName,
      "contactPersonType": contactPersonType,
      "status": true
    };
    debugPrint('$bodyPrepare');
    var response = await http.post(Uri.parse(baseUrl + createProfile),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      profile.value = profileModelFromJson(response.body);
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    }
  }

  Future<void> updateUserProfile(
    String firstName,
    String lastName,
    String addressLine1,
    String addressLine2,
    String city,
    String state,
    String country,
    String phone,
    String postCode,
    String longitude,
    String latitude,
    String images,
    int pid,
    String email,
    String mobilePhone,
    String landLine,
    String contactPersonName,
    String contactPersonType,
  ) async {
    var bodyPrepare = {
      'id': pid,
      "firstName": firstName,
      "lastName": lastName,
      "addressLine1": addressLine1,
      "addressLine2": addressLine2,
      "city": city,
      "state": state,
      "country": country,
      "phone": phone,
      "postCode": postCode,
      "longitude": longitude,
      "latitude": latitude,
      "images": images,
      "email": email,
      "mobilePhone": mobilePhone,
      "landLine": landLine,
      "contactPersonName": contactPersonName,
      "contactPersonType": contactPersonType
    };
    var response = await http.put(Uri.parse(baseUrl + updateProfile),
        body: jsonEncode(bodyPrepare),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200) {
      profile.value = profileModelFromJson(response.body);
      Get.snackbar('Success', 'Profile Updated',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    }
  }

  void getProfile(String id) async {
    isLoading.value = true;
    var response = await http.get(Uri.parse(baseUrl + profileById + id),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    if (response.statusCode == 200 && response.body != 'null') {
      profile.value = profileModelFromJson(response.body);
      var cpid = profile.value.postContactId!;
      await getContactPersonDetails(cpid.toString());
      firstNameController.value.text = profile.value.firstName!;
      lastNameController.value.text = profile.value.lastName!;
      address1Controller.value.text = profile.value.addressLine1!;
      address2Controller.value.text = profile.value.addressLine2!;
      cityNameController.value.text = profile.value.city!;
      stateNameController.value.text = profile.value.state!;
      countryNameController.value.text = profile.value.country!;
      phoneNumberController.value.text = profile.value.phone!;
      postCodeController.value.text = profile.value.postCode!;
      countryName.value = profile.value.country!;
      imageUrl.value = profile.value.images!;
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> getContactPersonDetails(String id) async {
    var response = await http
        .get(Uri.parse(baseUrl + getContactDetailsUrl + id), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.statusCode == 200 && response.body != 'null') {
      contactPerson.value = contactPersonFromJson(response.body);
      emailController.value.text = contactPerson.value.email!;
      landlineController.value.text = contactPerson.value.landLine!;
      contactMobileNumberCodeController.value.text = contactPerson.value.phone!;
      contactPersonNameController.value.text = contactPerson.value.name!;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    }
  }

  Future<void> delete(String id) async {
    var response = await http.delete(Uri.parse(baseUrl + deleteProfile + id),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    profile.value = profileModelFromJson(response.body);
    firstNameController.value.text = profile.value.firstName!;
    lastNameController.value.text = profile.value.lastName!;
    address1Controller.value.text = profile.value.addressLine1!;
    address2Controller.value.text = profile.value.addressLine2!;
    cityNameController.value.text = profile.value.city!;
    stateNameController.value.text = profile.value.state!;
    countryNameController.value.text = profile.value.country!;
    phoneNumberController.value.text = profile.value.phone!;
    postCodeController.value.text = profile.value.postCode!;
    countryName.value = profile.value.country!;
    Get.toNamed('/settings');
  }
}
