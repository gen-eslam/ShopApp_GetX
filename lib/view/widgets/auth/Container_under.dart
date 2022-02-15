import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

class ContainerUnder extends StatelessWidget {
 final String text;
 final String textType;
 final Function() onPressed;
 ContainerUnder({
   required this.text,
   required this.onPressed,
   required this.textType,

});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,

      decoration:  BoxDecoration(
        color: Get.isDarkMode? pinkClr :mainColor,
        borderRadius:const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight:Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: 
        [
          textUtils(text: text,fontSize: 18 ),
          TextButton(onPressed:onPressed, child: textUtils(text: textType,fontSize: 18 ,underLine: true),)
        ],
      ),
    );
  }
}
