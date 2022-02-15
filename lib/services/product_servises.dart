import 'package:http/http.dart' as http;
import 'package:shopapp/utils/my_string.dart';

import '../model/product_model.dart';
class ProductServises
{
static Future <List<ProductModels>> getProduct()async
{
 var response = await http.get(Uri.parse('$baseUrl/products'));
 if(response.statusCode == 200)
 {
  var jsonData = response.body;
  return ProductModelsFromJson(jsonData);
 }
 return throw Exception ('Faild to load product');

}
}