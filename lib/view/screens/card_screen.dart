import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/cart_controller.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/card/cart_product.dart';
import 'package:shopapp/view/widgets/card/empty_card.dart';

import '../../routes/routes.dart';
import '../widgets/card/cart_total.dart';

class CardScreen extends StatelessWidget {
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        centerTitle: true,
        title: const Text(
          'Card Items',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(onPressed: ()
          {
            Get.defaultDialog(
              title: 'Delete',
              backgroundColor:Get.isDarkMode? pinkClr:mainColor,
              middleText: 'Are you sure you need to delete all items' ,
              radius: 10,
              textCancel: 'No',
              cancelTextColor: Colors.white,
              textConfirm:  'Yes',
              confirmTextColor: Colors.white,
              onCancel: (){Get.toNamed(Routes.cardScreen);},
              onConfirm: (){
                controller.clearAllProducts();
                Get.back();


              },
              buttonColor: Colors.transparent,
              titleStyle:const TextStyle(
                fontSize: 18,
                color:Colors.white,
                fontWeight: FontWeight.bold,

              ),
              middleTextStyle: const TextStyle(
                fontSize: 18,
                color:Colors.white,
                fontWeight: FontWeight.bold,

              ),

            );


          }, icon: Icon(Icons.delete_forever))
        ],
      ),
      body: Obx(
            (){
              if(controller.productsMap.isEmpty)
                return EmptyCard();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 650,
                      child: ListView.separated(
                          itemBuilder: (context, index) => CartProduct(
                              models: controller.productsMap.keys.toList()[index],index: index,quantity: controller.productsMap.values.toList()[index]),
                          separatorBuilder: (context, index) => SizedBox(height: 20),
                          itemCount: controller.productsMap.length),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
      ),
    );
  }
}
