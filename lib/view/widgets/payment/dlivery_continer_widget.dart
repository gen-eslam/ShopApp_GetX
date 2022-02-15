import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/auth_controller.dart';
import 'package:shopapp/logic/controller/payment_controller.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

import '../../../routes/routes.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColor = false;
  final controller = Get.find<PaymentController>();
  final authController =Get.find<AuthController>();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
            color: changeColor ? Colors.white : Colors.grey.shade300,
            address: 'Egypt, benha',
            name:authController.displayUserName.value ,
            phone: '01551953696',
            title:'Gen Shop' ,
            icon: Container(),
            value: 1,
            onChanged: (int? value) {
              setState(() {
                radioContainerIndex = value!;
                changeColor = !changeColor;
              });
            }),
        SizedBox(
          height: 20,
        ),
        Obx((){
          return buildRadioContainer(
              color: changeColor ? Colors.grey.shade300 : Colors.white,
              address: controller.address.value ,
              name:authController.displayUserName.value ,
              phone: controller.phoneNum.value,
              title: 'Gen Shop',
              value: 2,
              icon: InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: 'Enter Your Phone Number',
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                      radius: 10,
                      textCancel: 'Cancel',
                      cancelTextColor: Colors.white,
                      textConfirm: ' save ',
                      confirmTextColor: Colors.white,
                      onCancel: () {
                        Get.toNamed(Routes.paymentScreen);
                      },
                      onConfirm: () {
                        Get.back();
                        controller.phoneNum.value =phoneController.text;
                      },
                      buttonColor: Colors.transparent,
                      content: Padding(
                        padding: const EdgeInsets.all(15),
                        child: TextField(
                          controller: phoneController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: Colors.black),
                          maxLength: 11,
                          onSubmitted: (value)
                          {
                            phoneController.text =value;


                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            focusColor: Colors.red,
                            hintText: 'Enter your phone number',
                            hintStyle: const TextStyle(
                              color: Colors.black45,
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                            ),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                            ),

                            suffixIcon: IconButton(
                              onPressed: ()
                              {
                                phoneController.clear();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.contact_phone_outlined,
                    size: 20,
                    color: Get.isDarkMode ? pinkClr : mainColor,
                  )),
              onChanged: (int? value) {
                setState(() {
                  radioContainerIndex = value!;
                  changeColor = !changeColor;
                });
                controller.updatePosition();
              }
              );
        }),

      ],
    );
  }

  Widget buildRadioContainer(
          {required Color color,
          required int value,
          required String title,
          required String name,
          required String phone,
          required String address,
          required Function onChanged,
          required Widget icon}) =>
      Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 3.0, blurRadius: 5.0),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              value: value,
              groupValue: radioContainerIndex,
              onChanged: (int? value) {
                onChanged(value);
              },
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textUtils(
                      text: title,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  const SizedBox(
                    height: 5,
                  ),
                  textUtils(
                      text: name,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text(
                        '🇪🇬+20 ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      textUtils(
                          text: phone,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      const SizedBox(
                        width: 120,
                      ),
                      SizedBox(
                        child: icon,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  textUtils(
                      text: address,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      );
}
