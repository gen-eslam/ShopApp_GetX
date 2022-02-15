import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/settings_controller.dart';
import 'package:shopapp/utils/my_string.dart';

import '../../../utils/theme.dart';
import '../text_utils.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({Key? key}) : super(key: key);
  final controller =Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (_) {
     return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: languageSettings,
                    ),
                    child: Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  textUtils(
                      text: 'Language'.tr,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ],
              )),
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                width: 2,
              ),
            ),
            child: DropdownButtonHideUnderline(

              child: DropdownButton<String>(
                iconSize: 25,
                alignment: AlignmentDirectional.center,


                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                onChanged: (value)
                {
                  controller.changeLanguage(value!);
                  Get.updateLocale(Locale(value));
                },
                items: [
                  DropdownMenuItem(
                      value: ene,

                      child: Text(
                        ' ${en}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Get.isDarkMode ? Colors.white : Colors.black ),
                      )),
                  DropdownMenuItem(
                      value: ara,
                      child: Text(
                        ' ${ar}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Get.isDarkMode ? Colors.white : Colors.black ),
                      )),
                  DropdownMenuItem(
                      value: frf,
                      child: Text(
                        ' ${fr}',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Get.isDarkMode ? Colors.white : Colors.black ),
                      )),
                ],
                value: controller.langLocal,
              ),
            ),
          ),
        ],
      );
    },);
  }
}
