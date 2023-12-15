import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/postController/post_controller.dart';
import 'package:mobile_flutter_grounda/app/views/post_screen/post_detail_screen/post_detail_screen.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_drawer.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_elevated_button.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_text_widget.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_methods.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class PostScreen extends GetView<PostController> {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Post'),
            backgroundColor: Colors.white,
            centerTitle: true,
          ),
          drawer: const AppDrawer(),
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
                                  final postModel = controller.post[index];
                                  return Card(
                                    elevation: 0.0,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: FutureBuilder(
                                            future: precacheImage(
                                                NetworkImage(
                                                    postModel.featuredImages!),
                                                context),
                                            builder: (BuildContext context,
                                                AsyncSnapshot snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return const SizedBox(
                                                  height: 200,
                                                  width: 150,
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                    color: kPrimaryColor,
                                                  )),
                                                );
                                              } else {
                                                return Image.network(
                                                  postModel.featuredImages!,
                                                  height: 200,
                                                  width: 150,
                                                  fit: BoxFit.cover,
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  postModel.title!,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  'Price: ${postModel.price}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: kDarkBgColor),
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      "Status: ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: kDarkBgColor),
                                                    ),
                                                    postModel.status == true
                                                        ? Text(
                                                            "Active",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .green,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          )
                                                        : Text(
                                                            'UnPublished',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  'City: ${postModel.city}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  'Area: ${postModel.area}',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey),
                                                ),
                                                const SizedBox(height: 5),
                                                CommonElevatedButton(
                                                  text: 'MORE DETAILS',
                                                  buttonColor: kPrimaryColor,
                                                  width: 150,
                                                  height: 40,
                                                  elevation: 0.0,
                                                  onPressed: () {
                                                    Get.toNamed(
                                                        '/post/detail-screen',
                                                        arguments: controller
                                                            .post[index]);
                                                  },
                                                ).paddingOnly(left: 30.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
