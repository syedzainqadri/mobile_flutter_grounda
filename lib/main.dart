import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_flutter_grounda/app/bindings/all_bindings.dart';
import 'package:mobile_flutter_grounda/app/controllers/amenitiesController/amenities_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/authController/auth_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/packageController/package_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/postController/post_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/productsController/products_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/profileController/profile_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/themeController/theme_change_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/themeController/theme_controller.dart';
import 'package:mobile_flutter_grounda/app/services/navigation_service.dart';
import 'package:mobile_flutter_grounda/app/views/post_screen/post_screen.dart';
import 'package:mobile_flutter_grounda/app/views/login_screen/login_screen.dart';
import 'package:mobile_flutter_grounda/firebase_options.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';
import 'package:mobile_flutter_grounda/utils/global_variable.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('settings');
  await Hive.openBox('token');
  await Hive.openBox('consts');

  Get.put(AuthController());
  // Get.put(DashboardController());
  // Get.put(ProjectController());
  setPathUrlStrategy();
  getUserCredential();
  Get.put(ThemeController());
  Get.put(ThemeChangeController());
  // Get.put(PostController());
  // Get.put(ProfileController());
  // Get.put(AmenitiesController());
  // Get.put(ProductsController());
  // Get.put(PackageController());
  runApp(MyApp());
}

getUserCredential() {
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  token.value = tokenHiveBox.get('token') ?? '';
  userId.value = int.parse(tokenHiveBox.get('userId') ?? '0');
  debugPrint('USER LOGIN TOKEN: ${token.value}');
  debugPrint('USER LOGIN ID: ${userId.value}');
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController _themeController = Get.put(ThemeController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: _themeController.themeStateFromHiveSettingBox,
      title: projectName,
      initialRoute: userId.value == 0 ? '/login-screen' : '/post-screen',
      getPages: appRoutes(),
      // home: userId.value == 0 ? LoginScreen() : HomeScreen(),
    );
  }
}
