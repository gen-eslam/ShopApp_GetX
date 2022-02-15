import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

import '../widgets/setteings/dark_mode_widget.dart';
import '../widgets/setteings/language_widget.dart';
import '../widgets/setteings/logOut_widget.dart';
import '../widgets/setteings/profile_widget.dart';

class SettingsScreen extends StatelessWidget {
  final controller = Get.find<AuthController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
           ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          textUtils(text: "GENRAL".tr, fontSize: 15, fontWeight: FontWeight.w900,color: Get.isDarkMode?pinkClr:mainColor,),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),



        ],
      ),
    );
  }
}

