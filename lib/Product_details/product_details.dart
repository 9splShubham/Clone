import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:clone/otp_verification/otp_verification.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        elevation: 0,
        title: Row(
          children: [
            Text(
              AppString.textProductDetail,
              style: getTextStyle(AppFonts.regular, AppSize.textSize18),
            ),
            const SizedBox(
              width: 140,
            ),
            IconButton(
              icon: Image.asset(
                AppImage.shop,
                fit: BoxFit.fill,
              ),
              onPressed: () {},
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(height: 330, child: Image.asset(AppImage.hh)),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 50, child: Image.asset(AppImage.p1)),
              Container(height: 50, child: Image.asset(AppImage.p2)),
              Container(height: 50, child: Image.asset(AppImage.p3)),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  AppString.textp,
                  style:
                      getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.colorWhite,
                            side: const BorderSide(
                                color: AppColor.colorPrimary, width: 2)),
                        onPressed: () {},
                        child: Text(
                          AppString.textAddtoWishlist,
                          style: getTextStyle(
                            AppFonts.regularGreen,
                            AppSize.textSize16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.colorPrimary,
                        ),
                        onPressed: () {},
                        child: Text(AppString.textAddtoCart,
                            style: getTextStyle(
                                AppFonts.regular, AppSize.textSize16)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      AppString.textSelectQty,
                      style: getTextStyle(
                          AppFonts.regularBlack, AppSize.textSize16),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 40,
                      width: 110,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.colorgrey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Image.asset(
                                AppImage.minus,
                                height: 10,
                                width: 10,
                              )),
                          const VerticalDivider(
                            color: AppColor.colorgrey,
                            thickness: 1,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.white),
                            child: Text(
                              '5',
                              style: getTextStyle(
                                  AppFonts.regularBlack, AppSize.textSize20),
                            ),
                          ),
                          const VerticalDivider(
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
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppString.textProductDetail,
                  style:
                      getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppString.textinfo,
                  style: getTextStyle(AppFonts.regularGrey, AppSize.textSize16),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: SizedBox(
                          height: 50,
                          width: 270,
                          child: OutlinedButton.icon(
                            label: Text(
                              AppString.textChatwithSeller,
                              style: getTextStyle(
                                  AppFonts.regular, AppSize.textSize14),
                            ),
                            icon: Image.asset(
                              AppImage.wa,
                              height: 30,
                              width: 30,
                            ),
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColor.colorbrightgreen),
                            ),
                          )),
                    ),
                    IconButton(
                      icon: Image.asset(
                        AppImage.share,
                        height: 50,
                        width: 50,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
