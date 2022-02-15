import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rating_bar_flutter/rating_bar_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:shopapp/logic/controller/product_controller.dart';
import 'package:shopapp/model/product_model.dart';
import 'package:shopapp/utils/theme.dart';

import 'package:shopapp/view/widgets/text_utils.dart';

class ClothesInfo extends StatelessWidget {
  final ProductModels models;

  ClothesInfo({Key? key, required this.models}) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  models.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),


            ],
          ),
          Row(
            children: [
              textUtils(
                  text: models.rating.rate.toString(),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
           const SizedBox(width: 8,),
              RatingBarFlutter.readOnly(

                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                halfFilledIcon: Icons.star_half,
                isHalfAllowed: true,

                filledColor: Colors.orange,
                emptyColor:Get.isDarkMode?Colors.white:Colors.black,
                halfFilledColor: Colors.orange,
                size: 20,
                initialRating:models.rating.rate,
                maxRating: 5,

              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ReadMoreText(
            models.description,
            style: TextStyle(
              fontSize: 15,
              height: 2,
              color: Get.isDarkMode?Colors.white:Colors.black,
              fontWeight: FontWeight.bold,

            ),
            trimLines: 3,
            textAlign: TextAlign.justify,


            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show Less',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color:Get.isDarkMode?pinkClr:mainColor,

            ),
            moreStyle:TextStyle(
              fontWeight: FontWeight.bold,
              color:Get.isDarkMode?pinkClr:mainColor,

            ),
          ),
          

        ],
      ),
    );
  }
}
