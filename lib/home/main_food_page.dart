import 'package:flutter/material.dart';
import 'package:terence_app/home/food_page_body.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';
import 'package:terence_app/widgets/big_text.dart';
import 'package:terence_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height30, bottom: Dimensions.height15),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                            text: "Malaysia", color: AppColors.mainColor, size: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmallText(
                              text: "Seremban",
                              color: Colors.black54,
                            ),
                            SizedBox(width: 10),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: Dimensions.radius20,
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.width45,
                        height: Dimensions.height45,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor),
                        child:
                            Icon(Icons.search, color: Colors.white, size: 20),
                      ),
                    )
                  ],
                ))),
        Expanded(
            child: SingleChildScrollView(
                child: FoodPageBody(),
        ))
      ],
    ));
  }
}
