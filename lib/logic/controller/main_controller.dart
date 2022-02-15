import 'package:get/get.dart';
import 'package:shopapp/view/screens/category_screen.dart';
import 'package:shopapp/view/screens/favorites_screen.dart';
import 'package:shopapp/view/screens/home_screen.dart';
import 'package:shopapp/view/screens/settings_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final  screens = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ].obs;
  final appBarTitle = [
    'Gen Shop',
    'Category Screen',
    'Favorite Screen',
    'Settings Screen'
  ].obs;
  void changeBottomNavBar(int index)
  {
    currentIndex.value = index;
    update();
  }
}
