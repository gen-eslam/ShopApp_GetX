import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/routes/routes.dart';
import 'package:shopapp/utils/my_string.dart';

import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/auth/Container_under.dart';
import 'package:shopapp/view/widgets/auth/auth_button.dart';
import 'package:shopapp/view/widgets/auth/auth_text_form_field.dart';
import 'package:shopapp/view/widgets/auth/check_widget_box.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controler = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.29,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        textUtils(
                          text: 'SIGN',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        textUtils(
                          text: 'UP',
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    AuthTextFormField(
                      controller: nameController,
                      obscureText: false,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value.toString().length <= 2 ||
                            !RegExp(validationName).hasMatch(value))
                          return 'Enter valid name';
                        return null;
                      },
                      prefixIcon: Image.asset(
                        'assets/images/user.png',
                        color: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                      suffixIcon: const Text(''),
                      hintText: 'User Name',
                    ),
                    const SizedBox(
                      height: 20,
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
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => AuthTextFormField(
                        controller: passwordController,
                        obscureText: controler.visibility ? false : true,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.toString().length < 6)
                            return 'Password should be longer or equal to 6 characters';
                          return null;
                        },
                        prefixIcon: Image.asset(
                          'assets/images/lock.png',
                          color: Get.isDarkMode ? pinkClr : mainColor,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controler.visible();
                          },
                          icon: Icon(
                            controler.visibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                        ),
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CheckWidget(
                      text1: 'I accept ',
                      text2: 'terms & conditions',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GetBuilder<AuthController>(
                      builder: (_) => AuthButton(
                        text: 'SING UP',
                        onPressed: () {

                            if (formKey.currentState!.validate()) {
                              if (controler.isCheckBox == false) {
                                Get.snackbar(
                                  'Check Box',
                                  'Please, Accept terms & conditions ',
                                  snackPosition: SnackPosition.BOTTOM,
                                  icon: Icon(Icons.warning),
                                  backgroundColor: Colors.amber,
                                  margin: EdgeInsets.all(20),
                                );
                              }else
                              {
                                controler.singUpUsingFirebase(
                                  name: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                );
                              }

                            }

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GetBuilder<AuthController>(
              builder: (_) => ContainerUnder(
                text: 'Already have an Account ?',
                textType: 'Log in',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
