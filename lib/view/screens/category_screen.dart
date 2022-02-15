import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

import '../widgets/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 15),
        child: Column(

          children: [
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 15, top: 15),
            //     child: textUtils(
            //         text: 'Category',
            //         color: Get.isDarkMode ? Colors.white : Colors.black,
            //         fontSize: 30,
            //         fontWeight: FontWeight.bold),
            //   ),
            //
            // ),
           // SizedBox(height: 20,),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
