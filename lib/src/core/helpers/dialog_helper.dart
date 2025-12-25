import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eppsee/src/constants/app_colors.dart';
import '../../common_widgets/custom_text_widget.dart';

class DialogHelper {
  /// Show Toast using Get.snackbar
  static void showToast({
    required String? message,
    bool error = true,
    bool warning = false,
    int seconds = 4,
  }) {
    if (message == null || message.isEmpty) return;

    // Decide snackbar color based on type
    Color bgColor;
    if (error) {
      bgColor = Colors.redAccent;
    } else if (warning) {
      bgColor = Colors.orangeAccent;
    } else {
      bgColor = Colors.green;
    }

    Get.snackbar(
      "message", // set a non-empty dummy title (won’t show if titleText is used)
      "",
      titleText: const SizedBox.shrink(), // remove title space
      messageText: CustomTextWidget(
        text: message,
        color: AppColors.white,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      duration: Duration(seconds: seconds),
      margin: const EdgeInsets.all(12),
      borderRadius: 10,
    );
  }
}
