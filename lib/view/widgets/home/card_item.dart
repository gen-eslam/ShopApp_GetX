import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';

import 'package:shopapp/logic/controller/product_controller.dart';
import 'package:shopapp/model/product_model.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/screens/product_details_screen.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

class CardItem extends StatelessWidget {
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.isLoading.value) {
        return Expanded(
          child: controller.searchList.isEmpty&&controller.searchTextController.text.isNotEmpty?
              Image.asset(Get.isDarkMode?'assets/images/search_empty_dark.png':'assets/images/search_empty_light.png'):
          GridView.builder(
            itemCount: controller.searchList.isEmpty? controller.productList.length:controller.searchList.length,
            itemBuilder: (BuildContext context, int index) {
              if(controller.searchList.isEmpty)
              {
                return buildCardItems(controller.productList[index], () {
                  Get.to(() => ProductDetailsScreen(
                    models: controller.productList[index],
                  ));
                });
              }else
              {
                return buildCardItems(controller.searchList[index], () {
                  Get.to(() => ProductDetailsScreen(
                    models: controller.productList[index],
                  ));
                });
              }
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9,
              crossAxisSpacing: 6,
              maxCrossAxisExtent: 200,
            ),
          ),
        );
      } else {
        return Expanded(
            child: Center(
                child: CircularProgressIndicator(
          color: Get.isDarkMode ? pinkClr : mainColor,
        )));
      }
    });
  }

  Widget buildCardItems(ProductModels models, Function() onTap) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(children: [
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.mangeFavourites(models.id);
                      },
                      icon: Icon(
                        controller.isFavorites(models.id)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: Get.isDarkMode ? pinkClr : mainColor,
                      )),
                  IconButton(
                      onPressed: () {
                        cartController.addProductToCart(models);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? pinkClr : mainColor,
                      )),
                ],
              );
            }),
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                models.image,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${models.price} \$',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Get.isDarkMode ? pinkClr : mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textUtils(
                            text: '${models.rating.rate}',
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        const Icon(
                          Icons.star,
                          size: 13,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
