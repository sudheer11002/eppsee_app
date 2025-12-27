import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:eppsee/src/constants/app_assets.dart';
import 'package:eppsee/src/constants/app_colors.dart';
import 'package:eppsee/src/constants/app_dimens.dart';

import '../common_widgets/custom_text_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  // Method to show a simple snackbar
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
  }

  // Method to show a loading indicator
  static void showLoading({String message = 'Loading...'}) {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.primaryAppBGColour,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimens.size40,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.loading,
                  height: 60,
                  width: 60,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16.0),
                CustomTextWidget(
                  text: message,
                  color: AppColors.black87,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Method to hide the loading indicator
  static void hideLoading() {
    Navigator.of(Get.context!).pop();
  }

  static Widget showSpinner({Color color = Colors.black}) {
    return Center(
      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(color)),
    );
  }

  static Widget showPlaceholder() {
    return const Center(
      child: Text(
        'No Data Found!',
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  // Method to launch an external URL
  static void launchURL(String url) async {
    // TODO: Implement URL launching using a package like url_launcher
    // Example: await launch(url);
  }

  static String formatDate(DateTime dateTime) {
    // Use the intl package to format the date
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  static String formatTime(DateTime dateTimeString) {
    // Format the time portion
    String time = DateFormat.jm().format(dateTimeString); // 'jm' formats time as 'hh:mm a'
    return time;
  }

  // Method to open the email application
  static void sendEmail(String email) async {
    // TODO: Implement email launching using a package like url_launcher
    // Example: await launch('mailto:$email');
  }

  static void hideKeyboard(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';

    if (nameParts.isNotEmpty) {
      initials += nameParts[0][0].toUpperCase(); // First initial

      if (nameParts.length > 1) {
        initials += nameParts.last[0].toUpperCase(); // Last initial
      }
    }

    return initials;
  }

  static Color getRandomColor(int index) {
    // Define the list of predefined colors
    final List<Color> colors = [
      const Color(0xFFdbc541),
      const Color(0xFFb7d481),
      const Color(0xFF41b0e5),
      const Color(0xFFf2a9b0),
      const Color(0xFFefb94d),
      const Color(0xFFdc8dbb),
      const Color(0xFF85c7a6),
      const Color(0xFFc692c1),
      const Color(0xFFeacea0),
      const Color(0xFFd7d7d7),
    ];

    int colorIndex = index % colors.length;
    Color selectedColor = colors[colorIndex];

    return selectedColor;
  }

  static Color? _previousColor;
  static Color getRandomColor2() {
    // Define the list of predefined colors
    final List<Color> colors = [
      const Color(0xFFdbc541),
      const Color(0xFFb7d481),
      const Color(0xFF41b0e5),
      const Color(0xFFf2a9b0),
      const Color(0xFFefb94d),
      const Color(0xFFdc8dbb),
      const Color(0xFF85c7a6),
      const Color(0xFFc692c1),
      const Color(0xFFeacea0),
      const Color(0xFFd7d7d7),
    ];

    Color randomColor;
    do {
      int randomIndex = Random().nextInt(colors.length);
      randomColor = colors[randomIndex];
    } while (randomColor == _previousColor);

    _previousColor = randomColor;

    return randomColor;
  }

  static String convertDate(DateTime dateTime) {
    String formattedDay = dateTime.day.toString();
    return formattedDay;
  }

  static String formatMonth(DateTime dateTime) {
    String formattedMonth = getMonthName(dateTime.month);

    return formattedMonth;
  }

  static DateTime truncateTime(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  static String getCurrentMonthShortName() {
    DateTime now = DateTime.now();
    String monthShortName = DateFormat.MMM().format(now);
    return monthShortName;
  }

  static String getCurrentYear() {
    // Get the current date and time
    DateTime now = DateTime.now();
    // Extract the year from the current date
    int currentYear = now.year;
    print('Current Year: $currentYear');
    return currentYear.toString();
  }

  static String getCurrentMonthShortNameFromDateTime(DateTime focusedDay) {
    String monthShortName = DateFormat.MMM().format(focusedDay);
    return monthShortName;
  }

  static String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  // static Future<void> makePhoneCall(String phoneNumber) async {
  //   final Uri launchUri = Uri(
  //     scheme: 'tel',
  //     path: phoneNumber,
  //   );
  //   await launchUrl(launchUri);
  // }

  static String convertJsonDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
}

enum ApiStatus { success, error, unknown }

/// unauthorized, notFound, serverError,

ApiStatus getStatusFromCode(int? code) {
  switch (code) {
    case 200:
      return ApiStatus.success;
    case 400:
      return ApiStatus.error;
    case 305:
      return ApiStatus.error;
    // case 401:
    //   return ApiStatus.unauthorized;
    // case 404:
    //   return ApiStatus.notFound;
    // case 500:
    //   return ApiStatus.serverError;
    default:
      return ApiStatus.unknown;
  }
}
