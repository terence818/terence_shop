import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terence_app/base/no_data_page.dart';
import 'package:terence_app/base/show_custom_nackbar.dart';
import 'package:terence_app/controller/auth_controller.dart';
import 'package:terence_app/controller/cart_controller.dart';
import 'package:terence_app/controller/location_controller.dart';
import 'package:terence_app/controller/order_controller.dart';
import 'package:terence_app/controller/popular_product_controller.dart';
import 'package:terence_app/controller/recommended_product_controller.dart';
import 'package:terence_app/controller/user_controller.dart';
import 'package:terence_app/models/place_order_model.dart';
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
     Get.find<UserController>().getUserInfo();
     Get.find<LocationController>().getAddressList();

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
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  SizedBox(width: Dimensions.width20 * 5),
                  GestureDetector(
                    onTap: () {
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
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getItems.length>0? Positioned(
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
                    child:
                        GetBuilder<CartController>(builder: (cartController) {
                      var cartList = cartController.getItems;
                      return ListView.builder(
                          itemCount: cartList.length,
                          itemBuilder: (_, index) {
                            return SizedBox(
                              width: double.maxFinite,
                              height: 100,
                              child: Row(children: [
                                GestureDetector(
                                  onTap: () {
                                  
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(cartList[index].product!);
                                    if (popularIndex >= 0) {
                                      Get.toNamed(RouteHelper.getPopularFood(
                                          popularIndex, "cart-page"));
                                    } else {
                                      var recommendedIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(cartList[index].product!);

                                      if (recommendedIndex < 0) {
                                        Get.snackbar("History product",
                                            "Product review is not available for history products",
                                            backgroundColor:
                                                AppColors.mainColor,
                                            colorText: Colors.white);
                                      } else {
                                        Get.toNamed(
                                            RouteHelper.getRecommendedFood(
                                                recommendedIndex, "cart-page"));
                                      }
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                    text: cartController
                                                        .getItems[index].price
                                                        .toString(),
                                                    color: Colors.redAccent),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: Dimensions.height10,
                                                      bottom:
                                                          Dimensions.height10,
                                                      left: Dimensions.width10,
                                                      right:
                                                          Dimensions.width10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimensions
                                                                  .radius20),
                                                      color: Colors.white),
                                                  child:cartController.getItems.length>0?Row(children: [
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
                                                          cartController
                                                              .addItem(
                                                                  cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                        },
                                                        child: Icon(Icons.add,
                                                            color: AppColors
                                                                .black))
                                                  ]):Container() ,
                                                ),
                                              ],
                                            )
                                          ],
                                        )))
                              ]),
                            );
                          });
                    }),
                  ))
                  ):NoDataPage(text: "Your cart is empty!");
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
          return Container(
            height: 150,
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
            child: cartController.getItems.length>0?Column(
              children: [
                InkWell(),
                Row(
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
                      if(Get.find<AuthController>().userLoggedIn()){

                        if(Get.find<LocationController>().addressList.isEmpty){
                          Get.toNamed(RouteHelper.getAddressPage());
                        } else{
                          // Get.offNamed(RouteHelper.getInitial());
                          var location = Get.find<LocationController>().getUserAddress();
                          var cart = Get.find<CartController>().getItems;
                          var user = Get.find<UserController>().userModel;
                          print("location " + location.toJson().toString());
                          PlaceOrderBody placeOrder =PlaceOrderBody(
                              cart:cart,
                              orderAmount: 100.0,
                              orderNote:"Not about the food",
                              address: location.address,
                              latitude:location.latitude,
                              longitude:location.longitude,
                              contactPersonNumber: user!.phone,
                              contactPersonName: user.name,
                              scheduleAt:'',
                              distance:10.0,



                          );
                       
                          Get.find<OrderController>().placeOrder(placeOrder,_callback);
                        }
                      
                      // cartController.addToHistory();
                      } else {
                         Get.toNamed(RouteHelper.getSignInPage());
                      }
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
                      child: BigText(text: "Check out", color: Colors.white),
                    ))
              ],
            ),
              ],

            ):Container()
          );
        },
      ),
    );
  }

  void _callback(bool isSuccess, String message, String orderID) {
    if(isSuccess){
         Get.find<CartController>().clear();
        //  Get.find<CartController>().removeCartSharedPreference();
         Get.find<CartController>().addToHistory();
         Get.offNamed(RouteHelper.getPaymentPage(orderID,Get.find<UserController>().userModel!.id));
    } else {
      showCustomSnackBar(message);
    }
  }
}
