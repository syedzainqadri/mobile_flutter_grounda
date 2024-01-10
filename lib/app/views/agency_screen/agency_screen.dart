// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/agencyController/agency_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_elevated_button.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';

class AgencyScreen extends GetView<AgencyController> {
  AgencyScreen({Key? key}) : super(key: key);
  TextEditingController agencySearchController = TextEditingController();
  // AgencyController agencyController = Get.find<AgencyController>();
  var selectedItemId = 0.obs;
  var isPublished = false.obs;
  var hasInstallments = false.obs;
  var posessionReady = false.obs;
  var catId = ''.obs;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Obx(
      () => SafeArea(
        child: Scaffold(
          bottomNavigationBar: CommonElevatedButton(
            text: 'Create Agency',
            buttonColor: kPrimaryColor,
            borderRadius: 0,
            onPressed: () => Get.toNamed('/agency/create-screen'),
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Agencies'),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: SizedBox(
            height: height,
            width: width,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.agencies.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: kWhite,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: width * .1,
                                  height: height * .1,
                                  child: CircleAvatar(
                                    backgroundColor: kWhiteColor,
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        controller.agencies[index].logoImage!),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.agencies[index].title!,
                                        style: const TextStyle(
                                          color: kDarkBgColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Status: ",
                                            style: TextStyle(
                                              color: kDarkBgColor,
                                            ),
                                          ),
                                          controller.agencies[index].status ==
                                                  true
                                              ? Text(
                                                  "Active",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.green),
                                                )
                                              : Text(
                                                  'UnPublished',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Colors.red),
                                                ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    //Todo: please add edit function
                                    Get.toNamed('/agency/create-screen');
                                    controller.getbyId(
                                      controller.agencies[index].id.toString(),
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/icons/edit.svg",
                                    color: kDarkBgColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  onPressed: () async {
                                    controller.delete(
                                      controller.agencies[index].id.toString(),
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/icons/trash.svg",
                                    color: kDarkBgColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ).paddingSymmetric(horizontal: 10),
        ),
      ),
    );
  }
}
