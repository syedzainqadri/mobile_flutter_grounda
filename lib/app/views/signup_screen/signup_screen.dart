import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/controllers/authController/auth_controller.dart';
import 'package:mobile_flutter_grounda/app/widgets/common_elevated_button.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_methods.dart';

class SignupScreen extends GetView<AuthController> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  SignupScreen({super.key});

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
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: emailController,
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
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller: passwordController,
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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: roleController,
                    decoration: const InputDecoration(
                      labelText: 'Role',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your role';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSpacer(20),
                CommonElevatedButton(
                    text: 'Sign Up',
                    buttonColor: kPrimaryColor,
                    textColor: kWhiteColor,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller
                            .registerUser(
                          emailController.text,
                          passwordController.text,
                          roleController.text,
                        )
                            .then((value) {
                          if (value) {
                            Get.toNamed('/login-screen');
                          } else {
                            showErrorSnak('Error', 'User creation failed');
                          }
                        });
                      }
                    }),
                verticalSpacer(50),
                TextButton(
                  child: const Text(
                    'Already register? Login',
                    style: TextStyle(color: kWhiteColor),
                  ),
                  onPressed: () {
                    Get.toNamed('/login-screen');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
