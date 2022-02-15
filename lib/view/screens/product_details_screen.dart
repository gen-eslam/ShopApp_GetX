import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';
import '../widgets/home/search_form_text.dart';
import '../widgets/productDetalies/add__to_card.dart';
import '../widgets/productDetalies/clothes_info.dart';
import '../widgets/productDetalies/image_sliders.dart';
import '../widgets/productDetalies/sized_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels models ;
  const ProductDetailsScreen({Key? key,required this.models}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child : Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(

          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [

                    ImageSliders(imageUrl: models.image,category: models.category!.index),
                   ClothesInfo(models: models),






                  ],
                ),
              ),
            ),
            models.category!.index==0||models.category!.index==3?SizedList():SizedBox(height: 50,),
            AddToCart(models: models),

          ],
        ),

      ),
    );
  }
}
