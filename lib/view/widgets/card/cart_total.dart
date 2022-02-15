import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';
import 'package:shopapp/utils/theme.dart';

import 'package:shopapp/view/widgets/text_utils.dart';

import '../../../routes/routes.dart';



class CartTotal extends StatelessWidget {
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()
    {
      return Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              children: [
                textUtils(
                    text: 'Total',
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 20),
                Text(
                  '\$${controller.total}',
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
            SizedBox(width: 12,),
            Expanded(
              child: SizedBox(
                height:60,

                child: ElevatedButton(
                    onPressed: ()
                    {
                      Get.toNamed(Routes.paymentScreen);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Get.isDarkMode?pinkClr:mainColor,
                        shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(15),

                        )
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Icon(Icons.shopping_cart),
                        SizedBox(
                          width: 10,
                        ),

                        Text(
                          'Check Out',
                          style:
                          TextStyle(color: Colors.white,fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      );
    });
  }
}
