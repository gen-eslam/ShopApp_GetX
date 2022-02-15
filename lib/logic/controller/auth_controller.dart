import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopapp/routes/routes.dart';

import '../../model/facebook_model.dart';

class AuthController extends GetxController {
  bool visibility = false;
  bool isCheckBox = false;
  RxString displayUserName = ''.obs;
  var displayUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  var googleSingIn = GoogleSignIn();
  FaceBookModel? faceBookModel;
  bool isSingedIn = false;
  var auth = FirebaseAuth.instance;

  final GetStorage authBox = GetStorage();

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName! : '');
    displayUserEmail.value = (userProfile != null ? userProfile!.email! : '');
    displayUserPhoto.value =
        (userProfile != null ? userProfile!.photoURL! : '');

    super.onInit();
  }

  void visible() {
    visibility = !visibility;
    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  void singUpUsingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName.value = name;
        print(displayUserName);
        auth.currentUser!.updateDisplayName(name);
        Get.offNamed(Routes.mainScreen);
      });

      update();
    } on FirebaseAuthException catch (e) {
      String title = '';
      String massage = '';
      if (e.code == 'weak-password') {
        title = e.code;
        massage = 'The password provided is too weak.';
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        title = e.code;
        massage = 'The account already exists for that email.';
        print('The account already exists for that email.');
      } else {
        title = e.code;
        massage = e.message.toString();
      }
      Get.snackbar(
        title.replaceAll(RegExp('-'), ' ').capitalize!,
        massage,
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 1),
        colorText: Colors.black,
        margin: EdgeInsets.all(20),
        icon: Icon(Icons.warning),
      );
    } catch (e) {
      Get.snackbar(
        'Error!',
        e.toString(),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 1),
        colorText: Colors.black,
        margin: EdgeInsets.all(20),
        icon: Icon(Icons.error),
      );
      print(e);
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Get.offNamed(Routes.mainScreen);
      });
      isSingedIn = true;
      authBox.write('auth', isSingedIn);
      update();
    } on FirebaseAuthException catch (e) {
      String title = '';
      String massage = '';
      if (e.code == 'user-not-found') {
        title = e.code;
        massage =
            'Account does not exists for that $email.. Create your account by signing up..';
        print(
            'Account does not exists for that $email.. Create your account by signing up..');
      } else if (e.code == 'wrong-password') {
        title = e.code;
        massage = 'Invalid Password... PLease try again!';
        print('Invalid PasSword... PLease try again!');
      } else {
        massage = e.message.toString();
      }
      Get.snackbar(
        title.replaceAll(RegExp('-'), ' ').capitalize!,
        massage,
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 1),
        colorText: Colors.black,
        margin: EdgeInsets.all(20),
        icon: Icon(Icons.warning),
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 1),
        colorText: Colors.black,
        margin: EdgeInsets.all(20),
        icon: Icon(Icons.warning),
      );
    }
  }

  void googleSingUpUsingFirebase() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSingIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(credential);

      isSingedIn = true;
      authBox.write('auth', isSingedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      print(error.toString());
      Get.snackbar(
        'Error!',
        error.toString(),
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 1),
        colorText: Colors.black,
        margin: EdgeInsets.all(20),
        icon: Icon(Icons.warning),
      );
    }
  }

  // void faceBookSingUpUsingFirebase() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login(
  //     permissions: [
  //       'public_profile',
  //       'email',
  //       'pages_show_list',
  //       'pages_messaging',
  //       'pages_manage_metadata'
  //     ],
  //   );
  //
  //   if (loginResult.status == LoginStatus.success) {
  //     final data = await FacebookAuth.instance.getUserData();
  //     faceBookModel = FaceBookModel.fromJson(data);
  //
  //     isSingedIn = true;
  //     authBox.write('auth', isSingedIn);
  //     update();
  //     Get.offNamed(Routes.mainScreen);
  //   }
  // }

  void resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = '';
      String massage = '';
      if (e.code == 'user-not-found') {
        title = e.code;
        massage =
            'Account does not exists for that $email.. Create your account by signing up..';
        print(
            'Account does not exists for that $email.. Create your account by signing up..');
      } else {
        massage = e.message.toString();
      }
      Get.snackbar(
        title.replaceAll(RegExp('-'), ' ').capitalize!,
        massage,
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 1),
        colorText: Colors.black,
        margin: EdgeInsets.all(20),
        icon: Icon(Icons.warning),
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 1),
        colorText: Colors.black,
        margin: EdgeInsets.all(20),
        icon: Icon(Icons.warning),
      );
    }
  }

  void singOutUsingFirebase() async {
    try {
      await auth.signOut();
      await googleSingIn.signOut();
      await FacebookAuth.i.logOut();
      displayUserName.value = '';
      displayUserPhoto.value = '';
      displayUserEmail.value = '';
      isSingedIn = false;
      authBox.remove('auth');

      update();
      Get.offNamed(Routes.welcomeScreen);
    } catch (e) {
      Get.snackbar(
        'Error!',
        e.toString(),
        backgroundColor: Colors.amber,
        snackPosition: SnackPosition.BOTTOM,
        animationDuration: Duration(seconds: 1),
        colorText: Colors.black,
        margin: EdgeInsets.all(20),
        icon: Icon(Icons.warning),
      );
    }
  }
}
