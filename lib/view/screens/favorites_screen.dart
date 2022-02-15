import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopapp/logic/controller/product_controller.dart';
import 'package:shopapp/model/product_model.dart';
import 'package:shopapp/utils/theme.dart';

class FavoriteScreen extends StatelessWidget {

  final controller =Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
 return Obx(()
 {
   return Scaffold(
     backgroundColor: context.theme.backgroundColor,
     body: controller.favouritesList.isEmpty ? Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children:
         [
           SizedBox(height: 100,
             width: 100,
             child: Image.asset('assets/images/heart.png',
               color: Get.isDarkMode ? pinkClr : mainColor,),
           ),
           SizedBox(
             height: 18,
           ),
           Text('Please, Add your favorites products.', style: TextStyle(
             color: Get.isDarkMode ? Colors.white : Colors.black,
             fontSize: 15,
             fontWeight: FontWeight.bold,
             fontStyle: FontStyle.italic,
           ),)
         ],
       ),
     ) : ListView.separated(
         itemBuilder: (context, index) {
           return buildFavItem(controller.favouritesList[index]);
         },
         separatorBuilder: (context, index) {
           return const Divider(
             color: Colors.grey,
             thickness: 1,
           );
         },
         itemCount: controller.favouritesList.length),
   );
 });


  }

  Widget buildFavItem(ProductModels models) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      child: Row(

        children: [
          SizedBox(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(models.image, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  models.title,
                  maxLines: 2 ,
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,

                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${models.price}',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: ()
          {
            controller.mangeFavourites(models.id);
          }, icon: Icon(Icons.favorite,color: Get.isDarkMode? pinkClr:mainColor,size: 30,)),

        ],
      ),
    );
  }
}
