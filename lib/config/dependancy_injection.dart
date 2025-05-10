import 'package:bike_shop/features/cart/presentation/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';
import '../features/details/presentation/controller/view_details_controller.dart';
import '../features/home/presentation/controller/home_controller.dart';

initModule() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppSettingsSharedPreferences().initPreferences();
}

initHome() {
  Get.put<HomeController>(HomeController());
}

disposeHome() {

}

initDetailse() {
  Get.put<DetailseController>(DetailseController());
}

disposeDetailse() {

}

initCart() {
  Get.put<CartController>(CartController());
}

disposeCart() {

}



