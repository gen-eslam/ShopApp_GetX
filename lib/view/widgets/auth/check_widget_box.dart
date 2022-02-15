import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

class CheckWidget extends StatelessWidget {

final controller = Get.find<AuthController>();
final String text1;
 String? text2;
CheckWidget({
  required this.text1,
   this.text2,
});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_){
      return Row(
        children: [
          InkWell(
            onTap:()
            {
              controller.checkBox();

            } ,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child:controller.isCheckBox? Image.asset('assets/images/check.png',color: Get.isDarkMode? pinkClr :mainColor,):null,
            ),
          ),
          const SizedBox(width: 10,),
          Row(
            children:
            [
              textUtils(text: text1,fontSize: 16,color: Get.isDarkMode?Colors.white :Colors.black ),
              if(text2 != null)
                textUtils(text: text2!,fontSize: 16,color:Get.isDarkMode? Colors.white  :Colors.black,underLine: true),
            ],
          ),
        ],
      );
    });
  }
}
