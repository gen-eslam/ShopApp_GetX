import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';
import 'package:shopapp/logic/controller/main_controller.dart';

import 'package:shopapp/utils/theme.dart';

import '../../routes/routes.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
          title: Text(
            controller.appBarTitle.value[controller.currentIndex.value],
            style: TextStyle(color: Colors.white),
          ),
          actions: [

            Badge(
              position: BadgePosition.topEnd(top:2 , end: 4),

              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.slide,
              badgeContent: Text(
                '${cartController.quantity()}',
                style: TextStyle(color: Colors.white,fontSize: 9),
              ),
              child:
                  IconButton(icon: Image.asset('assets/images/shop.png'), onPressed: ()
                  {
                    Get.toNamed(Routes.cardScreen);
                  }),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            onTap: (index) {
              controller.changeBottomNavBar(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                label: '',
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ]),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.screens.value,
        ),
      );
    });
  }
}
