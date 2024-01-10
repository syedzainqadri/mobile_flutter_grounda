import 'package:get/get.dart';
import 'package:mobile_flutter_grounda/app/views/agency_screen/agency_screen.dart';
import 'package:mobile_flutter_grounda/app/views/agency_screen/create_agency_screen/create_agency_screen.dart';
import 'package:mobile_flutter_grounda/app/views/my_account_screen/buy_package_screen/package_payment_screen/package_payment_screen.dart';
import 'package:mobile_flutter_grounda/app/views/my_account_screen/myAccount_screen.dart';
import 'package:mobile_flutter_grounda/app/views/my_account_screen/buy_package_screen/buy_package_screen.dart';
import 'package:mobile_flutter_grounda/app/views/post_screen/my_post_screen/my_post_screen.dart';
import 'package:mobile_flutter_grounda/app/views/post_screen/post_create_screen/post_create_screen.dart';
import 'package:mobile_flutter_grounda/app/views/post_screen/post_detail_screen/post_detail_screen.dart';
import 'package:mobile_flutter_grounda/app/views/post_screen/post_screen.dart';
import 'package:mobile_flutter_grounda/app/views/login_screen/login_screen.dart';
import 'package:mobile_flutter_grounda/app/views/post_screen/post_update_screen/post_update_screen.dart';
import 'package:mobile_flutter_grounda/app/views/product_screen/product_screen.dart';
import 'package:mobile_flutter_grounda/app/views/profile_screen/profile_edit_screen/profile_edit_screen.dart';
import 'package:mobile_flutter_grounda/app/views/profile_screen/profile_screen.dart';
import 'package:mobile_flutter_grounda/app/views/project_screen/project_create_screen/project_create_screen.dart';
import 'package:mobile_flutter_grounda/app/views/project_screen/project_screen.dart';
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
        name: '/post/mypost-screen',
        page: () => const MyPostScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/post/create-screen',
        page: () => const PostCreateScreen(),
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
        name: '/post/update-screen',
        page: () => const PostUpdateScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/agency-screen',
        page: () => AgencyScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/agency/create-screen',
        page: () => CreateAgencyScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/project-screen',
        page: () => const ProjectScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/project/create-screen',
        page: () => ProjectCreateScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/product-screen',
        page: () => const ProductScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/profile-screen',
        page: () => const ProfileScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/account-screen',
        page: () => const MyAccountScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/account/package-screen',
        page: () => const BuyPackageScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/package/payment-screen',
        page: () => const PackagePaymentScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),

      GetPage(
        name: '/profile/edit-screen',
        page: () => ProfileEditScreen(),
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
