// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/projectController/project_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_elevated_button.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';

class ProjectScreen extends GetView<ProjectController> {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Obx(
      () => SafeArea(
        child: Scaffold(
          backgroundColor: kWhite,
          bottomNavigationBar: CommonElevatedButton(
            text: 'Create Project',
            buttonColor: kPrimaryColor,
            borderRadius: 0,
            onPressed: () => Get.toNamed('/project/create-screen'),
          ),
          appBar: AppBar(
            title: const Text('Projects'),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * .9,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.project.length,
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
                                              controller.project[index]
                                                  .featuredImage!),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.project[index].title!,
                                              style: const TextStyle(
                                                color: kDarkCardColor,
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
                                                    color: kDarkCardColor,
                                                  ),
                                                ),
                                                controller.project[index]
                                                            .status ==
                                                        true
                                                    ? Text(
                                                        "Active",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                color: Colors
                                                                    .green),
                                                      )
                                                    : Text(
                                                        'UnPublished',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                                color:
                                                                    Colors.red),
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
                                          await controller.getbyId(
                                            controller.project[index].id
                                                .toString(),
                                          );
                                          Get.toNamed('/project/create-screen');
                                        },
                                        icon: SvgPicture.asset(
                                          "assets/icons/edit.svg",
                                          color: kDarkCardColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          debugPrint('project deleted pressed');
                                          debugPrint(controller
                                              .project[index].id!
                                              .toString());

                                          await controller.delete(
                                            controller.project[index].id!
                                                .toString(),
                                          );
                                        },
                                        icon: SvgPicture.asset(
                                          "assets/icons/trash.svg",
                                          color: kDarkCardColor,
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
              ],
            ).paddingSymmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }
}
