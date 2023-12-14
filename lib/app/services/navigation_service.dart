import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/views/post_screen/post_detail_screen/post_detail_screen.dart';
import 'package:mobile_flutter_grounda/app/views/post_screen/post_screen.dart';
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
        name: '/post-screen',
        page: () => const PostScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/post/detail-screen',
        page: () => PostDetailScreen(),
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
