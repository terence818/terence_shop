import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terence_app/controller/order_controller.dart';
import 'package:terence_app/models/order_model.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';

class ViewOrder extends StatelessWidget {
  final bool isCurrent;
  const ViewOrder({Key? key, required this.isCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrderController>(builder: (orderController) {
        if (orderController.isLoading == false) {
          late List<OrderModel> orderList;
          if (orderController.currentOrderList.isNotEmpty) {
            orderList = isCurrent
                ? orderController.currentOrderList.reversed.toList()
                : orderController.historyOrderList.reversed.toList();
          }
          return SizedBox(
            width: Dimensions.screenWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width10 / 2,
                  vertical: Dimensions.height10 / 2),
              child: ListView.builder(
                  itemCount: orderList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => null,
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("#order ID " +
                                    orderList[index].id.toString()),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.mainColor,
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius20 / 4)),
                                        child: Container(
                                          margin: EdgeInsets.all(
                                              Dimensions.height10 / 2),
                                          child: Text(
                                            "${orderList[index].orderStatus}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        )),
                                    SizedBox(
                                      height: Dimensions.height10 / 2,
                                    ),
                                    InkWell(
                                        onTap: () => null,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20 / 4),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                          child: Container(
                                              margin: EdgeInsets.all(
                                                  Dimensions.height10 / 2),
                                              child: Text('Track order')),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: Dimensions.height10),
                        ],
                      ),
                    );
                  }),
            ),
          );
        } else {
          return Text("loading");
        }
      }),
    );
  }
}
