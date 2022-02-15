import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopapp/utils/theme.dart';

import '../../../logic/controller/auth_controller.dart';
import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Get.isDarkMode ? pinkClr : mainColor,
      onTap: () {
        Get.defaultDialog(
          title: 'Logout From App',
          backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
          middleText: 'Are you sure you need to logout',
          radius: 10,
          textCancel: 'No',
          cancelTextColor: Colors.white,
          textConfirm: 'Yes',
          confirmTextColor: Colors.white,
          onCancel: () {
            Get.back();
          },
          onConfirm: () {
            controller.singOutUsingFirebase();
          },
          buttonColor: Colors.transparent,
          titleStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          middleTextStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        );
      },
      child: Container(
          width: double.infinity,
          height: 70,
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              textUtils(
                  text: 'Logout'.tr,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ],
          )),
    );
  }
}
