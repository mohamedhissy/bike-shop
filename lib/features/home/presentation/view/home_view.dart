import 'package:bike_shop/core/resources/manager_colors.dart';
import 'package:bike_shop/core/resources/manager_font_sizes.dart';
import 'package:bike_shop/core/resources/manager_font_weight.dart';
import 'package:bike_shop/core/resources/manager_height.dart';
import 'package:bike_shop/core/resources/manager_strings.dart';
import 'package:bike_shop/core/resources/manager_width.dart';
import 'package:bike_shop/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/resources/manager_assets.dart';

class SlantedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 10);            // اليسار أعلى بمقدار 10 بكسل
    path.lineTo(size.width, 0);    // اليمين فوق
    path.lineTo(size.width, size.height); // نزول إلى أسفل
    path.lineTo(0, size.height);           // عودة لليسار
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFF121829),
        bottomNavigationBar: Obx(
              () => Container( // 📢 لا تستخدم Clip هنا
            height: 70,
            width: double.infinity,
            child: Stack(
              clipBehavior: Clip.none, // ⭐ مهم جدًا
              children: [
                ClipPath(
                  clipper: SlantedClipper(),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFF191936).withOpacity(0.9),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(5, (index) {
                    IconData iconData;
                    switch (index) {
                      case 0:
                        iconData = Icons.directions_bike;
                        break;
                      case 1:
                        iconData = Icons.map;
                        break;
                      case 2:
                        iconData = Icons.shopping_cart;
                        break;
                      case 3:
                        iconData = Icons.person;
                        break;
                      case 4:
                        iconData = Icons.article;
                        break;
                      default:
                        iconData = Icons.home;
                    }

                    bool isSelected = controller.pageSelectedIndex.value == index;

                    return GestureDetector(
                      onTap: () => controller.navigateToScreen(index),
                      child: Transform.translate(
                        offset: isSelected ? Offset(0, -20) : Offset.zero,
                        child: Container(
                          width: 60,
                          height: 60,
                          alignment: Alignment.center,
                          child: isSelected
                              ? Transform.rotate(
                            angle: -0.1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF6DC8F3),
                                    Color(0xFF3A7BD5),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF6DC8F3).withOpacity(0.4),
                                    blurRadius: 8,
                                    spreadRadius: 1,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                iconData,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          )
                              : Icon(
                            iconData,
                            color: Colors.grey[400],
                            size: 24,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: ManagerColors.transparent,
          title: Text(
            ManagerStrings.chooseYourBike,
            style: TextStyle(
              fontSize: ManagerFontSizes.s20,
              fontWeight: ManagerFontWeight.bold,
              color: ManagerColors.white,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
              width: ManagerWidth.w44,
              height: ManagerHeight.h44,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                color: ManagerColors.white,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ManagerColors.primaryColor,
                    ManagerColors.secondaryColor,
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        // backgroundColor: const Color(0xFF121829),
        // الأزرق الغامق للخلفية الأساسية=
        body: Stack(
          children: [
            Container(
              child: Positioned(
                top: 240,
                left: 120,
                child: Transform.rotate(
                  angle: 0.4,
                  child: Container(
                    height: 800,
                    width: 340,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF0D47A1), // لون أزرق غامق
                          Color(0xFF42A5F5), // لون أزرق فاتح
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: 120),
                          width: MediaQuery.of(context).size.width *
                              1, // عرض تقريبي 95% من الشاشة
                          height: 280,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              image: AssetImage(ManagerAssets.cover1),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top: 140),
                          width: 320, // عرض تقريبي 95% من الشاشة
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              image: AssetImage(ManagerAssets.home),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 310),
                          child: Text(
                            ManagerStrings.off,
                            style: TextStyle(
                                fontSize: ManagerFontSizes.s26,
                                fontWeight: ManagerFontWeight.bold,
                                color: ManagerColors.homeTextColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 380, left: 10),
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            List<String> imagePaths = [
                              ManagerAssets.all,
                              ManagerAssets.catigory1,
                              ManagerAssets.catigory2,
                              ManagerAssets.catigory3,
                              ManagerAssets.catigory4,
                            ];
                            return Transform.translate(
                              offset: Offset(2, -index * 10),
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFF353F54),
                                      Color(0xFF222834),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(imagePaths[index]),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 460),
                        child: GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 4,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (context, index) {
                            final product = controller.products[index];
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                      image:
                                          AssetImage(product.backgroundImage),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 40,
                                  child: Transform.scale(
                                    scale: 1.1,
                                    child: Container(
                                      width: 120,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(16),
                                        image: DecorationImage(
                                          image:
                                              AssetImage(product.productImage),
                                          fit: BoxFit
                                              .contain, // ❗نحتفظ بـ contain ليظهر كل الصورة
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 130,
                                  left: 30,
                                  child: Text(
                                    product.title,
                                    style: TextStyle(
                                      fontWeight: ManagerFontWeight.regular,
                                      fontSize: ManagerFontSizes.s16,
                                      color: ManagerColors.homeTextColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 160,
                                  left: 30,
                                  child: Text(
                                    product.subtitle,
                                    style: TextStyle(
                                      fontWeight: ManagerFontWeight.bold,
                                      fontSize: ManagerFontSizes.s16,
                                      color: ManagerColors.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 190,
                                  left: 30,
                                  child: Text(
                                    product.price,
                                    style: TextStyle(
                                      fontWeight: ManagerFontWeight.regular,
                                      fontSize: ManagerFontSizes.s16,
                                      color: ManagerColors.homeTextColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 140,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.toggleFavorite(index);
                                    },
                                    child: Obx(() => Icon(
                                          Icons.favorite_border,
                                          color:
                                              controller.isFavoriteList[index]
                                                  ? Colors.blue
                                                  : Colors.white,
                                          size: 30,
                                        )),
                                  ),
                                ),
                              ],
                            );
                          },
                          itemCount: controller.products.length,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
