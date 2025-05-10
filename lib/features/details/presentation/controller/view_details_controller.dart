import 'package:get/get.dart';

import '../../../../core/storage/local/database/shared_preferences/app_settings_shared_preferences.dart';

class DetailseController extends GetxController {
  AppSettingsSharedPreferences appSettingsSharedPreferences =
      AppSettingsSharedPreferences();

  bool showDetails = false;
  int selectedTab = -1;
  double detailsPosition = -200;

  void resetToButtonsOnly() {
    detailsPosition = -200;
    selectedTab = -1;       // لإلغاء التحديد عن أي زر
    update();
  }

  void showFullDetails() {
    detailsPosition = 0;
    update();
  }




  void toggleDetailsView() {
    showDetails = true;
    update();
  }


  void toggleDetails() {
    showDetails = !showDetails;
    update(); // 🔁 ضروري لإعادة بناء الواجهة
  }
}
