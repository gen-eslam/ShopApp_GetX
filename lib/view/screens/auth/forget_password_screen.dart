import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/utils/my_string.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/auth/auth_button.dart';
import 'package:shopapp/view/widgets/auth/auth_text_form_field.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          title: textUtils(
              text: 'Forget Password',
              color: Get.isDarkMode ? pinkClr : mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
          leading: GetBuilder<AuthController>(
            builder: (_) => IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios),
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          )),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: IconButton(
                //     icon: Icon(
                //       Icons.close_rounded,
                //       color: Get.isDarkMode ? Colors.white : Colors.black,
                //     ),
                //     onPressed: () {
                //       Get.back();
                //     },
                //   ),
                // ),

                const SizedBox(
                  height: 40,
                ),
                Text(
                  'If you want to recover your account, thin please porvide your email ID below..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  Get.isDarkMode
                      ? 'assets/images/forgetpass.png'
                      : 'assets/images/forgetpass copy.png',
                  width: 250,
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthTextFormField(
                  controller: emailController,
                  obscureText: false,
                  type: TextInputType.text,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value))
                      return 'Enter valid Email';
                    return null;
                  },
                  prefixIcon: Image.asset(
                    'assets/images/email.png',
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  ),
                  suffixIcon: const Text(''),
                  hintText: 'Email',
                ),
                SizedBox(
                  height: 50,
                ),
                GetBuilder<AuthController>(
                  builder: (_) => AuthButton(
                    onPressed: () {
                      if(formKey.currentState!.validate())
                      {
                        controller.resetPassword(
                            email: emailController.text.trim());
                      }
                    },
                    text: 'SEND',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
