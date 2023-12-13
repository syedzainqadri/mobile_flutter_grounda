import 'dart:convert';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_flutter_grounda/app/models/errorModel/error_model.dart';
import 'package:mobile_flutter_grounda/app/models/userModel/user_model.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_text_widget.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_methods.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';

class AuthController extends GetxController {
  late FocusNode userNameFocus;
  late FocusNode passwordFocus;
  FirebaseAuth auth = FirebaseAuth.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  User? get userGetter => firebaseUser.value;

  var userModel = UserModel().obs;
  final Box<dynamic> tokenHiveBox = Hive.box('token');

  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  RxBool passwordVisible = true.obs;
  var isLogin = false.obs;
  var isRegistering = false.obs;

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

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

  // setting profile scope
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
    ],
  );

  Future<bool> googleSignin() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken!, accessToken: googleAuth.accessToken!);
      UserCredential authResult =
          await auth.signInWithCredential(authCredential);

      if (googleAuth.accessToken != '') {
        return true;
      } else {
        return false;
      }

      // if (authResult.additionalUserInfo!.isNewUser) {
      //   // auth.currentUser!.getIdToken().then((value) => {token.value = value});
      //   // UserModel userModel =
      //   // UserModel(fcmtoken: authResult.user!.getIdToken());
      // }
    } catch (e) {
      const GetSnackBar(
        title: 'Login Failed',
        message: 'Google login failed, try again.',
      );
      return false;
    }
  }

  Future<bool> registerUser(String email, String password, String role) async {
    // Show progress dialog
    showCommonProcessingDialog(message: 'Processing Your Request');
    var headers = {
      'x-api-key':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIzLCJzZXJ2ZXIiOnsiaWQiOiIzZTRmYzI5NiIsImxvYyI6ImV1dy0yIn0sImlhdCI6MTY3MTU0MDE3MywiaXNzIjoiaHR0cHM6Ly9leGFtcGxlLmNvbSJ9.9iwQeBRnALMyZURhZfPTWp0iSUVCDy99hYUd1QWE0_0',
      'Content-Type': 'application/json'
    };
    var body =
        json.encode({"email": email, "password": password, "role": role});

    var response = await http.post(
      Uri.parse(baseUrl + createUser),
      headers: headers,
      body: body,
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      userModel.value = userModelFromJson(response.body);
      // Dismiss the progress dialog
      Get.back();
      return true;
    } else {
      // Dismiss the progress dialog
      Get.back();
      Get.snackbar('Error', response.body,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 400,
          backgroundColor: kRedColor);
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    // Show progress dialog
    showCommonProcessingDialog(message: 'Processing Your Request');

    var bodyPrepare = {
      "email": email,
      "password": password,
    };
    var response = await http.post(Uri.parse(baseUrl + userLogin),
        body: jsonEncode(bodyPrepare));
    debugPrint(response.body);
    if (response.statusCode == 200) {
      userModel.value = userModelFromJson(response.body);
      _updateHiveTokeng(
          userModel.value.token.toString(), userModel.value.id.toString());
      // Dismiss the progress dialog
      Get.back();
      return true;
      // await Get.offAndToNamed('/home-screen');
    } else {
      // Dismiss the progress dialog
      Get.back();
      showErrorDialog('Incorrect user and/or password');
      return false;
    }
  }

  void _updateHiveTokeng(String token, String id) {
    tokenHiveBox.put('token', token);
    tokenHiveBox.put('userId', id);
  }
}
