import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/home/card_item.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

import '../widgets/home/search_form_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(

        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                color: Get.isDarkMode ? pinkClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const Text(
                    'Find Your',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontSize: 25),
                  ),
                 const  Text(
                    'INSPIRATION',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 28),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchFormText(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,

            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: textUtils(
                text: 'Categories',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Get.isDarkMode? Colors.white:Colors.black ,
              ),
            ),

          ),
          SizedBox(height: 30,),
          CardItem(),

        ],
      ),
    );
  }
}
