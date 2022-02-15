import 'package:get/get.dart';
import 'package:shopapp/model/product_model.dart';

class CartController extends GetxController {
  Map productsMap = {}.obs;

  get productSubTotal => productsMap.entries
      .map((e) => (e.key.price * e.value).toStringAsFixed(2))
      .toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  void addProductToCart(ProductModels models) {
    if (productsMap.containsKey(models)) {
      productsMap[models] += 1;
      update();



    } else {
      productsMap[models] = 1;
      update();



    }
  }

  void removeProductsFromCart(ProductModels models) {
    if (productsMap.containsKey(models) && productsMap[models] == 1) {
      productsMap.removeWhere((key, value) => key == models);
    } else {
      productsMap[models] -= 1;
    }
  }

  void removeOneProduct(ProductModels models) {
    productsMap.removeWhere((key, value) => key == models);
  }

  void clearAllProducts() {
    productsMap.clear();
  }

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
