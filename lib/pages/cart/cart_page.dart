import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terence_app/controller/cart_controller.dart';
import 'package:terence_app/controller/popular_product_controller.dart';
import 'package:terence_app/controller/recommended_product_controller.dart';
import 'package:terence_app/routes/route_helper.dart';
import 'package:terence_app/utils/app_constants.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';
import 'package:terence_app/widgets/app_icon.dart';
import 'package:terence_app/widgets/big_text.dart';
import 'package:terence_app/widgets/small_text.dart';

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
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap:(){
                    Get.back();
              },
              child: AppIcon(
                icon: Icons.arrow_back_ios,
                iconColor: Colors.white,
                backgroundColor: AppColors.pink,
                iconSize: Dimensions.iconSize24,
              ),
            ),
            SizedBox(width: Dimensions.width20 * 5),
            GestureDetector(
              onTap: () {
                print("adasdsa");
                Get.toNamed(RouteHelper.getInitial());
              },
              child: AppIcon(
                icon: Icons.home_outlined,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                iconSize: Dimensions.iconSize24,
              ),
            ),
            AppIcon(
              icon: Icons.shopping_cart,
              iconColor: Colors.white,
              backgroundColor: AppColors.mainColor,
              iconSize: Dimensions.iconSize24,
            ),
          ]),
        ),
        Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                // color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    var cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (_, index) {
                          return SizedBox(
                            width: double.maxFinite,
                            height: 100,
                            child: Row(children: [
                              GestureDetector(
                                onTap: (){
                                  print("saadasd");
                                    var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(cartList[index].product!);
                                    if(popularIndex>=0){

                                      Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cart-page"));

                                    }else{
                                       var recommendedIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(cartList[index].product!);

                                       Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cart-page"));
                                    }
                                },
                                child: Container(
                                  width: Dimensions.height20 * 5,
                                  height: Dimensions.height20 * 5,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD +
                                                  cartController
                                                      .getItems[index].img)
                                          // AssetImage(
                                          //     "assets/images/karina.jpeg")
                                          ),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20)),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Expanded(
                                  child: SizedBox(
                                      height: Dimensions.height20 * 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          BigText(
                                            text: cartController
                                                .getItems[index].name,
                                            color: Colors.black54,
                                          ),
                                          SmallText(text: "Spicy"),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(
                                                  text: cartController
                                                      .getItems[index].price
                                                      .toString(),
                                                  color: Colors.redAccent),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: Dimensions.height10,
                                                    bottom: Dimensions.height10,
                                                    left: Dimensions.width10,
                                                    right: Dimensions.width10),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                .radius20),
                                                    color: Colors.white),
                                                child: Row(children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(
                                                          cartList[index]
                                                              .product!,
                                                          -1);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: AppColors.black,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Dimensions.width5,
                                                  ),
                                                  BigText(
                                                      text: cartList[index]
                                                          .quantity
                                                          .toString()),
                                                  SizedBox(
                                                    width: Dimensions.width5,
                                                  ),
                                                  GestureDetector(
                                                      onTap: () {
                                                        cartController.addItem(
                                                            cartList[index]
                                                                .product!,
                                                            1);
                                                      },
                                                      child: Icon(Icons.add,
                                                          color:
                                                              AppColors.black))
                                                ]),
                                              ),
                                            ],
                                          )
                                        ],
                                      )))
                            ]),
                          );
                        });
                  }),
                )))
      ],
    ),
    bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: 100,
            padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
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
                      top: Dimensions.height10,
                      bottom: Dimensions.height10,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(children: [
                   
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                    BigText(text: "RM ${cartController.totalAmount}"),
                    SizedBox(
                      width: Dimensions.width5,
                    ),
                 
                  ]),
                ),
                GestureDetector(
                    onTap: () {
                      // popularProduct.addItem(product);
                      print("tapped");
                      cartController.addToHistory();
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height10,
                          bottom: Dimensions.height10,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                      child: BigText(
                          text: "Check out",
                          color: Colors.white),
                    ))
              ],
            ),
          );
        },
      ),);
  }
}
