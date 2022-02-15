import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:shopapp/model/product_model.dart';
import 'package:shopapp/services/product_servises.dart';

class ProductController extends GetxController {
  var productList =<ProductModels>[].obs;
  RxBool isLoading = true.obs;
  List favouritesList =<ProductModels>[].obs;
  var stoarge = GetStorage();

  @override
  void onInit() {

    super.onInit();
    List? storedShoppings = stoarge.read<List>('isFavouritesList');

    if (storedShoppings != null) {
      favouritesList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }
  void getProducts() async {
    var products = await ProductServises.getProduct();
    try {
      isLoading(true);
      if(products.isNotEmpty)
        productList.addAll(products);

    } finally {
      isLoading(false);
    }
  }
  //Logic Favorite Screen
void mangeFavourites(int productId)async
{

  var existingIndex =
  favouritesList.indexWhere((element) => element.id == productId);
  print(existingIndex);

  if (existingIndex >= 0) {
    favouritesList.removeAt(existingIndex);
    await stoarge.remove("isFavouritesList");
  } else {
    favouritesList
        .add(productList.firstWhere((element) => element.id == productId));

    await stoarge.write("isFavouritesList", favouritesList);
  }



}
bool isFavorites(int productId)
{
  return favouritesList.any((element) => element.id == productId);
}

//Search bar logic
  var searchList =<ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

 void addSearchToList(String searchValue)
 {
   searchValue =searchValue.toLowerCase();
   searchList.value = productList.where((search) {
     var searchTitle = search.title.toLowerCase();
     var searchPrice = search.price.toString().toLowerCase();

     return searchTitle.contains(searchValue) ||
         searchPrice.toString().contains(searchValue);
   }).toList();
   update();
 }



  void clearSearch()
  {


    searchTextController.clear();
    addSearchToList("");
    update();
  }




}
