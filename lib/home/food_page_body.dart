import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terence_app/controller/popular_product_controller.dart';
import 'package:terence_app/controller/recommended_product_controller.dart';
import 'package:terence_app/food/popular_food_detail.dart';
import 'package:terence_app/routes/route_helper.dart';
import 'package:terence_app/utils/app_constants.dart';
import 'package:terence_app/utils/colors.dart';
import 'package:terence_app/utils/dimensions.dart';
import 'package:terence_app/widgets/app_column.dart';
import 'package:terence_app/widgets/big_text.dart';
import 'package:terence_app/widgets/icon_and_text_widget.dart';
import 'package:terence_app/widgets/small_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPagevalue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.PageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPagevalue = pageController.page!;
        // print("Current value is" + _currPagevalue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  // color: Colors.redAccent,
                  height: Dimensions.PageView,

                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                )
              : CircularProgressIndicator(color: AppColors.pink);
        }),
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return new DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPagevalue,
            decorator: DotsDecorator(
              activeColor: AppColors.pink,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius5)),
            ),
          );
        }),
        //Popular text
        SizedBox(height: Dimensions.height10),
        Container(
            margin: EdgeInsets.only(left: Dimensions.width30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Recommended"),
                SizedBox(width: Dimensions.width10),
                Container(
                    margin: const EdgeInsets.only(bottom: 3),
                    child: BigText(text: ".", color: Colors.black)),
                SizedBox(width: Dimensions.width10),
                Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: SmallText(text: "Food pairing")),
              ],
            )),
        //recommended food
        //list of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index, "home"));
                      },
                      child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width10,
                              top: Dimensions.height10),
                          child: Row(
                            children: [
                              //image section
                              Container(
                                width: Dimensions.ListViewImgSize,
                                height: Dimensions.ListViewImgSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius30),
                                  color: Colors.white,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  child: Image.network(
                                    AppConstants.BASE_URL +
                                        AppConstants.UPLOAD +
                                        recommendedProduct
                                            .recommendedProductList[index].img,
                                    fit: BoxFit.cover,
                                    // errorBuilder: (_, error, stackTrace) {
                                    //   print('Error loading image: $error');
                                    //   return Image.asset(
                                    //     'assets/images/karina.jpeg',
                                    //     fit: BoxFit.cover,
                                    //   );
                                    // },
                                  ),
                                ),
                              ),
                              //text container
                              Expanded(
                                child: Container(
                                  height: Dimensions.ListViewTextContSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            Dimensions.radius20),
                                        bottomRight: Radius.circular(
                                            Dimensions.radius20)),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.width10,
                                          right: Dimensions.width10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          BigText(
                                              text: recommendedProduct
                                                  .recommendedProductList[index]
                                                  .name),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          SmallText(
                                              text: "Price: RM " +
                                                  recommendedProduct
                                                      .recommendedProductList[
                                                          index]
                                                      .price
                                                      .toString()),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconAndTextWidget(
                                                  icon: Icons.circle_sharp,
                                                  text: "Normal",
                                                  iconColor: AppColors.orange),
                                              IconAndTextWidget(
                                                  icon: Icons.location_on,
                                                  text: "1.7km",
                                                  iconColor: AppColors.pink),
                                              IconAndTextWidget(
                                                  icon: Icons
                                                      .access_alarm_rounded,
                                                  text: "32min",
                                                  iconColor: AppColors.blue),
                                            ],
                                          )
                                        ],
                                      )),
                                ),
                              )
                            ],
                          )),
                    );
                  })
              : CircularProgressIndicator(color: AppColors.pink);
        })
      ],
    );
  }

  Widget _buildPageItem(int index, popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPagevalue.floor()) {
      var currScale = 1 - (_currPagevalue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPagevalue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPagevalue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPagevalue.floor() - 1) {
      var currScale = 1 - (_currPagevalue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.getPopularFood(index, "home"));
          },
          child: Container(
              height: Dimensions.PageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    // image: AssetImage("assets/images/karina.jpeg"),
                 
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD +
                        popularProduct.img!),
                  ))
                  ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.PageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 10.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0))
                ]),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              child: AppColumn(text: popularProduct.name!),
            ),
          ),
        )
      ]),
    );
  }
}
