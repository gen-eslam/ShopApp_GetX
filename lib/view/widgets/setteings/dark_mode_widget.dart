import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/theme_controller.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

import '../../../logic/controller/settings_controller.dart';
import '../../../utils/theme.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);
  final settingsController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),
        Switch(
            activeColor: Get.isDarkMode?pinkClr:mainColor,
            activeTrackColor:Get.isDarkMode?pinkClr:mainColor ,
            value: Get.isDarkMode? true:false,
            onChanged: (value) {
              ThemeController().changesTheme();
            }),
      ],
    );
  }

  Widget buildIconWidget() => Material(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: darkSettings,
              ),
              child: Icon(
               Icons.dark_mode,
                 color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            textUtils(
                text:  'Dark Mode'.tr,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black),


          ],
        )
      );
}
