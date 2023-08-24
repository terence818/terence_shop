import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terence_app/controller/auth_controller.dart';
import 'package:terence_app/controller/order_controller.dart';
import 'package:terence_app/pages/order/view_order.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn) {
      _tabController = TabController(length: 2, vsync: this);
      Get.find<OrderController>().getOrderList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My orders",
        ),
        backgroundColor: AppColors.mainColor,
      ),
      body: Column(children: [
        Container(
          width: Dimensions.screenWidth,
          child: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            indicatorWeight: 3,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: AppColors.yellowColor,
            controller: _tabController,
            tabs: [Tab(text: "current"), Tab(text: "history")],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              ViewOrder(isCurrent: true),
              ViewOrder(isCurrent: false),
            ],
          ),
        )
      ]),
    );
  }
}
