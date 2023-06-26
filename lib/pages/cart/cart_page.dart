import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';
import 'package:terence_app/widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: Dimensions.height20 * 3,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            AppIcon(
              icon: Icons.arrow_back_ios,
              iconColor: Colors.white,
              backgroundColor: AppColors.pink,
              iconSize: Dimensions.iconSize24,
            ),
            SizedBox(width:Dimensions.width20*5),
              AppIcon(
              icon: Icons.home_outlined,
              iconColor: Colors.white,
              backgroundColor: AppColors.pink,
              iconSize: Dimensions.iconSize24,
            ),
              AppIcon(
              icon: Icons.shopping_cart,
              iconColor: Colors.white,
              backgroundColor: AppColors.pink,
              iconSize: Dimensions.iconSize24,
            ),
          ]),
        )
      ],
    ));
  }
}
