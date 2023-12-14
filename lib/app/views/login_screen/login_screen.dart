import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/authController/auth_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_elevated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_methods.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends GetView<AuthController> {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: getHeight(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mountains.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 80),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Welcome to Grounda",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    controller: controller.emailController.value,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Obx(
                    () => TextFormField(
                      controller: controller.passwordController.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.passwordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            controller.togglePasswordVisibility();
                          },
                        ),
                      ),
                      obscureText: controller.passwordVisible.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                verticalSpacer(20),
                CommonElevatedButton(
                    text: 'Login',
                    buttonColor: kPrimaryColor,
                    textColor: kWhiteColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller
                            .login(
                          controller.emailController.value.text,
                          controller.passwordController.value.text,
                        )
                            .then((value) {
                          if (value) {
                            Get.offAllNamed('/post-screen');
                          } else {}
                        });
                      }
                      debugPrint('Login');
                    }),
                verticalSpacer(30),
                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    controller.googleSignin().then((value) {
                      if (value) {
                        Get.offAllNamed('/home-screen');
                      } else {
                        showErrorSnak('Login Failed', 'Login Failed');
                      }
                    });
                  },
                ),
                verticalSpacer(30),
                TextButton(
                  child: const Text(
                    'Not registered? Sign up',
                    style: TextStyle(color: kWhiteColor),
                  ),
                  onPressed: () {
                    Get.toNamed('/signup-screen');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
