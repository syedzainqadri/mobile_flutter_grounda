// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/categoryController/category_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/developerController/developer_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/profileController/profile_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/projectController/projectNearByPlaces_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/projectController/project_controller.dart';
import 'package:mobile_flutter_grounda/app/views/project_screen/widgets/project_form.dart';
import 'package:mobile_flutter_grounda/app/widgets/icon_from_api.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_methods.dart';
import '../../../../utils/global_variable.dart';

class ProjectCreateScreen extends GetView<ProjectController> {
  ProjectCreateScreen({Key? key}) : super(key: key);

  //<=============== Data Controllers ========================>
  CategoryController categoryController = Get.find<CategoryController>();

  ProfileController profileController = Get.find<ProfileController>();

  ProjectNearByPlacesController projectNearByPlacesController =
      Get.find<ProjectNearByPlacesController>();

  //<=============== Text Editor Controllers ========================>

  final TextEditingController projectCategoryController =
      TextEditingController();
  final TextEditingController searchCategory = TextEditingController();

  // TextEditingController postTitleController = TextEditingController();
  final _createPostFormKey = GlobalKey<FormState>();

  var selectedItemId = 0.obs;

  var categorySelectedItemId = 0.obs;
  List<dynamic> projectNearByPlaces = [false].obs;

  DeveloperController developerController = Get.find<DeveloperController>();

  // getx argument
  final int? id = Get.arguments;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Obx(
      () => SafeArea(
        child: Scaffold(
          backgroundColor: kWhite,
          appBar: AppBar(
            title: const Text('Create Project'),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: Container(
              color: kCardColor,
              height: height * .8,
              child: Focus(
                focusNode: controller.formFocus,
                child: Form(
                  key: _createPostFormKey,
                  // form
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ProjectForm(
                      // text
                      buttonText:
                          controller.projectID == 0 ? "Submit" : "Update",
                      // focus nods
                      projectLocalityFocus: controller.projectLocalityFocus,
                      projectAddressFocus: controller.projectAddressFocus,
                      cityFocus: controller.cityFieldFocus,

                      // controllers
                      projectTitleController: controller.projectTitleController,
                      projectAddressController:
                          controller.projectAddressController,
                      projectLocalityController:
                          controller.projectLocalityController,
                      titleFocus: controller.titleFieldFocus,
                      cityController: controller.cityController,
                      areaController: controller.areaController,
                      startingPriceController:
                          controller.startingPriceController,
                      endingPriceController: controller.endingPriceController,
                      descriptionController: controller.descriptionController,

                      // validations
                      titleFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(controller.cityFieldFocus);
                      },
                      projectTitleValidator: (value) {
                        if (value == null || value == '') {
                          return 'Project title cannot be empty';
                        }
                      },

                      // status change
                      statusChanges: (value) {
                        controller.statusValue.value = value;
                      },
                      statusValue: controller.statusValue.value,

                      //<============! City Fild ==========>
                      cityFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(controller.cityFieldFocus);
                      },
                      cityValidator: (value) {
                        if (value == null || value == '' || value == int) {
                          return 'City cannot be empty nor it can have numbers or special characters';
                        }
                      },
                      //<============! Area Fild ==========>

                      areaValidator: (value) {
                        if (value == null || value == '') {
                          return 'Area cannot be empty ';
                        }
                      },
                      //<============! Price Fild ==========>

                      startingPriceValidator: (value) {
                        if (value == null || value == '') {
                          return 'Price cannot be empty';
                        }
                      },
                      endingPriceValidator: (value) {
                        if (value == null || value == '') {
                          return 'Price cannot be empty';
                        }
                      },
                      //<============! Text Editor ==========>

                      //Galary segment
                      pictureButtonText:
                          categoryController.imageUrl.value.isEmpty
                              ? 'Add Picture'
                              : 'Update Picture',
                      uploadImages: () async {
                        Get.defaultDialog(
                          title: 'Uploading Image',
                          content: const Center(
                            child:
                                CircularProgressIndicator(color: kPrimaryColor),
                          ),
                          barrierDismissible: false,
                        );
                        await controller.getImage();
                        Navigator.pop(context);
                      },

                      images: controller.imageUrl.isEmpty
                          ? const Text(
                              'Please add Images',
                              style: TextStyle(color: kDarkCardColor),
                            )
                          : SizedBox(
                              height: height * 0.14,
                              width: width * .6,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 20,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.imageUrl.length,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      SizedBox(
                                        width: width * .2,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          child: Image.network(
                                            controller.imageUrl[index],
                                            width: width * .1,
                                            height: height * .14,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          right: -10,
                                          top: -5,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.cancel,
                                              color: kRedColor,
                                            ),
                                            onPressed: () {
                                              controller.imageUrl
                                                  .removeAt(index);
                                            },
                                          ))
                                    ],
                                  );
                                },
                              ),
                            ),

                      walkThroughController: controller.walkThroughController,
                      walkThroughFocus: controller.walkThroughFocus,
                      walkThroughValidator: (value) {
                        if (value == null || value != 'https://') {
                          return 'Please Enter a valid Url';
                        }
                      },
                      walkThroughFieldSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(controller.walkThroughFocus);
                      },

                      categoryDropDownList: categoryController.category
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value.name,
                          child: Text(value.name!),
                        );
                      }).toList(),

                      categoryDropDownValue:
                          categoryController.selectedItemName.value,
                      categoryOnChange: (selectedValue) async {
                        categoryController.selectedItemName.value =
                            selectedValue;
                        for (int i = 0;
                            i < categoryController.category.length;
                            i++) {
                          if (categoryController.selectedItemName ==
                              categoryController.category[i].name) {
                            categorySelectedItemId.value =
                                categoryController.category[i].id!;
                          }
                        }
                      },

                      // developer
                      developerDropDownList: developerController.developers
                          .map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                          value: value.title,
                          child: Text(value.title!),
                        );
                      }).toList(),

                      developerDropDownValue:
                          developerController.selectedItemName.value,
                      developerOnChange: (selectedValue) async {
                        developerController.selectedItemName.value =
                            selectedValue;
                        for (int i = 0;
                            i < developerController.developers.length;
                            i++) {
                          if (developerController.selectedItemName ==
                              developerController.developers[i].title) {
                            selectedItemId.value =
                                developerController.developers[i].id!;
                          }
                        }
                      },
                      //select project near by places
                      selectedProjectNearByPlaces:
                          controller.projectID.value != 0
                              ? SizedBox(
                                  width: width * .2,
                                  height: 50,
                                  child: ListView.builder(
                                      reverse: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller
                                          .selectedProjectNearByPlacesCodes
                                          .length,
                                      itemBuilder: (context, index) {
                                        var names = controller
                                            .selectedProjectNearByPlacesNames;
                                        var code = controller
                                            .selectedProjectNearByPlacesCodes;
                                        return Stack(children: [
                                          Icon(
                                            IconData(
                                              int.parse(code[index]),
                                              fontFamily: iconFontFamily.value,
                                            ),
                                            size: 30,
                                          ),
                                          Positioned(
                                              top: -10,
                                              left: 0,
                                              child: IconButton(
                                                  onPressed: () {
                                                    names.remove(names[index]);
                                                    controller
                                                        .projectNearByPlacesNames
                                                        .remove(names[index]);
                                                    code.remove(code[index]);
                                                    controller
                                                        .projectNearByPlacesCodes
                                                        .remove(code[index]);
                                                  },
                                                  icon: const Icon(
                                                    Icons.cancel,
                                                    color: kRedColor,
                                                    size: 15,
                                                  ))),
                                        ]);
                                      }),
                                )
                              : const Offstage(),
                      projectNearByPlaces: ListView.builder(
                          //TODO: we need to chaneg this controller here
                          itemCount: projectNearByPlacesController
                              .projectNearByPlace.length,
                          itemBuilder: (context, index) {
                            projectNearByPlaces.add(false);
                            return Obx(
                              () => CheckboxListTile(
                                selectedTileColor: kPrimaryColor,
                                tileColor: kWhiteColor,
                                checkColor: kDarkCardColor,
                                activeColor: kPrimaryColor,
                                value: projectNearByPlaces[index],
                                onChanged: (value) {
                                  projectNearByPlaces[index] =
                                      !projectNearByPlaces[index];
                                  //TODO: build amenities local lists
                                  if (controller.projectID.value != 0) {
                                    print(controller.projectID);
                                    if (projectNearByPlaces[index]) {
                                      controller.projectNearByPlacesNames.add(
                                          projectNearByPlacesController
                                              .projectNearByPlace[index].name);
                                      controller.projectNearByPlacesCodes.add(
                                          projectNearByPlacesController
                                              .projectNearByPlace[index].icon);
                                    } else {
                                      controller.projectNearByPlacesNames
                                          .remove(projectNearByPlacesController
                                              .projectNearByPlace[index].name);
                                      controller.projectNearByPlacesCodes
                                          .remove(projectNearByPlacesController
                                              .projectNearByPlace[index].icon);
                                    }
                                  } else {
                                    print('This is working');
                                    if (projectNearByPlaces[index]) {
                                      controller
                                          .selectedProjectNearByPlacesNames
                                          .add(projectNearByPlacesController
                                              .projectNearByPlace[index].name);
                                      controller
                                          .selectedProjectNearByPlacesCodes
                                          .add(projectNearByPlacesController
                                              .projectNearByPlace[index].icon);
                                    } else {
                                      controller
                                          .selectedProjectNearByPlacesNames
                                          .remove(projectNearByPlacesController
                                              .projectNearByPlace[index].name);
                                      controller
                                          .selectedProjectNearByPlacesCodes
                                          .remove(projectNearByPlacesController
                                              .projectNearByPlace[index].icon);
                                    }
                                  }
                                  print(controller
                                      .selectedProjectNearByPlacesNames);
                                },
                                title: Row(
                                  children: [
                                    IconFromApi(
                                      icon: projectNearByPlacesController
                                          .projectNearByPlace[index].icon!,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      projectNearByPlacesController
                                          .projectNearByPlace[index].name!,
                                      style: const TextStyle(
                                        color: kDarkCardColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),

                      //submit button
                      formSubmit: () async {
                        if (controller.projectID == 0) {
                          debugPrint(
                              "<======= The Project post is being submited =========>");

                          var description =
                              controller.descriptionController.text;
                          var imageList = jsonEncode(controller.imageUrl);
                          controller.startingPrice.value =
                              controller.startingPriceController.text;
                          controller.endingPrice.value =
                              controller.endingPriceController.text;
                          var projectNearByPlaceNames = jsonEncode(
                              controller.selectedProjectNearByPlacesNames);
                          var projectNearByPlaceCodes = jsonEncode(
                              controller.selectedProjectNearByPlacesCodes);
                          debugPrint(imageList);

                          if (description.isNotEmpty) {
                            if (controller.imageUrl.isNotEmpty) {
                              Get.defaultDialog(
                                barrierDismissible: false,
                                title: 'Submiting Project',
                                content: const Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor),
                                ),
                              );
                              await controller.create(
                                controller.projectTitleController.text,
                                controller.projectAddressController.text,
                                description,
                                controller.imageUrl.first,
                                imageList,
                                controller.projectLocalityController.text,
                                controller.cityController.text,
                                controller.areaController.text,
                                categorySelectedItemId.value,
                                selectedItemId.value,
                                controller.startingPrice.value,
                                controller.endingPrice.value,
                                controller.statusValue.value,
                                controller.walkThroughController.text,
                                projectNearByPlaceNames,
                                projectNearByPlaceCodes,
                              );
                              Navigator.pop(context);
                              Get.toNamed('/project-screen');
                            } else {
                              showErrorSnak('No Image Selected',
                                  'Images Must not be Empty');
                            }
                          } else {
                            showErrorSnak('Description is Empty',
                                'Description Can Not be empty');
                          }
                        } else {
                          debugPrint("============= Updating started=======");

                          var description =
                              controller.descriptionController.text;
                          var imageList = jsonEncode(controller.imageUrl);
                          controller.startingPrice.value =
                              controller.startingPriceController.text;
                          controller.endingPrice.value =
                              controller.endingPriceController.text;
                          var projectNearByPlaceNames =
                              jsonEncode(controller.projectNearByPlacesNames);
                          var projectNearByPlaceCodes =
                              jsonEncode(controller.projectNearByPlacesCodes);
                          debugPrint('${controller.startingPrice}');
                          debugPrint('${controller.endingPrice}');

                          if (description.isNotEmpty) {
                            debugPrint(description);
                            if (controller.imageUrl.isNotEmpty) {
                              debugPrint('${controller.imageUrl}');

                              Get.defaultDialog(
                                barrierDismissible: false,
                                title: 'Updating Project',
                                content: const Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor),
                                ),
                              );
                              debugPrint("============= Updating =======");
                              await controller.updateProject(
                                  controller.projectID.value,
                                  controller.projectTitleController.text,
                                  controller.descriptionController.text,
                                  controller.imageUrl.first,
                                  imageList,
                                  controller.projectLocalityController.text,
                                  controller.cityController.text,
                                  controller.areaController.text,
                                  description,
                                  controller.catID.value,
                                  controller.developerID.value,
                                  controller.startingPrice.value,
                                  controller.endingPrice.value,
                                  controller.statusValue.value,
                                  controller.walkThroughController.text,
                                  projectNearByPlaceNames,
                                  projectNearByPlaceCodes);
                              Navigator.pop(context);
                              controller.getAll();
                              Get.toNamed('/project-screen');
                              // }
                              // } else {
                              //   showErrorSnak('Amenities are empty',
                              //       'Please Select Amenities');
                              // }
                            } else {
                              showErrorSnak('No Image Selected',
                                  'Images Must not be Empty');
                            }
                          } else {
                            showErrorSnak('Description is Empty',
                                'Description Can Not be empty');
                          }
                        }
                      },
                      cancelText: controller.projectID.value == ''
                          ? ''
                          : 'Cancel Update',
                      onTap: () async {
                        // categoryNameController.text = '';
                        // postShortDescriptionController.text = '';
                        // contentController.clear();
                        // selectedItemId.value = 0;
                        // catId.value = '';
                        // await categoryController.getCategories();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
