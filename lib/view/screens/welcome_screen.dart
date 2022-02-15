import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/routes/routes.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  Container(
                    height: 60,
                    width: 190,
                    child: Center(
                        child: textUtils(
                            text: 'Welcome', fontWeight: FontWeight.bold)),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: 230,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textUtils(
                          text: 'Gen',
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode? pinkClr :mainColor,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        textUtils(
                          text: 'Shop',
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 250,),
                  ElevatedButton(
                    style:  ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 12),
                      primary: Get.isDarkMode? pinkClr :mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      
                    ),
                      onPressed: ()
                      {
                        Get.offNamed(Routes.loginScreen);
                      }, child: textUtils(text: 'Get Start',fontWeight: FontWeight.bold,fontSize: 22),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: 
                    [
                      textUtils(text: 'Don\'t Have an Account',fontSize:20,),
                      TextButton(
                        style: TextButton.styleFrom(



                        ),
                          onPressed: ()
                          {
                            Get.offNamed(Routes.signUpScreen);
                          }, child: textUtils(text: 'sign up',color: Get.isDarkMode? pinkClr :mainColor,fontSize: 20,underLine: true))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
