import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/postController/post_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_text_widget.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class HomeScreen extends GetView<PostController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: kPrimaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => SizedBox(
                  height: height,
                  child: controller.isAllLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ))
                      : controller.post.isEmpty
                          ? const Center(
                              child: CommonTextWidget(
                              text: 'No Post Left',
                              style: TextStyle(color: kPrimaryColor),
                            ))
                          : ListView.builder(
                              padding: const EdgeInsets.only(bottom: 200),
                              scrollDirection: Axis.vertical,
                              itemCount: controller.post.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  color: Colors.black,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  height: height * 0.1,
                                                  width: width * .1,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        kWhiteColor,
                                                    // radius: 30,
                                                    backgroundImage:
                                                        NetworkImage(controller
                                                            .post[index]
                                                            .featuredImages!),
                                                    // child: ClipRRect(
                                                    //   borderRadius:
                                                    //       BorderRadius.circular(
                                                    //           30),
                                                    //   child: controller
                                                    //               .post[index]
                                                    //               .featuredImages !=
                                                    //           null
                                                    //       ? Image.network(
                                                    //           controller
                                                    //               .post[index]
                                                    //               .featuredImages!)
                                                    //       : SvgPicture.asset(
                                                    //           '/images/logo.svg',
                                                    //           fit: BoxFit.cover,
                                                    //           width: 30,
                                                    //           height: 30,
                                                    //         ),
                                                    // ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .post[index].title!,
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
                                                              color:
                                                                  kWhiteColor,
                                                            ),
                                                          ),
                                                          controller.post[index]
                                                                      .status ==
                                                                  true
                                                              ? Text(
                                                                  "Active",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodySmall!
                                                                      .copyWith(
                                                                          color:
                                                                              Colors.green),
                                                                )
                                                              : Text(
                                                                  'UnPublished',
                                                                  style: Theme.of(
                                                                          context)
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
                                                    // await controller
                                                    //     .getPostById(
                                                    //   controller.post[index].id
                                                    //       .toString(),
                                                    // );
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
                                                    debugPrint(
                                                        'post deleted pressed');
                                                    debugPrint(controller
                                                        .post[index].id!
                                                        .toString());
                                                    debugPrint(controller
                                                        .post[index].title);
                                                    debugPrint(controller
                                                        .post[index]
                                                        .propertyNumber
                                                        .toString());
                                                    debugPrint(controller
                                                        .post[index]
                                                        .description);
                                                    debugPrint(controller
                                                        .post[index]
                                                        .featuredImages);
                                                    debugPrint(controller
                                                        .post[index]
                                                        .galleryImages);
                                                    debugPrint(controller
                                                        .post[index]
                                                        .longDescription);
                                                    debugPrint(controller
                                                        .post[index].longitude);
                                                    debugPrint(controller
                                                        .post[index].latitude);
                                                    debugPrint(controller
                                                        .post[index]
                                                        .propertyNumber
                                                        .toString());
                                                    debugPrint(controller
                                                        .post[index].price);
                                                    debugPrint(controller
                                                        .post[index].city);
                                                    debugPrint(controller
                                                        .post[index].area);
                                                    debugPrint(controller
                                                        .post[index]
                                                        .isInstallmentAvailable
                                                        .toString());
                                                    debugPrint(controller
                                                        .post[index]
                                                        .showContactDetails
                                                        .toString());
                                                    debugPrint(controller
                                                        .post[index]
                                                        .advanceAmount);
                                                    debugPrint(controller
                                                        .post[index]
                                                        .noOfInstallments
                                                        .toString());
                                                    debugPrint(controller
                                                        .post[index]
                                                        .monthlyInstallments);
                                                    debugPrint(controller
                                                        .post[index]
                                                        .readyForPossession
                                                        .toString());
                                                    debugPrint(controller
                                                        .post[index]
                                                        .areaSizeUnit);
                                                    debugPrint(controller
                                                        .post[index].purpose);
                                                    debugPrint(controller
                                                        .post[index]
                                                        .amenitiesIconCodes);
                                                    debugPrint(controller
                                                        .post[index]
                                                        .amenitiesNames);
                                                    debugPrint(controller
                                                        .post[index].categoryId
                                                        .toString());
                                                    await controller.delete(
                                                        controller
                                                            .post[index].id!
                                                            .toString(),
                                                        controller
                                                            .post[index].title!,
                                                        controller.post[index]
                                                            .propertyNumber!,
                                                        controller.post[index]
                                                            .description!,
                                                        controller.post[index]
                                                            .featuredImages!,
                                                        controller.post[index]
                                                            .galleryImages!,
                                                        controller
                                                            .post[index].video!,
                                                        controller.post[index]
                                                            .longDescription!,
                                                        controller.post[index]
                                                            .longitude!,
                                                        controller.post[index]
                                                            .latitude!,
                                                        controller.post[index]
                                                            .plotNumber!,
                                                        controller
                                                            .post[index].price!,
                                                        controller
                                                            .post[index].city!,
                                                        controller
                                                            .post[index].area!,
                                                        controller.post[index]
                                                            .isInstallmentAvailable!,
                                                        controller.post[index]
                                                            .showContactDetails!,
                                                        controller.post[index]
                                                            .advanceAmount!,
                                                        controller.post[index]
                                                            .noOfInstallments!,
                                                        controller.post[index]
                                                            .monthlyInstallments!,
                                                        controller.post[index]
                                                            .readyForPossession!,
                                                        controller.post[index]
                                                            .areaSizeUnit!,
                                                        controller.post[index]
                                                            .purpose!,
                                                        controller.post[index]
                                                            .totalAreaSize!,
                                                        controller.post[index]
                                                            .bedroooms!,
                                                        controller.post[index]
                                                            .bathroom!,
                                                        controller.post[index]
                                                            .amenitiesIconCodes!,
                                                        controller.post[index]
                                                            .amenitiesNames!,
                                                        controller.post[index]
                                                            .categoryId!,
                                                        controller.post[index]
                                                            .subCategoryId!);
                                                  },
                                                  icon: SvgPicture.asset(
                                                    "assets/icons/trash.svg",
                                                    color: Colors.white,
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
            ],
          ),
        ));
  }
}
