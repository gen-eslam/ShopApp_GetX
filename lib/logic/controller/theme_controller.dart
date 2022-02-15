import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController
{
  final GetStorage boxStorge = GetStorage();
  final key ='isDarkModes';

  void saveThemeDataBox(bool isDarkMode)
  {
    boxStorge.write(key, isDarkMode);

  }

  bool getDataFromBox()
  {
   return boxStorge.read<bool>(key)?? false;
  }


 ThemeMode get themeDataGet =>getDataFromBox()? ThemeMode.dark:ThemeMode.light ;
   void changesTheme()
  {
    Get.changeThemeMode(getDataFromBox()? ThemeMode.light : ThemeMode.dark );
    saveThemeDataBox(!getDataFromBox());
  }
}