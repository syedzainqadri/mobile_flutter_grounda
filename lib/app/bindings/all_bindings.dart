import 'package:get/instance_manager.dart';
import 'package:mobile_flutter_grounda/app/controllers/agencyController/agency_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/amenitiesController/amenities_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/blogsController/blog_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/categoryController/categoryCollection_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/customerController/customer_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/developerController/developer_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/faqController/faqGroup_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/faqController/faq_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/floorPlanController/floorPlan_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/forumPost/forumPostComment_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/forumPost/forumPost_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/menuController/sidebar_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/orderController/order_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/pageController.dart/page_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/paymentMethodController/paymentMethod_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/postController/post_comment_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/postController/post_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/productsController/products_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/profileController/profile_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/projectController/projectNearByPlaces_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/projectController/project_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/reviewController/review_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/themeController/theme_change_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/themeController/theme_controller.dart';
import 'package:mobile_flutter_grounda/app/controllers/wishListController/wishList_controller.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeChangeController());
    Get.lazyPut(() => ThemeController());
    Get.lazyPut<SideBarController>(() => SideBarController());
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
    Get.lazyPut<CategoryCollectionController>(
        () => CategoryCollectionController(),
        fenix: true);
    Get.lazyPut<PostController>(() => PostController(), fenix: true);
    Get.lazyPut<AgencyController>(() => AgencyController(), fenix: true);
    Get.lazyPut<AmenitiesController>(() => AmenitiesController(), fenix: true);
    Get.lazyPut<BlogController>(() => BlogController(), fenix: true);
    Get.lazyPut<DeveloperController>(() => DeveloperController(), fenix: true);
    Get.lazyPut<FaqController>(() => FaqController(), fenix: true);
    Get.lazyPut<FaqGroupController>(() => FaqGroupController(), fenix: true);
    Get.lazyPut<FloorPlanController>(() => FloorPlanController(), fenix: true);
    Get.lazyPut<ForumPostController>(() => ForumPostController(), fenix: true);
    Get.lazyPut<ForumPostCommentController>(() => ForumPostCommentController(),
        fenix: true);
    Get.lazyPut<OrderController>(() => OrderController(), fenix: true);
    Get.lazyPut<PageController>(() => PageController(), fenix: true);
    Get.lazyPut<ProductsController>(() => ProductsController(), fenix: true);
    Get.lazyPut<PostCommentController>(() => PostCommentController(),
        fenix: true);
    Get.lazyPut<ReviewController>(() => ReviewController(), fenix: true);
    Get.lazyPut<ProjectController>(() => ProjectController(), fenix: true);
    Get.lazyPut<WishListController>(() => WishListController(), fenix: true);
    Get.lazyPut<CustomerController>(() => CustomerController(), fenix: true);
    // Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
    Get.lazyPut<PaymentMethodController>(() => PaymentMethodController(),
        fenix: true);
    Get.lazyPut<ProjectNearByPlacesController>(
        () => ProjectNearByPlacesController(),
        fenix: true);
    // Get.lazyPut<LocationService>(() => LocationService(), fenix: true);
  }
}
