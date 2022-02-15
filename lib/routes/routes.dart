import 'package:get/get.dart';
import 'package:shopapp/logic/binding/auth_binding.dart';
import 'package:shopapp/logic/binding/main_binding.dart';
import 'package:shopapp/logic/binding/product_binding.dart';
import 'package:shopapp/view/screens/auth/forget_password_screen.dart';
import 'package:shopapp/view/screens/auth/login_screen.dart';
import 'package:shopapp/view/screens/auth/signup_screen.dart';
import 'package:shopapp/view/screens/card_screen.dart';
import 'package:shopapp/view/screens/main_screen.dart';
import 'package:shopapp/view/screens/welcome_screen.dart';

import '../view/screens/payment_screen.dart';

class AppRoutes {
//initialRoute
static const welcome = Routes.welcomeScreen ;
static const mainScreen = Routes.mainScreen ;
//getPages
  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(name: Routes.mainScreen,
        page:()=> MainScreen(),
      bindings:
      [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),

    GetPage(
      name: Routes.loginScreen,
      page: () =>  LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () =>  SignUpScreen(),
      binding: AuthBinding()
    ),
    GetPage(
        name: Routes.forgetPasswordScreen,
        page: () =>  ForgetPasswordScreen(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.cardScreen,
        page: () =>  CardScreen(),
      bindings:[
        ProductBinding(),

      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () =>  PaymentScreen(),
      bindings:[
        ProductBinding(),
        AuthBinding(),
        MainBinding(),

      ],



    ),
  ];
}
class Routes
{
  static const welcomeScreen ='/WelcomeScreen';
  static const loginScreen = '/LoginScreen';
  static const signUpScreen = '/SingUpScreen';
  static const forgetPasswordScreen ='/ForgetPasswordScreen';
  static const mainScreen = '/MainScreen';
  static const cardScreen = '/CardScreen';
  static const paymentScreen= '/PaymentScreen';
}
