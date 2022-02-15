import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';
import 'package:shopapp/model/product_model.dart';
import 'package:shopapp/utils/theme.dart';

class CartProduct extends StatelessWidget {
 ProductModels models;
 int index;
 int quantity ;
 CartProduct({required this.models,required this.index,required this.quantity});
 final controller= Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? pinkClr.withOpacity(.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    models.image,
                  ),
                )),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  models.title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '\$${controller.productSubTotal[index]}',
                  style: TextStyle(
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(

                children: [
                  IconButton(
                    onPressed: ()
                    {
                      controller.removeProductsFromCart(models);
                      quantity--;

                    },
                    icon: CircleAvatar(
                        radius: 12,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        backgroundColor: Get.isDarkMode ? pinkClr : mainColor),
                  ),
                  Text(
                    '${quantity}',
                    style: TextStyle(
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: ()
                    {
                      controller.addProductToCart(models);
                      quantity++;
                    },
                    icon: CircleAvatar(
                        radius: 12,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        backgroundColor: Get.isDarkMode ? pinkClr : mainColor),
                  ),
                ],
              ),
              IconButton(
                  onPressed: ()
                  {
                    controller.removeOneProduct(models);
                  },
                  icon: Icon(
                    Icons.delete,
                    size: 20,
                    color: Get.isDarkMode ? Colors.black : Colors.red,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
