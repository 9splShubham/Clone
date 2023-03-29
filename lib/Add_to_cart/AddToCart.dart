import 'package:clone/Add_to_cart/Cart%20Content.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        elevation: 0,
        title: Row(
          children: [
            Text(
              AppString.textMyCart,
              style: getTextStyle(AppFonts.regular, AppSize.textSize18),
            ),
          ],
        ),
      ),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: cart().length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 120,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  cart()[index].image!,
                                  height: 90,
                                  width: 90,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cart()[index].name!,
                                    style: getTextStyle(AppFonts.regularBlack2,
                                        AppSize.textSize14),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    cart()[index].price!,
                                    style: getTextStyle(AppFonts.regularGreen,
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
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 3),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3, vertical: 2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(3),
                                                  color: Colors.white),
                                              child: Text(
                                                '3',
                                                style: getTextStyle(
                                                    AppFonts.regularBlack,
                                                    AppSize.textSize20),
                                              ),
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
                        style:
                            getTextStyle(AppFonts.regular, AppSize.textSize16)),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.colorPrimary,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}