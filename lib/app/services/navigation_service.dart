import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/views/home_screen/home_screen.dart';
import 'package:mobile_flutter_grounda/app/views/login_screen/login_screen.dart';
import 'package:mobile_flutter_grounda/app/views/signup_screen/signup_screen.dart';

appRoutes() => [
      // GetPage(
      //   name: '/splash-screen',
      //   page: () => const SplashScreen(),
      //   transition: Transition.fadeIn,
      //   transitionDuration: const Duration(milliseconds: 1000),
      // ),

      GetPage(
        name: '/home-screen',
        page: () => HomeScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/login-screen',
        page: () => LoginScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/signup-screen',
        page: () => SignupScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
    ];
