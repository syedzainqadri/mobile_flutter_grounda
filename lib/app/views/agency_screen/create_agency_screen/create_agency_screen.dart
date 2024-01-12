import 'dart:convert';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:mobile_flutter_grounda/app/controllers/agencyController/agency_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/authController/auth_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/categoryController/category_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/themeController/theme_change_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/default_button.dart';
import 'package:mobile_flutter_grounda/app/widgets/text_fields.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class CreateAgencyScreen extends GetView<ThemeChangeController> {
  CreateAgencyScreen({super.key});

  ScrollController scrollController =
      ScrollController(initialScrollOffset: 00.0);
  AgencyController agencyController = Get.find<AgencyController>();
  CategoryController categoryController = Get.find<CategoryController>();
  AuthController authController = Get.find<AuthController>();
  var height = Get.height;
  var width = Get.width;

  RxList<String> agencyCategory = RxList.empty(growable: true);
  var indexs = [].obs;
  var purposeList = ''.obs;
  var categoryList = ''.obs;
  RxInt selectedIndex = 0.obs;
  var purpose = [].obs;
  RxBool isObsecure = true.obs;
  RxBool statusValue = false.obs;
  bool isSelected(index, List indexs, List agencyCategory) {
    if (indexs.contains(index)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          backgroundColor: kWhiteColor,
          appBar: AppBar(
            title: const Text('Create Agency'),
            centerTitle: true,
            backgroundColor: kWhite,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  //form
                  SizedBox(
                    width: width * .8,
                    child: Focus(
                      focusNode: agencyController.formFocus,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: ClipOval(
                                child: SizedBox.fromSize(
                                  size:
                                      const Size.fromRadius(48), // Image radius
                                  child: agencyController.logo.value == ''
                                      ? CircleAvatar(
                                          backgroundColor: kDarkCardColor,
                                          child: IconButton(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {
                                              Get.defaultDialog(
                                                title: 'Uploading Image',
                                                content: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: kPrimaryColor),
                                                ),
                                                barrierDismissible: false,
                                              );
                                              agencyController.getAgencyLogo();
                                              Navigator.pop(context);
                                            },
                                          ))
                                      : InkWell(
                                          onTap: () {
                                            Get.defaultDialog(
                                              title: 'Uploading Image',
                                              content: const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: kPrimaryColor),
                                              ),
                                              barrierDismissible: false,
                                            );
                                            agencyController.getAgencyLogo();
                                            Navigator.pop(context);
                                          },
                                          child: Image.network(
                                              agencyController.logo.value,
                                              fit: BoxFit.cover),
                                        ),
                                ),
                              ),
                            ),
                            DefaultTextField(
                              autofocus: true,
                              maxLength: 22,
                              hintText: 'Name',
                              labelText: 'Name',
                              isPassword: false,
                              textEditingController:
                                  agencyController.agencyNameController,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    agencyController.agencyOwnerNameFieldFocus);
                              },
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Agency Name cannot be empty';
                                }
                              },
                            ),
                            DefaultTextField(
                              maxLength: 50,
                              hintText: 'Agency Owner Name',
                              labelText: 'Agency Owner Name',
                              isPassword: false,
                              textEditingController:
                                  agencyController.agencyOwnerNameController,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    agencyController.agencyEmailFieldFocus);
                              },
                              validator: (value) {
                                if (value == null ||
                                    value == '' ||
                                    !GetUtils.isWord(value)) {
                                  return 'Name cannot be empty';
                                }
                              },
                            ),
                            DefaultTextField(
                              maxLength: 50,
                              hintText: 'Agency Email',
                              labelText: 'Agency Email',
                              isPassword: false,
                              textEditingController:
                                  agencyController.agencyEmailController,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    agencyController.agencyPhoneFieldFocus);
                              },
                              validator: (value) {
                                if (value == null ||
                                    value == '' ||
                                    !GetUtils.isEmail(value)) {
                                  return 'Email cannot be empty';
                                }
                              },
                            ),
                            DefaultTextField(
                              maxLength: 14,
                              hintText: 'Agency Phone',
                              labelText: 'Agency Phone',
                              isPassword: false,
                              textEditingController:
                                  agencyController.agencyPhoneController,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    agencyController.agencyPasswordFieldFocus);
                              },
                              validator: (value) {
                                if (value == null ||
                                    value == '' ||
                                    !GetUtils.isPhoneNumber(value)) {
                                  return 'Phone Nummber cannot be empty';
                                }
                              },
                            ),
                            DefaultTextField(
                              maxLength: 14,
                              hintText: 'Password',
                              labelText: 'Password',
                              isPassword: isObsecure.value,
                              maxLines: 1,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  isObsecure.value =
                                      isObsecure.value ? false : true;
                                },
                                icon: isObsecure.value
                                    ? const Icon(Icons.password)
                                    : const Icon(Icons.remove_red_eye),
                                // icon: const Icon(Icons.remove_red_eye),
                              ),
                              textEditingController:
                                  agencyController.agencyPasswordController,
                              // onFieldSubmitted: (value) {
                              //   FocusScope.of(context).requestFocus(
                              //       agencyController.agencyNameFieldFocus);
                              // },
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Password cannot be empty';
                                }
                              },
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Container(
                              height: height * .22,
                              width: width * .8,
                              decoration: const BoxDecoration(
                                color: kBgColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 20.0),
                                    child: Text(
                                      'Purpose',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: CheckboxListTile(
                                      title: Text(
                                        'Sell',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      value: agencyController.sell.value,
                                      onChanged: (value) {
                                        agencyController.sell.value = value!;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: CheckboxListTile(
                                      title: Text(
                                        'Rent',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      value: agencyController.rent.value,
                                      onChanged: (value) {
                                        agencyController.rent.value = value!;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  //right side
                  Scrollbar(
                    controller: scrollController,
                    thumbVisibility: false,
                    trackVisibility: false,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width * .8,
                                height: height * .2,
                                decoration: BoxDecoration(
                                  image: agencyController.logo.value == ''
                                      ? const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/mountains.webp'),
                                        )
                                      : DecorationImage(
                                          image: NetworkImage(
                                              agencyController.banner.value),
                                        ),
                                  color: kDarkCardColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    agencyController.getAgencyBanner();
                                  },
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: width * .8,
                                  height: height * .2,
                                  decoration: BoxDecoration(
                                      color: kBgColor,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      )),
                                  child: agencyController.latitude.value == 0
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                          color: kPrimaryColor,
                                        ))
                                      : GoogleMap(
                                          initialCameraPosition: CameraPosition(
                                            target: LatLng(
                                                agencyController.latitude.value,
                                                agencyController
                                                    .longitude.value),
                                            zoom: 14.4746,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Column(
                            children: [
                              Container(
                                width: width * .8,
                                height: height * .3,
                                decoration: BoxDecoration(
                                  color: kCardColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: HtmlEditor(
                                  htmlToolbarOptions: const HtmlToolbarOptions(
                                    defaultToolbarButtons: [
                                      FontSettingButtons(),
                                      ColorButtons(),
                                      ListButtons(),
                                    ],
                                    toolbarItemHeight: 30,
                                    toolbarType: ToolbarType.nativeExpandable,
                                  ),
                                  controller: agencyController
                                      .htmlEditorController, //required
                                  htmlEditorOptions: const HtmlEditorOptions(
                                    autoAdjustHeight: true,
                                    androidUseHybridComposition: true,
                                    hint: "Your Description here...",
                                    //initalText: "text content initial, if any",
                                  ),
                                  otherOptions: const OtherOptions(
                                    height: 350,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * .02,
                              ),
                              //TODO: Replace with address details
                              Column(
                                children: [
                                  SizedBox(
                                    width: width * .8,
                                    child: SelectState(
                                      onCountryChanged: (String value) {
                                        agencyController.country.value = value;
                                      },
                                      onCityChanged: (String value) {
                                        agencyController.state.value = value;
                                      },
                                      onStateChanged: (String value) {
                                        agencyController.city.value = value;
                                      },
                                      style: TextStyle(
                                        color: controller.isDarkMode.value
                                            ? kWhiteColor
                                            : kDarkCardColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .8,
                                    child: DefaultTextField(
                                      hintText: 'Address',
                                      labelText: 'Please Enter Agency Address',
                                      isPassword: false,
                                      textEditingController: agencyController
                                          .agencyAddressController,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          //TODO: Replace with list of categories and sub categories respectively
                          Container(
                            width: width * .8,
                            height: height * .5,
                            decoration: BoxDecoration(
                              color: kCardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.0, left: 20.0),
                                  child: Text('Property Type'),
                                ),
                                SizedBox(
                                  height: height * .02,
                                ),
                                SizedBox(
                                  width: width * .5,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Wrap(
                                      spacing: width * .005,
                                      runSpacing: width * .01,
                                      children: List.generate(
                                        categoryController.category.length,
                                        (index) {
                                          return InputChip(
                                            backgroundColor: isSelected(index,
                                                    indexs, agencyCategory)
                                                ? Theme.of(context).primaryColor
                                                : const Color(0xFF3E5561),
                                            avatar: isSelected(index, indexs,
                                                    agencyCategory)
                                                ? const Icon(
                                                    Icons.check_box_rounded,
                                                    size: 20,
                                                  )
                                                : const Icon(Icons.add),
                                            label: Text(
                                              categoryController
                                                  .category[index].name!,
                                              style: isSelected(index, indexs,
                                                      agencyCategory)
                                                  ? const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)
                                                  : TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          Colors.blueGrey[100],
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            onSelected: (bool value) {
                                              selectedIndex.value = index;
                                              (indexs.contains(index)
                                                  ? indexs.remove(index)
                                                  : indexs.add(index));
                                              (agencyCategory.contains(
                                                      categoryController
                                                          .category[index].name)
                                                  ? agencyCategory.remove(
                                                      categoryController
                                                          .category[index]
                                                          .name!)
                                                  : agencyCategory.add(
                                                      categoryController
                                                          .category[index]
                                                          .name!));
                                              debugPrint('$agencyCategory');
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * .04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Status",
                                style: TextStyle(
                                  color: controller.isDarkMode.value
                                      ? kWhiteColor
                                      : kDarkCardColor,
                                ),
                              ),
                              SizedBox(
                                width: width * .01,
                              ),
                              CupertinoSwitch(
                                activeColor: kPrimaryColor,
                                value: statusValue.value,
                                onChanged: (value) {
                                  statusValue.value = value;
                                },
                                trackColor: controller.isDarkMode.value
                                    ? kWhiteColor
                                    : kDarkCardColor,
                              ),
                              SizedBox(
                                width: width * .08,
                              ),
                              agencyController.singleAgencies.value.id == null
                                  ? DefaultButton(
                                      primaryColor: kPrimaryColor,
                                      hoverColor: kPrimaryColor,
                                      buttonText: 'Create',
                                      onPressed: () async {
                                        if (agencyController.sell.value ==
                                            true) {
                                          purpose.add('sell');
                                        }
                                        if (agencyController.rent.value ==
                                            true) {
                                          purpose.add('rent');
                                        }
                                        if (purpose.isNotEmpty) {
                                          purposeList.value =
                                              jsonEncode(purpose);
                                        }
                                        if (agencyCategory.isNotEmpty) {
                                          categoryList.value =
                                              jsonEncode(agencyCategory);
                                        }
                                        var description = agencyController
                                            .htmlEditorController
                                            .getText();
                                        Get.defaultDialog(
                                          barrierDismissible: false,
                                          title: 'Creating Agency',
                                          content: const Center(
                                            child: CircularProgressIndicator(
                                                color: kPrimaryColor),
                                          ),
                                        );
                                        await authController
                                            .registerUser(
                                                agencyController
                                                    .agencyEmailController.text,
                                                agencyController
                                                    .agencyPasswordController
                                                    .text,
                                                'AGENCY')
                                            .then(
                                          (value) {
                                            if (value) {
                                              agencyController
                                                  .create(
                                                      agencyController
                                                          .agencyNameController
                                                          .text,
                                                      agencyController
                                                          .agencyOwnerNameController
                                                          .text,
                                                      description.toString(),
                                                      agencyController
                                                          .logo.value,
                                                      agencyController
                                                          .banner.value,
                                                      agencyController
                                                          .agencyEmailController
                                                          .text,
                                                      agencyController
                                                          .agencyPhoneController
                                                          .text,
                                                      agencyController
                                                          .agencyAddressController
                                                          .text,
                                                      agencyController
                                                          .country.value,
                                                      agencyController
                                                          .state.value,
                                                      agencyController
                                                          .city.value,
                                                      purposeList.value,
                                                      categoryList.value,
                                                      authController
                                                          .userModel.value.id!,
                                                      agencyController
                                                              .agencyNameController
                                                              .text +
                                                          agencyController
                                                              .agencyOwnerNameController
                                                              .text,
                                                      statusValue.value)
                                                  .then(
                                                (value) {
                                                  if (value) {
                                                    Get.back();
                                                  }
                                                },
                                              );
                                            }
                                          },
                                        );
                                        Navigator.pop(context);
                                      },
                                      width: width * .2,
                                      height: height * 0.04,
                                    )
                                  : DefaultButton(
                                      primaryColor: kPrimaryColor,
                                      hoverColor: kPrimaryColor,
                                      buttonText: 'Update',
                                      onPressed: () async {
                                        if (agencyController.sell.value ==
                                            true) {
                                          purpose.add('sell');
                                        }
                                        if (agencyController.rent.value ==
                                            true) {
                                          purpose.add('rent');
                                        }
                                        if (purpose.isNotEmpty) {
                                          purposeList.value =
                                              jsonEncode(purpose);
                                        }
                                        if (agencyCategory.isNotEmpty) {
                                          categoryList.value =
                                              jsonEncode(agencyCategory);
                                        }
                                        var description = agencyController
                                            .htmlEditorController
                                            .getText();
                                        Get.defaultDialog(
                                          barrierDismissible: false,
                                          title: 'Updating Agency',
                                          content: const Center(
                                            child: CircularProgressIndicator(
                                                color: kPrimaryColor),
                                          ),
                                        );
                                        // await authController
                                        //     .registerUser(
                                        //         agencyController
                                        //             .agencyEmailController.text,
                                        //         agencyController
                                        //             .agencyPasswordController.text,
                                        //         'AGENCY')
                                        //     .then(
                                        //   (value) {
                                        //     if (value) {

                                        //     }
                                        //   },
                                        // );
                                        agencyController
                                            .updateAgency(
                                                agencyController
                                                    .singleAgencies.value.id!,
                                                agencyController
                                                    .agencyNameController.text,
                                                agencyController
                                                    .agencyOwnerNameController
                                                    .text,
                                                agencyController
                                                    .agencyOwnerNameController
                                                    .text,
                                                agencyController
                                                    .agencyOwnerNameController
                                                    .text,
                                                agencyController.logo.value,
                                                agencyController
                                                    .agencyOwnerNameController
                                                    .text,
                                                agencyController.country.value,
                                                agencyController
                                                    .agencyEmailController.text,
                                                agencyController
                                                    .agencyPhoneController.text,
                                                agencyController
                                                    .agencyAddressController
                                                    .text,
                                                description.toString(),
                                                agencyController
                                                    .agencyPhoneController.text,
                                                agencyController
                                                    .agencyPhoneController.text,
                                                agencyController
                                                    .agencyPhoneController.text,
                                                userId.value,
                                                agencyController.logo.value,
                                                agencyController.banner.value,
                                                agencyController.singleAgencies
                                                    .value.slugId!
                                                    .toString())
                                            .then(
                                          (value) {
                                            if (value) {
                                              Get.back();
                                              Navigator.pop(context);
                                            }
                                          },
                                        );
                                      },
                                      width: width * .2,
                                      height: height * 0.04,
                                    ),
                            ],
                          ),
                          SizedBox(
                            height: height * .06,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}