import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
 final String text;
 final Function onPressed;
   AuthButton({
   required this.text,
     required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: textUtils(text: text,fontSize: 18,fontWeight: FontWeight.bold),
      onPressed: ()=>onPressed(),
      style: ElevatedButton.styleFrom(
        primary: Get.isDarkMode? pinkClr :mainColor,
        minimumSize: const Size(360, 50),


      ),
    );
  }
}
