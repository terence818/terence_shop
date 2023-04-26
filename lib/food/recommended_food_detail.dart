import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';
import 'package:terence_app/widgets/app_icon.dart';
import 'package:terence_app/widgets/big_text.dart';
import 'package:terence_app/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 60,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.clear),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ]),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Container(
                // margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                child: Center(
                    child:
                        BigText(size: Dimensions.font26, text: "Aespa Karina")),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20))),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.orange,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/karina3.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: ExpandableTextWidget(
                    text:
                        // "Hi"
                        "The issue with your ExpandableTextWidget is that you have not set the maxLines property of the SmallText widget to allow the text to wrap to multiple lines. By default, the maxLines property of a Text widget (which is a parent of SmallText) is set to 1, which causes the text to be displayed in a single line.To fix this issue, you need to set the maxLines property of the SmallText widget to null or a value greater than 1. This will allow the text to wrap to multiple lines based on the available width. You can do this by adding the maxLines property to the SmallText widget in your build method as shown below:The issue with your ExpandableTextWidget is that you have not set the maxLines property of the SmallText widget to allow the text to wrap to multiple lines. By default, the maxLines property of a Text widget (which is a parent of SmallText) is set to 1, which causes the text to be displayed in a single line.To fix this issue, you need to set the maxLines property of the SmallText widget to null or a value greater than 1. This will allow the text to wrap to multiple lines based on the available width. You can do this by adding the maxLines property to the SmallText widget in your build method as shown below:The issue with your ExpandableTextWidget is that you have not set the maxLines property of the SmallText widget to allow the text to wrap to multiple lines. By default, the maxLines property of a Text widget (which is a parent of SmallText) is set to 1, which causes the text to be displayed in a single line.To fix this issue, you need to set the maxLines property of the SmallText widget to null or a value greater than 1. This will allow the text to wrap to multiple lines based on the available width. You can do this by adding the maxLines property to the SmallText widget in your build method as shown below:"),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.pink,
                  icon: Icons.remove),
              BigText(text: "RM12.88" + " X" + " 0"),
              AppIcon(
                  iconSize: Dimensions.iconSize24,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.pink,
                  icon: Icons.add)
            ],
          ),
        ),
        Container(
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
                child: Icon(
                  Icons.favorite,
                  color: AppColors.pink,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                child:
                    BigText(text: "\RM10 | Add to cart", color: Colors.white),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.pink),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
