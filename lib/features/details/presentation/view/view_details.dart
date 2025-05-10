import 'package:flutter/material.dart';
import 'package:bike_shop/core/resources/manager_assets.dart';
import 'package:bike_shop/core/resources/manager_colors.dart';
import 'package:bike_shop/core/resources/manager_font_sizes.dart';
import 'package:bike_shop/core/resources/manager_font_weight.dart';
import 'package:get/get.dart';
import '../../../../core/resources/manager_height.dart';
import '../../../../core/resources/manager_width.dart';
import '../../../../routes/routes.dart';
import '../../../home/presentation/controller/home_controller.dart';
import '../controller/view_details_controller.dart';

class DetailsView extends StatelessWidget {
  final Product product;

  const DetailsView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailseController>(
      builder: (controller) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color(0xFF121829),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                Container(
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
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.homeView);
                    },
                    icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                  ),
                ),
                SizedBox(width: 60),
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: ManagerFontSizes.s16,
                    fontWeight: ManagerFontWeight.w600,
                    color: ManagerColors.white,
                  ),
                ),
              ],
            ),
          ),
          body: GestureDetector(
            onTap: (){
              controller.resetToButtonsOnly();
            },
            child: Stack(
              children: [
                // الخلفية
                Positioned(
                  right: -280,
                  child: Container(
                    width: 900,
                    height: 900,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ManagerAssets.pag1),
                      ),
                    ),
                  ),
                ),

                // صورة الدراجة
                Positioned(
                  top: 250,
                  left: 10,
                  child: Container(
                    width: 380,
                    height: 270,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(product.productImage),
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  bottom: controller.detailsPosition,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 300,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
                    decoration: BoxDecoration(
                      color: Color(0xFF1A2235),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // الزرين داخل نفس الحاوية
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              // color: Color(0xFF121829),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // زر Description
                                Container(
                                  width: 140,
                                  height: 50,
                                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                                  decoration: BoxDecoration(
                                    color: controller.selectedTab == 0 ? Colors.black87 : Color(0xFF121829),
                                    borderRadius: BorderRadius.circular(12),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.white.withOpacity(0.08),
                                    //     offset: Offset(-2, -2),
                                    //     blurRadius: 4,
                                    //   ),
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.4),
                                    //     offset: Offset(2, 2),
                                    //     blurRadius: 6,
                                    //   ),
                                    // ],
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.selectedTab = 0; // أو 1 حسب الزر
                                      controller.showFullDetails();
                                      controller.update();
                                    },
                                    child: Text(
                                      "Description",
                                      style: TextStyle(
                                        color: controller.selectedTab == 0 ? Colors.blue : ManagerColors.grey,
                                        fontWeight: controller.selectedTab == 0 ? ManagerFontWeight.regular : ManagerFontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(width: 12),

                                // زر Specification
                                Container(
                                  width: 140,
                                  height: 50,
                                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                                  decoration: BoxDecoration(
                                    color: controller.selectedTab == 1 ? Colors.black87 : Color(0xFF121829),
                                    borderRadius: BorderRadius.circular(12),
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.white.withOpacity(0.08),
                                    //     offset: Offset(-2, -2),
                                    //     blurRadius: 4,
                                    //   ),
                                    //   BoxShadow(
                                    //     color: Colors.black.withOpacity(0.4),
                                    //     offset: Offset(2, 2),
                                    //     blurRadius: 6,
                                    //   ),
                                    // ],
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.selectedTab = 1; // أو 1 حسب الزر
                                      controller.showFullDetails();
                                      controller.update();

                                    },
                                    child: Text(
                                      "Specification",
                                      style: TextStyle(
                                        color: controller.selectedTab == 1 ? Colors.blue : ManagerColors.grey,
                                          fontWeight: controller.selectedTab == 1 ? ManagerFontWeight.regular : ManagerFontWeight.bold

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 12),

                        // محتوى التفاصيل حسب الزر المختار
                        Expanded(
                          child: controller.selectedTab == -1
                              ? SizedBox.shrink() // لا شيء ظاهر
                              : controller.selectedTab == 0
                              ? Text(
                            "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles’ 130-year history. It combines agile, dynamic performance with a 16-speed Shimano Claris drivetrain.",
                            style: TextStyle(color: Colors.white.withOpacity(0.85), height: 1.4),
                          )
                              : Text(
                            "- Frame: Steel\n- Design: Black & White Chequered\n- Gear: 16-speed Shimano Claris\n- Suitable for urban environments.",
                            style: TextStyle(color: Colors.white.withOpacity(0.85), height: 1.4),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product.price, style: TextStyle(color: Colors.white, fontSize: 20)),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, Routes.cartView);
                              },
                              child: Text("Add to Cart"),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                backgroundColor: Colors.blueAccent,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )

                // // زر إظهار/إخفاء التفاصيل
                // Positioned(
                //   bottom: 0,
                //   left: 0,
                //   right: 0,
                //   child: Center(
                //     child: Container(
                //       width: double.infinity,
                //       height: 100,
                //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                //       decoration: BoxDecoration(
                //         color: Color(0xFF1A2235),
                //         borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                //       ),
                //       child: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           Container(
                //             height: 56,
                //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //             decoration: BoxDecoration(
                //               color:Color(0xFF121829),
                //               borderRadius: BorderRadius.circular(12),
                //               // boxShadow: [
                //               //   BoxShadow(
                //               //     color: Colors.white,
                //               //     blurRadius: 6,
                //               //     offset: Offset(2, 2),
                //               //   ),
                //               // ],
                //             ),
                //             child: ElevatedButton(
                //               onPressed: controller.toggleDetails,
                //               child: Text("Description",style: TextStyle(
                //                 color: ManagerColors.grey,
                //               ),),
                //               style: ElevatedButton.styleFrom(
                //                 elevation: 0,
                //                 backgroundColor: ManagerColors.transparent,
                //               ),
                //             ),
                //           ),
                //           SizedBox(width: 12),
                //           Container(
                //             height: 56,
                //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //             decoration: BoxDecoration(
                //               color:Color(0xFF121829),
                //               borderRadius: BorderRadius.circular(12),
                //               // boxShadow: [
                //               //   BoxShadow(
                //               //     color: Colors.white,
                //               //     blurRadius: 6,
                //               //     offset: Offset(2, 2),
                //               //   ),
                //               // ],
                //             ),
                //             child: ElevatedButton(
                //               onPressed: controller.toggleDetails,
                //               child: Text("Specification",style: TextStyle(
                //                 color: ManagerColors.grey,
                //               ),),
                //               style: ElevatedButton.styleFrom(
                //                 elevation: 0,
                //                 backgroundColor: ManagerColors.transparent,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                //
                // // تفاصيل المنتج المتحركة
                // AnimatedPositioned(
                //   duration: Duration(milliseconds: 500),
                //   curve: Curves.easeInOut,
                //   bottom: controller.showDetails ? 0 : -300,
                //   left: 0,
                //   right: 0,
                //   child: Container(
                //     height: 300,
                //     padding: EdgeInsets.all(20),
                //     decoration: BoxDecoration(
                //       color: Color(0xFF1A2235),
                //       borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                //     ),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Row(
                //           children: [
                //             Text("Description", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                //             SizedBox(width: 20),
                //             Text("Specification", style: TextStyle(color: Colors.grey)),
                //           ],
                //         ),
                //         SizedBox(height: 10),
                //         Text(
                //           "PEUGEOT - LR01",
                //           style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                //         ),
                //         SizedBox(height: 8),
                //         Text(
                //           "The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles’ 130-year history..."
                //               "This city bike also features a 16-speed Shimano Claris drivetrain.",
                //           style: TextStyle(color: Colors.white.withOpacity(0.8)),
                //         ),
                //         Spacer(),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text("\$1,999.99", style: TextStyle(color: Colors.white, fontSize: 20)),
                //             ElevatedButton(
                //               onPressed: () {},
                //               child: Text("Add to Cart"),
                //               style: ElevatedButton.styleFrom(
                //                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                //                 backgroundColor: Colors.blueAccent,
                //               ),
                //             )
                //           ],
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
    );
  }
}
