import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/productsController/products_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_drawer.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_elevated_button.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_text_widget.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class ProductScreen extends GetView<ProductsController> {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Products'),
            backgroundColor: Colors.white,
            centerTitle: true,
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
                        : controller.products.isEmpty
                            ? const Center(
                                child: CommonTextWidget(
                                text: 'No Product Left',
                                style: TextStyle(color: kPrimaryColor),
                              ))
                            : SizedBox(
                                height: height * .9,
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(bottom: 200),
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller.products.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final product = controller.products[index];
                                    return Container(
                                      // add shadow
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.grey.withOpacity(0.25),
                                            spreadRadius: 1,
                                            blurRadius: 8,
                                            offset: const Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 6.0,
                                            right: 6.0,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "STATUS",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: kDarkBgColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  product.status == true
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
                                              ).paddingAll(10),
                                              const Divider(
                                                height: 5,
                                                thickness: 1,
                                                indent: 0,
                                                endIndent: 0,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "PRODUCT ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: kDarkBgColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  CommonTextWidget(
                                                    text: product.title!,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: kDarkBgColor),
                                                  ),
                                                ],
                                              ).paddingSymmetric(
                                                  vertical: 3, horizontal: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "PRICE ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: kDarkBgColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  CommonTextWidget(
                                                    text: product.price!,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: kDarkBgColor),
                                                  ),
                                                ],
                                              ).paddingSymmetric(
                                                  vertical: 3, horizontal: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "SALE PRICE ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: kDarkBgColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  CommonTextWidget(
                                                    text: product.salePrice!,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: kDarkBgColor),
                                                  ),
                                                ],
                                              ).paddingSymmetric(
                                                  vertical: 3, horizontal: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "PRODUCT LIFE IN DAYS ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: kDarkBgColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  CommonTextWidget(
                                                    text: product
                                                        .productLifeInDays
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: kDarkBgColor),
                                                  ),
                                                ],
                                              ).paddingSymmetric(
                                                  vertical: 3, horizontal: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    "TYPE ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: kDarkBgColor,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  CommonTextWidget(
                                                    text: product.productType!,
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        color: kDarkBgColor),
                                                  ),
                                                ],
                                              ).paddingSymmetric(
                                                  vertical: 3, horizontal: 10),
                                              const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "DESCRIPTION ",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: kDarkBgColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      CommonTextWidget(
                                                        text:
                                                            'Simple data, or facts, about the property such as street',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                kDarkBgColor),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ).paddingAll(10),
                                              const Divider(
                                                height: 5,
                                                thickness: 1,
                                                indent: 0,
                                                endIndent: 0,
                                              ),
                                              // add buy product button
                                              CommonElevatedButton(
                                                text: 'Buy',
                                                buttonColor: kPrimaryColor,
                                                elevation: 0,
                                                height: 45,
                                                width: 200,
                                                onPressed: () {},
                                              ).paddingSymmetric(
                                                  horizontal: 10, vertical: 10),
                                            ],
                                          )),
                                    ).paddingSymmetric(
                                        horizontal: 10, vertical: 10);
                                  },
                                ),
                              ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
