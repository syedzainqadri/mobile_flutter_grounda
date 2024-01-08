import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/packageController/package_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_elevated_button.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class BuyPackageScreen extends GetView<PackageController> {
  const BuyPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            controller.resetValues();
            return true;
          },
          child: Scaffold(
            bottomNavigationBar: Container(
              height: height * 0.16,
              width: width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: kPrimaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price: Rs.${controller.totalPrice.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Total Packages: ${controller.totalItems.value}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 50).paddingOnly(top: 10),
                  Text(
                    'Total Ads: ${controller.totalAds.value}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  CommonElevatedButton(
                    text: 'Proceed to Pay',
                    textColor: Colors.black,
                    buttonColor: Colors.white,
                    width: width * .9,
                    height: height * 0.055,
                    onPressed: () {
                      if (controller.totalItems.value == 0 ||
                          controller.totalAds.value == 0 ||
                          controller.totalPrice.value == 0.0) {
                        Get.snackbar(
                          'Error',
                          'Please select atleast one package',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.white,
                          colorText: Colors.black,
                        );
                        return;
                      } else {
                        Get.toNamed(
                          '/package/payment-screen',
                          arguments: {
                            'totalPrice': controller.totalPrice.value,
                            'totalItems': controller.totalItems.value,
                            'totalAds': controller.totalAds.value,
                          },
                        );
                      }
                    },
                    elevation: 0,
                  ).paddingOnly(bottom: 5)
                ],
              ),
            ),
            appBar: AppBar(
              title: const Text('Buy Package'),
              backgroundColor: Colors.white,
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: height * 0.15,
                  width: width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kPrimaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Discounts On Bundles',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Buy a package to post more ads',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ).paddingAll(20),
                      const FaIcon(FontAwesomeIcons.tags)
                    ],
                  ),
                ).paddingAll(10),
                const Text(
                  'Post Ads Valid for 30 days and get featured for 7 days',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.2,
                  width: width,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Container(
                          // add shadow
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          height: height * 0.3,
                          width: width * 0.35,
                          margin: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${index + 1} ads',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Rs.${(index + 1) * 100}',
                                      style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ).paddingOnly(top: 10),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(
                                    value: controller.checkboxStates1[index],
                                    activeColor: Colors.black,
                                    onChanged: (value) {
                                      controller.handleCheckboxChange1(
                                          value!, index);
                                    },
                                  ),
                                  Container(
                                    // add shadow
                                    height: height * 0.03,
                                    width: width * 0.13,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.25),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        // '-${index * 10}%',
                                        '-${0}%',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ).paddingOnly(right: 8),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Text(
                  'Post Ads Valid for 30 days and get featured for 14 days',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.2,
                  width: width,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Container(
                          // add shadow
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          height: height * 0.3,
                          width: width * 0.35,
                          margin: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${index + 1} ads',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Rs.${(index + 1) * 500}',
                                      style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ).paddingOnly(top: 10),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(
                                    value: controller.checkboxStates2[index],
                                    activeColor: Colors.black,
                                    onChanged: (value) {
                                      controller.handleCheckboxChange2(
                                          value!, index);
                                    },
                                  ),
                                  Container(
                                    // add shadow
                                    height: height * 0.03,
                                    width: width * 0.13,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.25),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        // '-${index * 10}%',
                                        '-${0}%',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ).paddingOnly(right: 8),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Text(
                  'Post Ads Valid for 30 days and get featured for 30 days',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.2,
                  width: width,
                  child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Container(
                          // add shadow
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset: const Offset(0, 0),
                              ),
                            ],
                          ),
                          height: height * 0.3,
                          width: width * 0.35,
                          margin: const EdgeInsets.all(10),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${index + 1} ads',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'Rs.${(index + 1) * 1000}',
                                      style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ).paddingOnly(top: 10),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Checkbox(
                                    value: controller.checkboxStates3[index],
                                    activeColor: Colors.black,
                                    onChanged: (value) {
                                      controller.handleCheckboxChange3(
                                          value!, index);
                                    },
                                  ),
                                  Container(
                                    // add shadow
                                    height: height * 0.03,
                                    width: width * 0.13,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.25),
                                          spreadRadius: 1,
                                          blurRadius: 8,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        // '-${index * 10}%',
                                        '-${0}%',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ).paddingOnly(right: 8),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
