import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/my_string.dart';

class SettingController extends GetxController
{
  @override
  void onInit()async
  {
    super.onInit();
    langLocal =await getLanguage;
  }


String capitalize(String profileName)
{
  return profileName.split(" ").map((name) => name.capitalize).join(" ");


}
//language
  var storage = GetStorage();
var langLocal =ene;
void saveLanguage(String lang)async
{
  await storage.write('lang', lang);
}


  Future<String> get getLanguage async
  {
    return await storage.read('lang');
  }
void changeLanguage(String typeLang)
{
  saveLanguage(typeLang);
  if(langLocal == typeLang)
    return;
  if(typeLang == frf)
  {
    langLocal =frf;
    saveLanguage(frf);
  }else if(typeLang ==ara){
    langLocal = ara;
    saveLanguage(ara);

  }else{
    langLocal =ene;
    saveLanguage(ene);
  }
update();
}


}