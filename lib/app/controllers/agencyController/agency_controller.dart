import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter_grounda/app/models/agencyModel/agency_model.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class AgencyController extends GetxController {
  late FocusNode formFocus;
  late FocusNode agencyOwnerNameFieldFocus;
  late FocusNode agencyEmailFieldFocus;
  late FocusNode agencyPhoneFieldFocus;
  late FocusNode agencyPasswordFieldFocus;
  var agencies = <AgencyModel>[].obs;
  var singleAgencies = SingleAgencies().obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  var logo = ''.obs;
  var banner = ''.obs;
  var token = ''.obs;
  var countryCode = ''.obs;
  var countryName = 'PK'.obs;
  var isLoading = false.obs;
  var sell = false.obs;
  var rent = false.obs;
  late bool _serviceEnabled;
  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  var country = ''.obs;
  var state = ''.obs;
  var city = ''.obs;
  var userId = 0.obs;

  TextEditingController agencyNameController = TextEditingController();
  TextEditingController agencyOwnerNameController = TextEditingController();
  TextEditingController agencyEmailController = TextEditingController();
  TextEditingController agencyPhoneController = TextEditingController();
  TextEditingController agencyPasswordController = TextEditingController();
  TextEditingController countryNameController = TextEditingController();
  TextEditingController agencyAddressController = TextEditingController();
  HtmlEditorController htmlEditorController = HtmlEditorController();

  @override
  void onInit() {
    super.onInit();
    token.value = tokenHiveBox.get('token');
    userId.value = int.parse(tokenHiveBox.get('userId'));
    formFocus = FocusNode();
    agencyOwnerNameFieldFocus = FocusNode();
    agencyEmailFieldFocus = FocusNode();
    agencyPhoneFieldFocus = FocusNode();
    agencyPasswordFieldFocus = FocusNode();
    getAll();
    getLocation();
  }

  Future<void> getAll() async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(
        baseUrl + getAgency,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      agencies.value = agencyModelFromJson(response.body);
      isLoading.value = false;
    } else {
      debugPrint('this is getting error here');
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> getbyId(String id) async {
    isLoading.value = true;
    var response = await http.get(
      Uri.parse(
        '$baseUrl$getAgency/$id',
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    print(response.body);
    if (response.statusCode == 200 && response.body != 'null') {
      singleAgencies.value = singleAgenciesFromJson(response.body);
      agencyNameController.text = singleAgencies.value.title!;
      agencyOwnerNameController.text = singleAgencies.value.ownerName!;
      agencyEmailController.text = singleAgencies.value.email!;
      agencyAddressController.text = singleAgencies.value.address!;
      agencyPhoneController.text = singleAgencies.value.mobile!;
      logo.value = singleAgencies.value.logoImage!;
      banner.value = singleAgencies.value.featuredImage!;

      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<bool> create(
      String title,
      String ownerName,
      String description,
      String logoImage,
      String featuredImage,
      String email,
      String mobile,
      String address,
      String country,
      String state,
      String city,
      String purpose,
      String propertyType,
      int userId,
      String slug,
      bool status) async {
    isLoading.value = true;
    var bodyPrepare = {
      "title": title,
      "ownerName": ownerName,
      "description": description,
      "logoImage": logoImage,
      "featuredImage": featuredImage,
      "email": email,
      "country": country,
      "address": address,
      "state": state,
      "city": city,
      "mobile": mobile,
      "userID": userId,
      "purpose": purpose,
      "propertyType": propertyType,
      "slug": slug,
      "status": status
    };

    var response = await http.post(
      Uri.parse(
        baseUrl + createAgency,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      isLoading.value = false;
      return true;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
      return false;
    }
  }

  Future<void> updateAgency(
    int id,
    String title,
    String companyTitle,
    String ownerName,
    String ownerMessage,
    String ownerProfilePic,
    String ownerDesignation,
    String country,
    String email,
    String website,
    String address,
    String description,
    String mobile,
    String landLine,
    String whatsApp,
    int userId,
    String featuredImage,
    String logoImage,
    String slug,
  ) async {
    isLoading.value = true;
    var bodyPrepare = {
      "id": id,
      "title": title,
      "companyTitle": companyTitle,
      "ownerName": ownerName,
      "ownerMessage": ownerMessage,
      "ownerProfilePic": ownerProfilePic,
      "ownerDesignation": ownerDesignation,
      "country": country,
      "email": email,
      "website": website,
      "address": address,
      "description": description,
      "mobile": mobile,
      "landLine": landLine,
      "whatsapp": whatsApp,
      "userID": 1,
      "featuredImage": featuredImage,
      "logoImage": logoImage,
      "slug": slug,
    };

    var response = await http.put(
      Uri.parse(
        baseUrl + updateAgencyUrl,
      ),
      body: jsonEncode(bodyPrepare),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  Future<void> delete(
    String id,
  ) async {
    isLoading.value = true;
    var response = await http.delete(
      Uri.parse(
        baseUrl + deleteAgency + id,
      ),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200 && response.body != 'null') {
      getAll();
      var deletedAgency = jsonDecode(response.body);
      var agency = deletedAgency['name'];
      Get.snackbar(
          'Agency Deleted', 'The Agency with name: $agency has been deleted',
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
      isLoading.value = false;
    }
  }

  getAgencyLogo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      // Upload file
      var upload = await FirebaseStorage.instance
          .ref('uploads/agency/logos/$fileName')
          .putData(fileBytes);
      final url = upload.ref.getDownloadURL().then((value) {
        logo.value = value;
      });
    }
  }

  getAgencyBanner() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;

      // Upload file
      var upload = await FirebaseStorage.instance
          .ref('uploads/agency/banners/$fileName')
          .putData(fileBytes);
      final url = upload.ref.getDownloadURL().then((value) {
        banner.value = value;
      });
    }
  }

  Future<void> getLocation() async {
    LocationPermission permission;
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    debugPrint('Latitude: ${latitude.value}, Longitude: ${longitude.value}');
  }
}
