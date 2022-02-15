import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/category_controller.dart';
import 'package:shopapp/utils/theme.dart';

import 'category_items.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isCategoryLoading.value
          ? Expanded(
            child: Center(
                child: CircularProgressIndicator(
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
              ),
          )
          : Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            controller.getCategoryIndex(index);
                            Get.to(() => CategoryItems(categoryTitle: controller.categoryNameList[index],), );
                          },
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Get.isDarkMode?pinkClr:mainColor,
                                width: 2,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    controller.imageCategory[index]),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Get.isDarkMode ? pinkClr : mainColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  controller.categoryNameList.value[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: controller.categoryNameList.length),
              ),
            );
    });
  }
}
