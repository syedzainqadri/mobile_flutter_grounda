import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter_grounda/app/models/userModel/user_model.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class AuthController extends GetxController {
  late FocusNode userNameFocus;
  late FocusNode passwordFocus;
  // FirebaseAuth auth = FirebaseAuth.instance;
  // Rxn<User> firebaseUser = Rxn<User>();

  // User? get userGetter => firebaseUser.value;

  var userModel = UserModel().obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userNameFocus = FocusNode();
    passwordFocus = FocusNode();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   firebaseUser.bindStream(auth.authStateChanges());
  // }

  // /*
  //  * Reset Password
  //  */
  // Future<void> resetPassword(String email) async {
  //   try {
  //     await auth.sendPasswordResetEmail(email: email);
  //     errorSnackbar(
  //       'Password Reset',
  //       'Recovery email has been sent!',
  //     );
  //   } catch (e) {
  //     errorSnackbar(
  //       'Resetting failed',
  //       e.toString(),
  //     );
  //   }
  // }

  // Future<bool> validatePassword(String password) async {
  //   var user = auth.currentUser;
  //   try {
  //     var authCredentials =
  //         EmailAuthProvider.credential(email: user!.email!, password: password);
  //     var authResult = await user.reauthenticateWithCredential(authCredentials);
  //     return true;
  //   } catch (e) {
  //     errorSnackbar(
  //       "Password Reset Error",
  //       e.toString(),
  //     );

  //     return false;
  //   }
  // }

  // Future<void> changePassword(String newPassword) async {
  //   var user = auth.currentUser!;
  //   try {
  //     await user.updatePassword(newPassword);
  //     successSnackbar(
  //       'Successful',
  //       'Password Changed Successfully.',
  //     );
  //   } catch (e) {
  //     errorSnackbar(
  //       'Failed',
  //       e.toString(),
  //     );
  //   }
  // }

  // // setting profile scope
  // final GoogleSignIn _googleSignIn = GoogleSignIn(
  //   scopes: [
  //     'email',
  //     'profile',
  //   ],
  // );

  // Future<void> googleSignin() async {
  //   try {
  //     GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
  //     AuthCredential authCredential = GoogleAuthProvider.credential(
  //         idToken: googleAuth.idToken!, accessToken: googleAuth.accessToken!);
  //     UserCredential authResult =
  //         await auth.signInWithCredential(authCredential);

  //     if (authResult.additionalUserInfo!.isNewUser) {
  //       auth.currentUser!.getIdToken().then((value) => {token.value = value});
  //       // UserModel userModel =
  //       // UserModel(fcmtoken: authResult.user!.getIdToken());
  //     }
  //   } catch (e) {
  //     errorSnackbar(
  //       'Login Failed ',
  //       'Google login failed, try again.',
  //     );
  //   }
  // }

  Future<bool> registerUser(String email, String password, String role) async {
    var bodyPrepare = {
      "email": email,
      "password": password,
      "role": role,
    };
    var response = await http.post(Uri.parse(baseUrl + createUser),
        body: jsonEncode(bodyPrepare));

    print(response.body);
    if (response.statusCode == 200) {
      userModel.value = userModelFromJson(response.body);
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    }
    return true;
  }

  Future<void> signIn(String email, String password) async {
    var bodyPrepare = {
      "email": email,
      "password": password,
    };
    var response = await http.post(Uri.parse(baseUrl + userLogin),
        body: jsonEncode(bodyPrepare));
    print(response.body);
    if (response.statusCode == 200) {
      userModel.value = userModelFromJson(response.body);
      _updateHiveTokeng(
          userModel.value.token.toString(), userModel.value.id.toString());
      await Get.offAndToNamed('/dashboard');
    } else {
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM, maxWidth: 400);
    }
  }

  void _updateHiveTokeng(String token, String id) {
    tokenHiveBox.put('token', token);
    tokenHiveBox.put('userId', id);
  }
}
