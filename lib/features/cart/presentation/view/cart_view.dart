import 'package:flutter/material.dart';

import '../../../../core/resources/manager_colors.dart';
import '../../../../core/resources/manager_font_sizes.dart';
import '../../../../core/resources/manager_font_weight.dart';
import '../../../../routes/routes.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Navigator.pushReplacementNamed(context, Routes.detailsView);
                },
                icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
              ),
            ),
            SizedBox(width: 60),
            Text(
              'My Shopping Cart',
              style: TextStyle(
                fontSize: ManagerFontSizes.s20,
                fontWeight: ManagerFontWeight.w600,
                color: ManagerColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
