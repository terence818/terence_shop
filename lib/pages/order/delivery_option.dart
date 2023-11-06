import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terence_app/controller/order_controller.dart';
import 'package:terence_app/utils/dimensions.dart';
import 'package:terence_app/utils/styles.dart';

class DeliveryOption extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;

  const DeliveryOption(
      {Key? key,
      required this.value,
      required this.title,
      required this.amount,
      required this.isFree})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder:(orderController){
      return Row(
      children: [
        Radio(
          onChanged: (String? value)=>orderController.setDeliveryType(value!),
          groupValue: orderController.orderType,
          value: value,
          activeColor: Theme.of(context).primaryColor,
        ),
        SizedBox(
          width: Dimensions.width10,
        ),
        Text(title, style: robotoRegular),
        SizedBox(
          width: Dimensions.width10,
        ),
        Text(
            '(${(value == 'take aways' || isFree) ? 'free' : '\$${amount / 10}'})',
            style: robotoMedium),
      ],
    );
    } );
  }
}
