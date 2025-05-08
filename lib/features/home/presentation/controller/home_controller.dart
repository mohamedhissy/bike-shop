import 'package:get/get.dart';

import '../../../../core/resources/manager_assets.dart';
import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../../../../routes/routes.dart';

class HomeController extends GetxController {
  AppSettingsSharedPreferences appSettingsSharedPreferences = AppSettingsSharedPreferences();

  // NEW: Create a list of favorite flags
  var isFavoriteList = <bool>[].obs;

  var pageSelectedIndex = 2.obs;
  var currentPageIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize all favorites as false
    isFavoriteList.assignAll(List.generate(products.length, (index) => false));
  }

  void toggleFavorite(int index) {
    isFavoriteList[index] = !isFavoriteList[index];
    update(); // Update UI
  }


  final Map<int, String> routes = {
    0: Routes.homeView,
    1: Routes.homeView,
    2: Routes.homeView,
    3: Routes.homeView,
    4: Routes.homeView, // Profile tab
  };

  void navigateToScreen(int index) {
    pageSelectedIndex.value = index;

    Get.toNamed(routes[index]!);
  }

  List<Product> products = [
    Product(
      backgroundImage: ManagerAssets.cover2,
      productImage: ManagerAssets.product1,
      title: 'Road Helmet',
      subtitle: 'SMITH - Trade',
      price: '\$ 1,999.99',
    ),
    Product(
      backgroundImage: ManagerAssets.cover2,
      productImage: ManagerAssets.product2,
      title: 'Road Bike',
      subtitle: 'PEUGEOT - LR01 ',
      price: '\$ 2,499.99',
    ),
    Product(
      backgroundImage: ManagerAssets.cover2,
      productImage: ManagerAssets.home,
      title: 'Running Shoes',
      subtitle: 'NIKE - AirMax',
      price: '\$ 149.99',
    ),
    Product(
      backgroundImage: ManagerAssets.cover2,
      productImage: ManagerAssets.product3,
      title: 'PILOT - CHROMOLY',
      subtitle: 'APPLE - Series 8',
      price: '\$ 399.99',
    ),
  ];



  void onPageChanged(int index) {
    currentPageIndex.value = index;
  }
}

class Product {
  final String backgroundImage;
  final String productImage;
  final String title;
  final String subtitle;
  final String price;

  Product({
    required this.backgroundImage,
    required this.productImage,
    required this.title,
    required this.subtitle,
    required this.price,
  });
}
