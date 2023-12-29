// ignore_for_file: must_be_immutable, unused_local_variable

import 'dart:typed_data';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/authController/auth_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/profileController/profile_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/default_button.dart';
import 'package:mobile_flutter_grounda/app/widgets/text_fields.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';

class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({super.key});
  final ProfileController profileController = Get.find<ProfileController>();
  final AuthController authController = Get.find<AuthController>();
  double height = Get.height;
  double width = Get.width;
  late bool _serviceEnabled;

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kPrimaryColor,
                Colors.white,
              ],
            ),
          ),
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Obx(
                      () => profileController.profile.value.images == ''
                          ? Center(
                              child: SizedBox(
                                  width: width * .05,
                                  child: const CircularProgressIndicator(
                                      color: kPrimaryColor)),
                            )
                          : CircleAvatar(
                              radius: 75,
                              backgroundImage: NetworkImage(profileController
                                          .profile.value.images ==
                                      'images'
                                  ? 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'
                                  : profileController.profile.value.images!),
                            ),
                    ),
                    onTap: () async {
                      Get.defaultDialog(
                        title: 'Uploading Picture',
                        content: const CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      );
                      await getImage();
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller:
                              profileController.firstNameController.value,
                          hintText: 'Enter First Name',
                          lableText: 'First Name',
                          icon: const Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller:
                              profileController.lastNameController.value,
                          hintText: 'Enter Last Name',
                          lableText: 'Last Name',
                          icon: const Icon(Icons.person),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller:
                              profileController.address1Controller.value,
                          hintText: 'Enter Address',
                          lableText: 'Address Line 1',
                          icon: const Icon(Icons.mail),
                        ),
                      ),
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller:
                              profileController.address2Controller.value,
                          hintText: 'Enter Address',
                          lableText: 'Address Line 2',
                          icon: const Icon(Icons.mail),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller:
                              profileController.cityNameController.value,
                          hintText: 'Enter City',
                          lableText: 'City',
                          icon: const Icon(Icons.location_city),
                        ),
                      ),
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller:
                              profileController.stateNameController.value,
                          hintText: 'Enter State',
                          lableText: 'State',
                          icon: const Icon(Icons.location_city_sharp),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller:
                              profileController.phoneNumberController.value,
                          hintText: 'Enter Phone Number',
                          lableText: 'Phone Number',
                          icon: const Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller:
                              profileController.postCodeController.value,
                          hintText: 'Enter Post Code',
                          lableText: 'Post Code',
                          icon: const Icon(Icons.local_post_office),
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: width * .8,
                        height: height * .05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kPrimaryColor),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              profileController.countryName.value == ''
                                  ? const Text(
                                      'Select Your Country',
                                      style: TextStyle(color: kWhiteColor),
                                    )
                                  : Text(
                                      profileController.countryName.value,
                                      style:
                                          const TextStyle(color: kWhiteColor),
                                    ),
                              CountryListPick(
                                initialSelection: profileController
                                    .countryName.value
                                    .toLowerCase(),
                                useSafeArea: true,
                                useUiOverlay: true,
                                theme: CountryTheme(
                                  labelColor: Colors.black,
                                  isShowFlag: true,
                                  isShowTitle: false,
                                  isShowCode: false,
                                  isDownIcon: false,
                                  showEnglishName: true,
                                ),
                                onChanged: (value) async {
                                  profileController.countryNameController.value
                                      .text = value!.code!;
                                  profileController.countryCode.value =
                                      value.dialCode!;
                                  await getLocation();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Contact Details',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: kDarkBgColor),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller:
                              profileController.landlineController.value,
                          hintText: 'Land Line',
                          lableText: 'Enter Land Line Number',
                          icon: const Icon(Icons.phone),
                        ),
                      ),
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller: profileController.emailController.value,
                          hintText: 'Email',
                          lableText: 'Enter Email Address',
                          icon: const Icon(Icons.email),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller: profileController
                              .contactMobileNumberCodeController.value,
                          hintText: 'Contact Mobile Number',
                          lableText: 'Enter Mobile Number',
                          icon: const Icon(Icons.mobile_friendly),
                        ),
                      ),
                      SizedBox(
                        width: width * .8,
                        child: ProfileScreenTextField(
                          controller: profileController
                              .contactPersonNameController.value,
                          hintText: 'Contact Persons Name',
                          lableText: 'Enter Contact Persons Name',
                          icon: const Icon(Icons.person),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultButton(
                        primaryColor: kWhiteColor,
                        hoverColor: kDarkCardColor,
                        buttonText: 'Cancle',
                        onPressed: () {
                          // Get.toNamed('/settings');
                        },
                        width: width * .15,
                        height: height * .05,
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      DefaultButton(
                        primaryColor: kRedColor,
                        hoverColor: kDarkCardColor,
                        buttonText: 'Delete',
                        onPressed: () async {
                          Get.defaultDialog(
                            title: 'Deleting Profile',
                            content: const CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          );
                          await profileController.delete(
                              profileController.profile.value.id!.toString());
                          Navigator.pop(context);
                          // Get.toNamed('/settings');
                        },
                        width: width * .15,
                        height: height * .05,
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      profileController.profile.value.firstName == ''
                          ? DefaultButton(
                              primaryColor: kPrimaryColor,
                              hoverColor: kDarkCardColor,
                              buttonText: 'Create',
                              onPressed: () async {
                                Get.defaultDialog(
                                  barrierDismissible: false,
                                  title: 'Creating Profile',
                                  content: const CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                );
                                var userId = profileController.tokenHiveBox
                                    .get('userId');
                                int userId0 = int.parse(userId);
                                debugPrint(
                                    "<======== Start Creating Profile =======>");
                                debugPrint('$userId0');
                                debugPrint(profileController
                                    .firstNameController.value.text);
                                debugPrint(profileController
                                    .lastNameController.value.text);
                                debugPrint(profileController
                                    .address1Controller.value.text);
                                debugPrint(profileController
                                    .address2Controller.value.text);
                                debugPrint(profileController
                                    .cityNameController.value.text);
                                debugPrint(profileController
                                    .stateNameController.value.text);
                                debugPrint(profileController
                                    .countryNameController.value.text);
                                debugPrint(profileController
                                    .phoneNumberController.value.text);
                                debugPrint(profileController
                                    .postCodeController.value.text);
                                debugPrint(longitude.value.toString());
                                debugPrint(latitude.value.toString());
                                debugPrint(profileController
                                    .emailController.value.text);
                                debugPrint(profileController
                                    .contactMobileNumberCodeController
                                    .value
                                    .text);
                                debugPrint(profileController
                                    .landlineController.value.text);
                                debugPrint(profileController
                                    .contactPersonNameController.value.text);
                                debugPrint(
                                    "<======== Creating Profile =======>");
                                await profileController.createUserProfile(
                                    profileController
                                        .firstNameController.value.text,
                                    profileController
                                        .lastNameController.value.text,
                                    profileController
                                        .address1Controller.value.text,
                                    profileController
                                        .address2Controller.value.text,
                                    profileController
                                        .cityNameController.value.text,
                                    profileController
                                        .stateNameController.value.text,
                                    profileController
                                        .countryNameController.value.text,
                                    profileController.countryCode.value +
                                        profileController
                                            .phoneNumberController.value.text,
                                    profileController
                                        .postCodeController.value.text,
                                    longitude.value.toString(),
                                    latitude.value.toString(),
                                    profileController.imageUrl.value,
                                    userId0,
                                    profileController
                                        .emailController.value.text,
                                    profileController
                                        .contactMobileNumberCodeController
                                        .value
                                        .text,
                                    profileController
                                        .landlineController.value.text,
                                    profileController
                                        .contactPersonNameController.value.text,
                                    "SELLER");
                              },
                              width: width * .15,
                              height: height * .05,
                            )
                          : DefaultButton(
                              primaryColor: kPrimaryColor,
                              hoverColor: kDarkCardColor,
                              buttonText: 'Update',
                              onPressed: () async {
                                Get.defaultDialog(
                                  barrierDismissible: false,
                                  title: 'Updating Profile',
                                  content: const CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                );

                                await profileController.updateUserProfile(
                                    profileController
                                        .firstNameController.value.text,
                                    profileController
                                        .lastNameController.value.text,
                                    profileController
                                        .address1Controller.value.text,
                                    profileController
                                        .address2Controller.value.text,
                                    profileController
                                        .cityNameController.value.text,
                                    profileController
                                        .stateNameController.value.text,
                                    profileController
                                        .countryNameController.value.text,
                                    profileController.countryCode.value +
                                        profileController
                                            .phoneNumberController.value.text,
                                    profileController
                                        .postCodeController.value.text,
                                    longitude.value.toString(),
                                    latitude.value.toString(),
                                    profileController.imageUrl.value,
                                    profileController.profile.value.id!,
                                    profileController
                                        .emailController.value.text,
                                    profileController
                                        .contactMobileNumberCodeController
                                        .value
                                        .text,
                                    profileController
                                        .landlineController.value.text,
                                    profileController
                                        .contactPersonNameController.value.text,
                                    "SELLER");
                                Navigator.pop(context);
                              },
                              width: width * .15,
                              height: height * .05,
                            ),
                    ],
                  ).paddingOnly(bottom: 20, right: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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

  getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;
      var upload = await FirebaseStorage.instance
          .ref('uploads/users/profileImages/$fileName')
          .putData(fileBytes);
      final url = upload.ref.getDownloadURL().then((value) {
        profileController.imageUrl.value = value;
      });
    }
  }
}

class ProfileScreenTextField extends StatelessWidget {
  ProfileScreenTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.lableText,
    required this.icon,
  });

  double width = Get.width;
  dynamic controller;
  String hintText;
  String lableText;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: width * .3,
        child: DefaultTextField(
          textEditingController: controller,
          hintText: hintText,
          labelText: lableText,
          isPassword: false,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
