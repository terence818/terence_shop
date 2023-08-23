

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terence_app/base/custom_button.dart';
import 'package:terence_app/routes/route_helper.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';

class OrderSuccessPage extends StatelessWidget {
  final String orderID;
  final int status;
  OrderSuccessPage({required this.orderID, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == 0) {
      Future.delayed(Duration(seconds: 1), () {
        //
      });
    }
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: Dimensions.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                    status == 1
                        ? Icons.check_box_outlined
                        : Icons.warning_amber_outlined,
                    size: 100,
                    color: AppColors.mainColor),
                Image.asset(
                  status == 1
                      ? "assets/image/checked.png"
                      : "assets/image/warning.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: Dimensions.height30,
                ),
                Text(
                    status == 1
                        ? "You placed the order successfully"
                        : "Your order failed",
                    style: TextStyle(fontSize: Dimensions.font26)),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.height10,
                      vertical: Dimensions.height10),
                  child: Text(
                    status == 1 ? "Successful order" : "Failed order",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                        color: Theme.of(context).disabledColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Padding(
                  padding: EdgeInsets.all(Dimensions.height20),
                  child: CustomButton(
                    buttonText: "Back to Home",
                    onPressed: () => Get.offAllNamed(RouteHelper.getInitial()),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
