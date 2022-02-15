import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/routes/routes.dart';
import 'package:shopapp/utils/theme.dart';

import '../text_utils.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children:
        [
          Icon(Icons.shopping_cart,color: Get.isDarkMode? pinkClr:mainColor,size: 150,),
          const SizedBox(
            height: 40,
          ),
          RichText(text: TextSpan(

              children:

          [
            TextSpan(text: 'Your Cart is ',style: TextStyle(
              color: Get.isDarkMode? Colors.white:Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,

            )),

            TextSpan(text: 'Empty',style: TextStyle(
              color: Get.isDarkMode? pinkClr:mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 30,

            )),
          ])),
          const SizedBox(
            height: 10,
          ),
          Text('Add items to get Started',style: TextStyle(color: Get.isDarkMode? Colors.white:Colors.black),),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style:  ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
              primary: Get.isDarkMode? pinkClr :mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

            ),
            onPressed: ()
            {
             Get.toNamed(Routes.mainScreen);
            }, child: textUtils(text: 'Go to Home',fontWeight: FontWeight.bold,fontSize: 15),),

        ],
      ),
    );
  }
}
