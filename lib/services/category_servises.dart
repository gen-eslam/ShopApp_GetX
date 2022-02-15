import 'package:http/http.dart' as http;
import 'package:shopapp/utils/my_string.dart';

import '../model/category_models.dart';
import '../model/product_model.dart';

class CategoryServises
{
  static Future <List<String>> getCategory()async
  {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if(response.statusCode == 200)
    {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    }
    return throw Exception ('Faild to load product');

  }
}
class AllCategoryServises
{
  static Future <List<ProductModels>> getAllCategory(String categoryNames)async
  {
    var response = await http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));
    if(response.statusCode == 200)
    {
      var jsonData = response.body;
      return ProductModelsFromJson(jsonData);
    }
    return throw Exception ('Faild to load product');

  }
}