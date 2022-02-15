import 'package:flutter/material.dart';
import 'package:shopapp/utils/theme.dart';
import 'package:shopapp/view/widgets/text_utils.dart';

class PaymentMethodWidget extends StatefulWidget {
  const PaymentMethodWidget({Key? key}) : super(key: key);

  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
  int radioPaymentIndex =1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
            image: 'assets/images/paypal.png',
            text: 'Paypal',
            scale: 0.7,
            value: 1,
            onChange: (int? value)
            {
              setState(() {
                radioPaymentIndex =value!;
              });
            }
          ),
          const SizedBox(height: 10,),
          buildRadioPayment(
              image: 'assets/images/google.png',
              text: 'Google Pay',
              scale: 0.8,
              value: 2,
              onChange: (int? value)
              {
                setState(() {
                  radioPaymentIndex =value!;
                });
              }
          ),
          const SizedBox(height: 10,),
          buildRadioPayment(
              image: 'assets/images/credit.png',
              text: 'Credit Card',
              scale: 0.7,
              value: 3,
              onChange: (int? value)
              {
                setState(() {
                  radioPaymentIndex =value!;
                });
              }
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String text,
    required int value,
    required Function onChange,

  }) =>
      Container(
        height: 50,
        width: double.infinity,
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  scale: scale,
                ),
                const SizedBox(
                  width: 10,
                ),
                textUtils(
                    text: text,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ],
            ),
            Radio(
                value: value,
                groupValue: radioPaymentIndex,
                fillColor: MaterialStateColor.resolveWith((states) => mainColor),
                onChanged: (int? value)
                {
                  onChange(value);
                }),
          ],
        ),
      );
}
