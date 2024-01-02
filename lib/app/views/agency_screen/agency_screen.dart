// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/agencyController/agency_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/themeController/theme_change_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_elevated_button.dart';
import 'package:mobile_flutter_grounda/app/widgets/default_button.dart';
import 'package:mobile_flutter_grounda/app/widgets/text_fields.dart';
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
    const bool isMobile = false;
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
          ),
          body: SizedBox(
            height: height,
            width: width,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.agencies.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: kPrimaryColor,
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: SvgPicture.asset(
                                        'assets/images/logo.svg',
                                        fit: BoxFit.cover,
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
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
                                          color: kWhiteColor,
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
                                              color: kWhiteColor,
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
                                    Get.toNamed('/agency/create');
                                    controller.getbyId(
                                      controller.agencies[index].id.toString(),
                                    );
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/icons/edit.svg",
                                    color: kWhiteColor,
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
                                    color: kWhiteColor,
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
          ),
        ),
      ),
    );
  }
}
