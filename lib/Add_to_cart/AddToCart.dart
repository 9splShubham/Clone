import 'package:clone/Add_to_cart/Cart%20Content.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_config.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:clone/login/DbHelper.dart';
import 'package:clone/place_order/place_order.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  var dbHelper;
  List<ModelCartProduct> mCartModel = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    dbHelper = DbHelper();
    await dbHelper
        .getUserCart(sp.getInt(AppConfig.textUserId))
        .then((List<ModelCartProduct> cartData) {
      if (cartData.isNotEmpty) {
        setState(() {
          mCartModel = cartData;
          print("----------Hiiiii>");
        });
      } else {
        setState(() {
          mCartModel = [];
          print("---------->");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        elevation: 0,
        title: Text(
          AppString.textMyCart,
          style: getTextStyle(AppFonts.regular, AppSize.textSize18),
        ),
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: mCartModel.length,
                    itemBuilder: (context, index) {
                      ModelCartProduct item = mCartModel[index];
                      print("------>info");

                      return Card(
                        child: Container(
                          height: 120,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Image.network(
                                      item.productImage!,
                                      height: 90,
                                      width: 90,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.productName!.toString(),
                                        style: getTextStyle(
                                            AppFonts.regularBlack2,
                                            AppSize.textSize14),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "\$${item.productPrice!.toString()}",
                                        style: getTextStyle(
                                            AppFonts.regularGreen,
                                            AppSize.textSize18),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Container(
                                            height: 40,
                                            width: 110,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColor.colorgrey),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                InkWell(
                                                    onTap: () {},
                                                    child: Image.asset(
                                                      AppImage.minus,
                                                      height: 10,
                                                      width: 10,
                                                    )),
                                                VerticalDivider(
                                                  color: AppColor.colorgrey,
                                                  thickness: 1,
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 3),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 3,
                                                      vertical: 2),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3),
                                                      color: Colors.white),
                                                  child: Text(
                                                    '3',
                                                    style: getTextStyle(
                                                        AppFonts.regularBlack,
                                                        AppSize.textSize20),
                                                  ),
                                                ),
                                                VerticalDivider(
                                                  color: AppColor.colorgrey,
                                                  thickness: 1,
                                                ),
                                                InkWell(
                                                    onTap: () {},
                                                    child: Image.asset(
                                                      AppImage.plus,
                                                      height: 10,
                                                      width: 10,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          ),
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  6), // Border radius
                                              child: ClipOval(
                                                  child: Image.asset(
                                                AppImage.delete,
                                              )),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.textSubTotal,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize14),
                  ),
                  Text(
                    AppString.text60,
                    style:
                        getTextStyle(AppFonts.regularGreen, AppSize.textSize14),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                      child: Text(
                        AppString.textShareMyCart,
                        style: getTextStyle(
                          AppFonts.regularGreen,
                          AppSize.textSize16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: AppColor.colorWhite,
                          side: const BorderSide(
                              color: AppColor.colorPrimary, width: 2)),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                      child: Text(AppString.textOrderNow,
                          style: getTextStyle(
                              AppFonts.regular, AppSize.textSize16)),
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.colorPrimary,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlaceOrder()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
