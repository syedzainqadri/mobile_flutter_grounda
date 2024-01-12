// ignore_for_file: must_be_immutable

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:mobile_flutter_grounda/app/controllers/themeController/theme_change_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/default_button.dart';
import 'package:mobile_flutter_grounda/app/widgets/text_fields.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';

class ProjectForm extends GetView<ThemeChangeController> {
  ProjectForm(
      {required this.projectTitleController,
      required this.projectAddressController,
      required this.projectLocalityController,
      required this.categoryDropDownList,
      required this.categoryDropDownValue,
      required this.categoryOnChange,
      required this.developerDropDownValue,
      required this.developerOnChange,
      required this.developerDropDownList,
      required this.statusChanges,
      required this.formSubmit,
      required this.statusValue,
      required this.uploadImages,
      required this.buttonText,
      required this.pictureButtonText,
      required this.cancelText,
      required this.onTap,
      required this.cityController,
      required this.areaController,
      required this.startingPriceController,
      required this.endingPriceController,
      required this.descriptionController,
      required this.walkThroughController,
      required this.images,
      // validation
      required this.projectTitleValidator,
      required this.cityValidator,
      required this.areaValidator,
      required this.startingPriceValidator,
      required this.endingPriceValidator,
      required this.walkThroughFieldSubmitted,

      // focus node
      required this.titleFieldSubmitted,
      required this.titleFocus,
      required this.projectAddressFocus,
      required this.projectLocalityFocus,
      required this.cityFocus,
      required this.cityFieldSubmitted,
      required this.walkThroughFocus,
      required this.walkThroughValidator,
      required this.projectNearByPlaces,
      required this.selectedProjectNearByPlaces,
      super.key});
  double width = Get.width;
  double height = Get.height;

  String categoryDropDownValue;
  dynamic categoryOnChange;
  List<DropdownMenuItem<String>> categoryDropDownList;

  String developerDropDownValue;
  dynamic developerOnChange;
  List<DropdownMenuItem<String>> developerDropDownList;

  dynamic statusChanges;
  dynamic formSubmit;
  dynamic uploadImages;
  dynamic onTap;
  dynamic projectTitleValidator;
  dynamic projectAddressValidator;
  dynamic cityValidator;
  dynamic areaValidator;
  dynamic propertyAreaValidator;

  dynamic plotNumberValidator;
  dynamic bathroomValidator;
  dynamic bedroomValidator;
  dynamic noOfInstallmentValidator;
  dynamic monthlyInstallmentValidator;
  dynamic advanceValidator;
  dynamic endingPriceValidator;
  dynamic walkThroughValidator;

  bool statusValue;

  String buttonText;
  String pictureButtonText;
  String cancelText;

  dynamic propertyAreaUnitOnChange;
  dynamic startingPriceValidator;
  dynamic titleFieldSubmitted;
  dynamic projectAddressFieldSubmitted;
  dynamic cityFieldSubmitted;
  dynamic walkThroughFieldSubmitted;

  TextEditingController projectTitleController;
  TextEditingController projectLocalityController;
  TextEditingController projectAddressController;
  TextEditingController walkThroughController;
  TextEditingController cityController;
  TextEditingController areaController;
  TextEditingController startingPriceController;
  TextEditingController endingPriceController;
  TextEditingController descriptionController;

  Widget images;
  Widget projectNearByPlaces;
  Widget? selectedProjectNearByPlaces;

  FocusNode titleFocus;
  FocusNode projectLocalityFocus;
  FocusNode projectAddressFocus;
  FocusNode cityFocus;
  FocusNode walkThroughFocus;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create Project",
              style: TextStyle(color: kDarkCardColor),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              textEditingController: projectTitleController,
              focusNode: titleFocus,
              onFieldSubmitted: titleFieldSubmitted,
              hintText: "Enter Project Title",
              labelText: "Project Title",
              isPassword: false,
              validator: projectTitleValidator,
              maxLength: 200,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              textEditingController: projectLocalityController,
              focusNode: projectLocalityFocus,
              onFieldSubmitted: titleFieldSubmitted,
              hintText: "Project Locality",
              labelText: "Project Locality",
              isPassword: false,
              validator: projectAddressValidator,
              maxLength: 200,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              focusNode: projectAddressFocus,
              onFieldSubmitted: projectAddressFieldSubmitted,
              hintText: "Project Address",
              labelText: "Project Address",
              isPassword: false,
              textEditingController: projectAddressController,
              validator: projectTitleValidator,
              maxLength: 200,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Column(
              children: [
                DefaultTextField(
                  focusNode: cityFocus,
                  onFieldSubmitted: cityFieldSubmitted,
                  hintText: "Enter City",
                  labelText: "City",
                  isPassword: false,
                  textEditingController: cityController,
                  validator: cityValidator,
                  maxLength: 25,
                ),
                SizedBox(
                  height: height * 0.012,
                ),
                // property type / Price / currency
                DefaultTextField(
                  hintText: "Enter Area",
                  labelText: "Area",
                  isPassword: false,
                  textEditingController: areaController,
                  validator: areaValidator,
                  maxLength: 50,
                ),
                SizedBox(
                  height: height * 0.012,
                ),
                // property type / Price / currency
                DefaultTextField(
                  hintText: "Starting Price",
                  labelText: "Starting Price",
                  isPassword: false,
                  textEditingController: startingPriceController,
                  validator: startingPriceValidator,
                  maxLength: 25,
                ),
                SizedBox(
                  height: height * 0.012,
                ),
                DefaultTextField(
                  hintText: "Ending Price",
                  labelText: "Ending Price",
                  isPassword: false,
                  textEditingController: endingPriceController,
                  validator: endingPriceValidator,
                  maxLength: 25,
                ),
              ],
            ),

            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Description",
              labelText: "Description",
              isPassword: false,
              textEditingController: descriptionController,
              validator: projectTitleValidator,
              maxLength: 25,
            ),

            SizedBox(
              height: height * 0.02,
            ),

            // Gallery Heading and button
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Gallery",
                  style: TextStyle(color: kDarkCardColor),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.015,
            ),
            // gallery preview
            Row(
              children: [
                SizedBox(
                  width: width * .15,
                  height: height * .14,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: InkWell(
                      onTap: uploadImages,
                      child: Container(
                        alignment: Alignment.center,
                        color: controller.isDarkMode.value
                            ? kDarkCardColor
                            : kCardColor,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.add_a_photo),
                        ),
                      ),
                    ),
                  ),
                ),
                images
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            DefaultTextField(
              focusNode: walkThroughFocus,
              onFieldSubmitted: walkThroughFieldSubmitted,
              hintText: "Enter Walk Through Video Url",
              labelText: "Walk Through Video",
              isPassword: false,
              textEditingController: walkThroughController,
              validator: walkThroughValidator,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Project Type",
                        style: TextStyle(color: kDarkCardColor),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: controller.isDarkMode.value
                              ? kDarkFillColor
                              : kFillColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButton(
                            style: TextStyle(
                              color: controller.isDarkMode.value
                                  ? kWhiteColor
                                  : kDarkCardColor,
                            ),
                            iconDisabledColor: controller.isDarkMode.value
                                ? kWhiteColor
                                : kDarkCardColor,
                            iconEnabledColor: controller.isDarkMode.value
                                ? kWhiteColor
                                : kDarkCardColor,
                            borderRadius: BorderRadius.circular(15),
                            hint: const Text("Select Project Type"),
                            isExpanded: true,
                            value: categoryDropDownValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: categoryOnChange,
                            items: categoryDropDownList,
                            dropdownColor: controller.isDarkMode.value
                                ? kTextColor
                                : kDarkTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Project Developer",
                        style: TextStyle(color: kDarkCardColor),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: controller.isDarkMode.value
                              ? kDarkFillColor
                              : kFillColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: DropdownButton(
                            dropdownColor: controller.isDarkMode.value
                                ? kTextColor
                                : kDarkTextColor,
                            iconDisabledColor: controller.isDarkMode.value
                                ? kDarkBgColor
                                : kBgColor,
                            iconEnabledColor: controller.isDarkMode.value
                                ? kDarkBgColor
                                : kBgColor,
                            style: TextStyle(
                              color: controller.isDarkMode.value
                                  ? kDarkTextColor
                                  : kTextColor,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            hint: const Text("Select Project's Developer"),
                            isExpanded: true,
                            value: developerDropDownValue,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: developerOnChange,
                            items: developerDropDownList,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    selectedProjectNearByPlaces!,
                    const Text(
                      'Select Amenities',
                      style: TextStyle(color: kDarkCardColor),
                    ),
                    Container(
                      color: kBgColor,
                      height: height * 0.28,
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: projectNearByPlaces,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //amenities and other fields
            SizedBox(
              height: height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 0.0),
              child: Transform.scale(
                scale: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                              color: controller.isDarkMode.value
                                  ? kWhiteColor
                                  : kDarkCardColor),
                        ),
                        SizedBox(
                          width: width * .01,
                        ),
                        CupertinoSwitch(
                          activeColor: kPrimaryColor,
                          value: statusValue,
                          onChanged: statusChanges,
                          trackColor: controller.isDarkMode.value
                              ? kWhiteColor
                              : kDarkCardColor,
                        ),
                      ],
                    ),
                    DefaultButton(
                      primaryColor: kPrimaryColor,
                      hoverColor: kDarkCardColor,
                      buttonText: buttonText,
                      width: width * .2,
                      height: height * .05,
                      onPressed: formSubmit,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Center(
              child: InkWell(
                onTap: onTap,
                child: Text(
                  cancelText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );
}
