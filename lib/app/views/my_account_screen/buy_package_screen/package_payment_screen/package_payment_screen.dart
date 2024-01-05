// PackagePaymentScreen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/packageController/package_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_elevated_button.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class PackagePaymentScreen extends GetView<PackageController> {
  const PackagePaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments;
    final double totalPrice = args['totalPrice'];
    final int totalItems = args['totalItems'];
    final int totalAds = args['totalAds'];

    return SafeArea(
      child: Obx(
        () => Scaffold(
            backgroundColor: kWhite,
            appBar: AppBar(
              title: const Text('Payment'),
              centerTitle: true,
              backgroundColor: kWhite,
            ),
            body: SingleChildScrollView(
                child: controller.isSend.value
                    ? Column(
                        children: [
                          const SizedBox(height: 5),
                          Center(
                            child: Container(
                              width: width * 0.95,
                              height: height * 0.72,
                              padding: const EdgeInsets.only(
                                top: 10.94,
                                left: 26.65,
                                right: 26.65,
                                bottom: 53.29,
                              ),
                              decoration: ShapeDecoration(
                                color: const Color(0xFF25282E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19.98),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 93.26,
                                      height: 93.26,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: 93.26,
                                              height: 93.26,
                                              decoration: const ShapeDecoration(
                                                color: Color(0xFF25282E),
                                                shape: OvalBorder(),
                                                shadows: [
                                                  BoxShadow(
                                                    color: Color(0x28000000),
                                                    blurRadius: 26.65,
                                                    offset: Offset(0, 9.99),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.check,
                                                color: kPrimaryColor,
                                                weight: 50,
                                                size: 50,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 39.97),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Payment Success!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.31,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.04,
                                          ),
                                        ),
                                        const SizedBox(height: 36.99),
                                        Text(
                                          'Your payment has been successfully send.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(
                                                0.7200000286102295),
                                            fontSize: 16.32,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0.07,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 39.97),
                                    Container(
                                      width: 494.62,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 0.8,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: Colors.white.withOpacity(
                                                0.1599999964237213),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 39.97),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total Payment',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(
                                                0.7200000286102295),
                                            fontSize: 18.32,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0.07,
                                          ),
                                        ),
                                        const SizedBox(height: 38),
                                        Text(
                                          'Rs.${totalPrice.toStringAsFixed(2)}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 32.0,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.03,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 39.97),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(19.98),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 1.67,
                                                      color: Colors.white
                                                          .withOpacity(
                                                              0.1599999964237213),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.99),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Total Packages',
                                                      style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(
                                                                0.7200000286102295),
                                                        fontSize: 12.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0.07,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        height: 26.66),
                                                    Text(
                                                      '$totalItems',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 21.65,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0.06,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 19.98),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(19.98),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 1.67,
                                                      color: Colors.white
                                                          .withOpacity(
                                                              0.1599999964237213),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.99),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Total Ads',
                                                      style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(
                                                                0.7200000286102295),
                                                        fontSize: 12.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0.07,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        height: 26.66),
                                                    Text(
                                                      '$totalAds',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 21.65,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0.06,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 19.98),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      19.98),
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        width: 1.67,
                                                        color: Colors.white
                                                            .withOpacity(
                                                                0.1599999964237213),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.99),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Payment Method',
                                                        style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.7200000286102295),
                                                          fontSize: 12.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0.07,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 26.66),
                                                      const Text(
                                                        '+92 333 3883381',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 0.06,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 19.98),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      19.98),
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        width: 1.67,
                                                        color: Colors.white
                                                            .withOpacity(
                                                                0.1599999964237213),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.99),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Reciever Name',
                                                        style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.7200000286102295),
                                                          fontSize: 12.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0.07,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 26.66),
                                                      const Text(
                                                        'Syed Zain',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 0.06,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          CommonElevatedButton(
                            text: 'Wait for Admin Approval'.toUpperCase(),
                            textColor: Colors.white,
                            buttonColor: const Color(0xFF25282E),
                            width: width * .95,
                            height: height * 0.055,
                            onPressed: () {},
                            elevation: 0,
                          ).paddingOnly(bottom: 5)
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 5),
                          Center(
                            child: Container(
                              width: width * 0.95,
                              height: height * 0.72,
                              padding: const EdgeInsets.only(
                                top: 10.94,
                                left: 26.65,
                                right: 26.65,
                                bottom: 53.29,
                              ),
                              decoration: ShapeDecoration(
                                color: const Color(0xFF25282E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(19.98),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 93.26,
                                      height: 93.26,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0,
                                            top: 0,
                                            child: Container(
                                              width: 93.26,
                                              height: 93.26,
                                              decoration: const ShapeDecoration(
                                                color: Color(0xFF25282E),
                                                shape: OvalBorder(),
                                                shadows: [
                                                  BoxShadow(
                                                    color: Color(0x28000000),
                                                    blurRadius: 26.65,
                                                    offset: Offset(0, 9.99),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  '!',
                                                  style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 50,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 39.97),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Payment!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30.31,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.04,
                                          ),
                                        ),
                                        const SizedBox(height: 36.99),
                                        Text(
                                          'Your payment is pending.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(
                                                0.7200000286102295),
                                            fontSize: 16.32,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0.07,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 39.97),
                                    Container(
                                      width: 494.62,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 0.8,
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            color: Colors.white.withOpacity(
                                                0.1599999964237213),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 39.97),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total Payment',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(
                                                0.7200000286102295),
                                            fontSize: 18.32,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            height: 0.07,
                                          ),
                                        ),
                                        const SizedBox(height: 38),
                                        Text(
                                          'Rs.${totalPrice.toStringAsFixed(2)}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 32.0,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.03,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 39.97),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(19.98),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 1.67,
                                                      color: Colors.white
                                                          .withOpacity(
                                                              0.1599999964237213),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.99),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Total Packages',
                                                      style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(
                                                                0.7200000286102295),
                                                        fontSize: 12.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0.07,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        height: 26.66),
                                                    Text(
                                                      '$totalItems',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 21.65,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0.06,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 19.98),
                                            Expanded(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(19.98),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                      width: 1.67,
                                                      color: Colors.white
                                                          .withOpacity(
                                                              0.1599999964237213),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            9.99),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Total Ads',
                                                      style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(
                                                                0.7200000286102295),
                                                        fontSize: 12.0,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 0.07,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                        height: 26.66),
                                                    Text(
                                                      '$totalAds',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 21.65,
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        height: 0.06,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 19.98),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      19.98),
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        width: 1.67,
                                                        color: Colors.white
                                                            .withOpacity(
                                                                0.1599999964237213),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.99),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Payment Method',
                                                        style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.7200000286102295),
                                                          fontSize: 12.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0.07,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 26.66),
                                                      const Text(
                                                        '+92 333 3883381',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 0.06,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 19.98),
                                              Expanded(
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                      19.98),
                                                  decoration: ShapeDecoration(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                        width: 1.67,
                                                        color: Colors.white
                                                            .withOpacity(
                                                                0.1599999964237213),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.99),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Reciever Name',
                                                        style: TextStyle(
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.7200000286102295),
                                                          fontSize: 12.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 0.07,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 26.66),
                                                      const Text(
                                                        'Syed Zain',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 0.06,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          CommonElevatedButton(
                            text: 'Send Payment',
                            textColor: Colors.white,
                            buttonColor: kPrimaryColor,
                            width: width * .95,
                            height: height * 0.055,
                            onPressed: () {
                              controller.isSend.value = true;
                            },
                            elevation: 0,
                          ).paddingOnly(bottom: 5)
                        ],
                      ))),
      ),
    );
  }
}
