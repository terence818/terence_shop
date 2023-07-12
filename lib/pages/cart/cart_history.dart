import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terence_app/controller/cart_controller.dart';
import 'package:terence_app/utils/app_constants.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';
import 'package:terence_app/widgets/app_icon.dart';
import 'package:terence_app/widgets/big_text.dart';
import 'package:terence_app/widgets/small_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();

    Map<String, int> cartItemsPerOrder = {};

    for (int i = 0; i < getCartHistoryList.length; i++) {
      String time = getCartHistoryList[i].time;

      if (cartItemsPerOrder.containsKey(time)) {
        cartItemsPerOrder.update(time, (value) => value + 1);
      } else {
        cartItemsPerOrder[time] = 1;
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();

    var listCounter = 0;
    // for (int x = 0; x < cartItemsPerOrder.length; x++) {
    //   for (int y = 0; y < itemsPerOrder[x]; y++) {
    //     print('inner loop y index' + y.toString());
    //     print('My order is' + getCartHistoryList[listCounter++].toString());
    //   }
    // }
    return Scaffold(
        body: Column(
      children: [
        Container(
            height: 100,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BigText(text: "Cart History", color: Colors.white),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: AppColors.mainColor,
                    backgroundColor: Colors.yellowAccent,
                  )
                ])),
        Expanded(
            child: Container(
                height: 500,
                margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: ListView(
                    children: [
                      for (int i = 0; i < itemsPerOrder.length; i++)
                        Container(
                          height:120,
                          margin: EdgeInsets.only(bottom: Dimensions.height20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: "05/02/2021"),
                              SizedBox(height: Dimensions.height10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(itemsPerOrder[i],
                                        (index) {
                                      if (listCounter <
                                          getCartHistoryList.length) {
                                        listCounter++;
                                      }
                                      return index <= 2
                                          ? Container(
                                              height: 80,
                                              width: 80,
                                              margin: EdgeInsets.only(
                                                  right:
                                                      Dimensions.width10 / 2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          Dimensions.radius15 /
                                                              2),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          AppConstants
                                                                  .BASE_URL +
                                                              AppConstants
                                                                  .UPLOAD +
                                                              getCartHistoryList[
                                                                      listCounter -
                                                                          1]
                                                                  .img!))),
                                            )
                                          : Container();
                                    }),
                                  ),
                                  Container(
                                    height:80,
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children:[
                                          SmallText(text: "Total"),
                                          BigText(text: itemsPerOrder[i].toString()+" Items", color:AppColors.titleColor)
                                      ],)
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                )))
      ],
    ));
  }
}
