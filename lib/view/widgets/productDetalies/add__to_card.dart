import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';
import 'package:shopapp/model/product_model.dart';
import 'package:shopapp/utils/theme.dart';

import 'package:shopapp/view/widgets/text_utils.dart';

class AddToCart extends StatelessWidget {
  final ProductModels models;

  final controller = Get.find<CartController>();

  AddToCart({required this.models});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            children: [
              textUtils(
                  text: 'Price',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 20),
              Text(
                '\$${models.price}',
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: GetBuilder<CartController>(
                 builder: (_)
                 {
                   return ElevatedButton(
                       onPressed: () {
                         controller.addProductToCart(models);
                       },
                       style: ElevatedButton.styleFrom(
                           elevation: 0,
                           primary: Get.isDarkMode ? pinkClr : mainColor,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15),
                           )),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.shopping_cart),
                           SizedBox(
                             width: 10,
                           ),
                           Text(
                             'Add to Cart',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold),
                           ),
                         ],
                       ));
                 },
              ),
            ),
          )
        ],
      ),
    );
  }
}
