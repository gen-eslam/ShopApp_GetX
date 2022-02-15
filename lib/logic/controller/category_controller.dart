import 'package:get/get.dart';
import 'package:shopapp/services/category_servises.dart';

import '../../model/product_model.dart';

class CategoryController extends GetxController {
  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  var categoryNameList = <String>[].obs;
  var categoryList = <ProductModels>[].obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;
  RxBool isCategoryLoading = false.obs;
  RxBool isAllProductLoading = false.obs;

  void getCategory() async {
    var categoryName = await CategoryServises.getCategory();
    try {
      isCategoryLoading.value = true;
      if (categoryName.isNotEmpty) categoryNameList.addAll(categoryName);
    } finally {
      isCategoryLoading.value = false;
    }
  }

  getAllCategorys(String namecategory) async {
    isAllProductLoading(true);
    categoryList.value = await AllCategoryServises.getAllCategory(namecategory);

    isAllProductLoading(false);
  }

  getCategoryIndex(int index) async {
    var categoryAllName = await getAllCategorys(categoryNameList[index]);
    if (categoryAllName != null) categoryList.value = categoryAllName;
  }
}
