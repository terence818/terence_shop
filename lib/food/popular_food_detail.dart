import 'package:flutter/material.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';
import 'package:terence_app/widgets/app_column.dart';
import 'package:terence_app/widgets/app_icon.dart';
import 'package:terence_app/widgets/big_text.dart';
import 'package:terence_app/widgets/expandable_text_widget.dart';
import 'package:terence_app/widgets/icon_and_text_widget.dart';
import 'package:terence_app/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/karina2.jpg'))),
              )),
          //icon widgets
          Positioned(
            top: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios_new),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ]),
          ),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 70, // container height
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(text: "Aespa Karina"),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Introduce"),
                       SizedBox(
                        height: Dimensions.height20,
                      ),
                      // expandable text
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                                  text:
                                      "The issue with your ExpandableTextWidget is that you have not set the maxLines property of the SmallText widget to allow the text to wrap to multiple lines. By default, the maxLines property of a Text widget (which is a parent of SmallText) is set to 1, which causes the text to be displayed in a single line.To fix this issue, you need to set the maxLines property of the SmallText widget to null or a value greater than 1. This will allow the text to wrap to multiple lines based on the available width. You can do this by adding the maxLines property to the SmallText widget in your build method as shown below:")))
                    ],
                  ))),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white),
              child: Row(children: [
                Icon(
                  Icons.remove,
                  color: AppColors.black,
                ),
                SizedBox(
                  width: Dimensions.width5,
                ),
                BigText(text: "0"),
                SizedBox(
                  width: Dimensions.width5,
                ),
                Icon(Icons.add, color: AppColors.black)
              ]),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: BigText(text: "\RM10 | Add to cart", color: Colors.white),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.pink),
            )
          ],
        ),
      ),
    );
  }
}
