import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';

showSuccessSnak(String title, String message) {
  Get.snackbar(
      icon: const Icon(
        Icons.check,
        color: kWhiteColor,
      ),
      title,
      message,
      colorText: kDarkTextColor,
      snackPosition: SnackPosition.TOP,
      maxWidth: 600,
      backgroundColor: Colors.green,
      snackStyle: SnackStyle.FLOATING,
      shouldIconPulse: true);
}

showErrorSnak(String title, String message) {
  Get.snackbar(
      icon: const Icon(
        Icons.dangerous,
        color: kWhiteColor,
      ),
      title,
      message,
      colorText: kDarkTextColor,
      snackPosition: SnackPosition.TOP,
      maxWidth: 600,
      backgroundColor: Colors.red,
      snackStyle: SnackStyle.FLOATING,
      shouldIconPulse: true);
}

showDeleteSnak(String title, String message) {
  Get.snackbar(
      icon: const Icon(
        Icons.delete,
        color: kWhiteColor,
      ),
      title,
      message,
      colorText: kDarkTextColor,
      snackPosition: SnackPosition.TOP,
      maxWidth: 600,
      backgroundColor: Colors.deepOrange,
      snackStyle: SnackStyle.FLOATING,
      shouldIconPulse: true);
}

Widget verticalSpacer(double height) {
  return SizedBox(height: height);
}

Widget horizontalSpacer(double width) {
  return SizedBox(width: width);
}

// get height and width of screen using media query
double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

showCommonProcessingDialog({
  required String message,
}) {
  return Get.dialog(
    AlertDialog.adaptive(
      title: const Text(
        'Processing',
        textAlign: TextAlign.center,
        textScaler: TextScaler.noScaling,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(
            color: kPrimaryColor,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            textScaler: TextScaler.noScaling,
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}
