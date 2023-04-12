import 'package:clone/Add_to_cart/AddToCart.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        elevation: 0,
        title: Row(
          children: [
            Text(
              AppString.textOrderNo123321123,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.textOrderBy,
                    style:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                  Text(
                    AppString.textjohndoemailcom,
                    style: getTextStyle(
                        AppFonts.regularBlack2, AppSize.textSize14),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.textOrderDateTime,
                    style:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                  Text(
                    AppString.text20032021,
                    style: getTextStyle(
                        AppFonts.regularBlack2, AppSize.textSize14),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    AppString.textCancelOrder,
                    style: getTextStyle(AppFonts.regular, AppSize.textSize16),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.colorPrimary,
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Text(
                                    AppString.textCancelOrder,
                                    style: getTextStyle(AppFonts.semiBoldBlack2,
                                        AppSize.textSize20),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 70,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      fillColor: AppColor.colortextbox,
                                      hintText: AppString.textAddReason,
                                      hintStyle: getTextStyle(
                                          AppFonts.regularGrey,
                                          AppSize.textSize14),
                                    ),
                                    style: const TextStyle(),
                                    maxLines: 10,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 160,
                                      child: ElevatedButton(
                                        child: Text(
                                          AppString.textCancel,
                                          style: getTextStyle(
                                            AppFonts.regularGreen,
                                            AppSize.textSize16,
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: AppColor.colorWhite,
                                            side: const BorderSide(
                                                color: AppColor.colorPrimary,
                                                width: 2)),
                                        onPressed: () {
                                          Navigator.pop(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const MyOrder()),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 160,
                                      child: ElevatedButton(
                                        child: Text(AppString.textSubmit,
                                            style: getTextStyle(
                                                AppFonts.regular,
                                                AppSize.textSize16)),
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
                          );
                        });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                AppString.textTrackOrders,
                style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize16),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.colorbrightgreen,
                    child: Padding(
                      padding: const EdgeInsets.all(7), // Border radius
                      child: ClipOval(
                          child: Image.asset(
                        AppImage.o1,
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.textOrderPlaced,
                        style: getTextStyle(
                            AppFonts.regularBlack2, AppSize.textSize14),
                      ),
                      Wrap(children: [
                        Container(
                          height: 40,
                          width: 200,
                          child: Text(
                            AppString.textWehavereceivedyourorderon200320211015,
                            style: getTextStyle(
                                AppFonts.regularGrey, AppSize.textSize14),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.colorbrightgreen,
                    child: Padding(
                      padding: const EdgeInsets.all(7), // Border radius
                      child: ClipOval(
                          child: Image.asset(
                        AppImage.o2,
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.textOrderConfirmed,
                        style: getTextStyle(
                            AppFonts.regularBlack2, AppSize.textSize14),
                      ),
                      Wrap(children: [
                        Container(
                          height: 40,
                          width: 200,
                          child: Text(
                            AppString.textWehasbeenconfirmedon200320211020,
                            style: getTextStyle(
                                AppFonts.regularGrey, AppSize.textSize14),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.coloryellow,
                    child: Padding(
                      padding: const EdgeInsets.all(7), // Border radius
                      child: ClipOval(
                          child: Image.asset(
                        AppImage.o3,
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.textOrderProcessed,
                        style: getTextStyle(
                            AppFonts.regularyellow, AppSize.textSize14),
                      ),
                      Wrap(children: [
                        Container(
                          height: 40,
                          width: 200,
                          child: Text(
                            AppString.textWearEpreparingyourorder,
                            style: getTextStyle(
                                AppFonts.regularyellow, AppSize.textSize14),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.colorgrey,
                    child: Padding(
                      padding: const EdgeInsets.all(7), // Border radius
                      child: ClipOval(
                          child: Image.asset(
                        AppImage.o4,
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.textReadytoShip,
                        style: getTextStyle(
                            AppFonts.regularGrey, AppSize.textSize14),
                      ),
                      Wrap(children: [
                        Container(
                          height: 40,
                          width: 200,
                          child: Text(
                            AppString.textYourorderisreadyforshipping,
                            style: getTextStyle(
                                AppFonts.regularGrey, AppSize.textSize14),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.colorgrey,
                    child: Padding(
                      padding: const EdgeInsets.all(7), // Border radius
                      child: ClipOval(
                          child: Image.asset(
                        AppImage.o5,
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(AppString.textdelivered),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImage.p,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.textWilliamSadders,
                        style: getTextStyle(
                            AppFonts.regularBlack2, AppSize.textSize16),
                      ),
                      Text(
                        AppString.textTip,
                        style: getTextStyle(
                            AppFonts.regularGreen, AppSize.textSize14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.colorPrimary,
                    child: Padding(
                      padding: const EdgeInsets.all(7), // Border radius
                      child: ClipOval(
                          child: Image.asset(
                        AppImage.m,
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.colorPrimary,
                    child: Padding(
                      padding: const EdgeInsets.all(7), // Border radius
                      child: ClipOval(
                          child: Image.asset(
                        AppImage.c,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textYourOrder,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize16),
                        ),
                        Text(
                          AppString.textDownloadInvoice,
                          style: getTextStyle(
                              AppFonts.regularGreen, AppSize.textSize14),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textSubTotal,
                          style: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                        Text(
                          AppString.text60,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textDeliveryFees,
                          style: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                        Text(
                          AppString.texto2,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textServiceFees,
                          style: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                        Text(
                          AppString.texto3,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textTip$200,
                          style: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                        Text(
                          AppString.texto4,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textTotal,
                          style: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                        Text(
                          AppString.texto5,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textDiscount,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textDiscountCodeDIS50,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize14),
                        ),
                        Text(
                          AppString.texto6,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textRemoveCodeChangeCode,
                          style: getTextStyle(
                              AppFonts.regularGreen, AppSize.textSize14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textGrandTotal,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize14),
                        ),
                        Text(
                          AppString.texto7,
                          style: getTextStyle(
                              AppFonts.regularGreen, AppSize.textSize14),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textYoursProducts,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize16),
                        ),
                        InkWell(
                          child: Text(
                            AppString.textViewDetail,
                            style: getTextStyle(
                                AppFonts.regularGreen, AppSize.textSize14),
                          ),
                          onTap: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                    AppString.textProductList,
                                                    style: getTextStyle(
                                                        AppFonts.semiBoldBlack2,
                                                        AppSize.textSize20),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                child: Image.asset(
                                                  AppImage.cancel,
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                onTap: () {
                                                  Navigator.pop(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const MyOrder()),
                                                  );
                                                },
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                AppImage.doritos,
                                                height: 50,
                                                width: 50,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Text(
                                                      AppString.textDoritostext,
                                                      style: getTextStyle(
                                                          AppFonts
                                                              .regularBlack2,
                                                          AppSize.textSize14),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          AppString.textQty5,
                                                          style: getTextStyle(
                                                              AppFonts
                                                                  .regularGrey,
                                                              AppSize
                                                                  .textSize14),
                                                        ),
                                                        Text(
                                                          AppString
                                                              .textTotalPrice$1125,
                                                          style: getTextStyle(
                                                              AppFonts
                                                                  .regularGreen,
                                                              AppSize
                                                                  .textSize14),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                AppImage.Hamper,
                                                height: 50,
                                                width: 50,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    AppString.textAveenoBaby,
                                                    style: getTextStyle(
                                                        AppFonts.regularBlack2,
                                                        AppSize.textSize14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        AppString.textQty1,
                                                        style: getTextStyle(
                                                            AppFonts
                                                                .regularGrey,
                                                            AppSize.textSize14),
                                                      ),
                                                      Text(
                                                        AppString
                                                            .textTotalPrice$2000,
                                                        style: getTextStyle(
                                                            AppFonts
                                                                .regularGreen,
                                                            AppSize.textSize14),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                AppImage.hh,
                                                height: 50,
                                                width: 50,
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    AppString
                                                        .textHeadandShouldersShampoo,
                                                    style: getTextStyle(
                                                        AppFonts.regularBlack2,
                                                        AppSize.textSize14),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        AppString.textQty1,
                                                        style: getTextStyle(
                                                            AppFonts
                                                                .regularGrey,
                                                            AppSize.textSize14),
                                                      ),
                                                      Text(
                                                        AppString
                                                            .textTotalPrice$1900,
                                                        style: getTextStyle(
                                                            AppFonts
                                                                .regularGreen,
                                                            AppSize.textSize14),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                AppString.textSubTotal,
                                                style: getTextStyle(
                                                    AppFonts.regularBlack2,
                                                    AppSize.textSize14),
                                              ),
                                              Text(
                                                AppString.textTotalPrice$5025,
                                                style: getTextStyle(
                                                    AppFonts.regularGreen,
                                                    AppSize.textSize14),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(height: 50, child: Image.asset(AppImage.p11)),
                        Container(height: 50, child: Image.asset(AppImage.p12)),
                        Container(height: 50, child: Image.asset(AppImage.p13)),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
