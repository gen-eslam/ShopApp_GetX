import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/product_controller.dart';

class SearchFormText extends StatelessWidget {

  final controller= Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_)
    {
      return TextField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        controller: controller.searchTextController,
        style: TextStyle(color: Colors.black),

        onChanged:(searchValue)
        {
          controller.addSearchToList(searchValue);
        } ,


        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusColor: Colors.red,
          hintText: 'Search with name or price',
          hintStyle:const TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),



          prefixIcon:const Icon(Icons.search,color: Colors.grey,),
          suffixIcon:controller.searchTextController.text.isNotEmpty? IconButton(onPressed: ()
          {
            controller.clearSearch();
          },icon: Icon(Icons.close,color: Colors.black,),):null,
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
      );
    });
  }
}
