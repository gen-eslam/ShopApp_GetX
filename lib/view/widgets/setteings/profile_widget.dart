import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/settings_controller.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

import '../../../logic/controller/auth_controller.dart';

class ProfileWidget extends StatelessWidget {
  final controller = Get.find<SettingController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(
                    authController.displayUserPhoto.value),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textUtils(
                  text: controller.capitalize(authController.displayUserName.value),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
              SizedBox(
                height: 5,
              ),
              textUtils(
                  text: authController.displayUserEmail.value,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ],
          ),
        ],
      );
    },);
  }
}
