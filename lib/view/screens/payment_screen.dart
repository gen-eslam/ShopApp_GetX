import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

import '../widgets/payment/dlivery_continer_widget.dart';
import '../widgets/payment/payment_method.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        centerTitle: true,
        title: Text(
          'PayMent',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: context.theme.backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textUtils(
                  text: 'Shipping to',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white :Colors.white),
             const SizedBox(height: 20,),
              DeliveryContainerWidget(),
              const SizedBox(height: 20,),
              textUtils(
                  text: 'Payment method',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white :Colors.white),
              const SizedBox(height: 20,),
              PaymentMethodWidget(),
              const SizedBox(height: 30,),
              Center(
                child: textUtils(text: 'Total: 200 \$'
                    ,fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode?Colors.white:Colors.black,
                ),
              ),
              const SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  height: 70,
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Get.isDarkMode?pinkClr:mainColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),


                      )
                      
                    ),
                    child: Text('Pay Now',style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),),
                    onPressed: (){},
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
