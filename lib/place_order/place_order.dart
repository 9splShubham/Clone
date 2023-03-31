import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/order_placed/order_placed.dart';
import 'package:flutter/material.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        elevation: 0,
        title: Text(
          AppString.textPlaceOrder,
          style: getTextStyle(AppFonts.regular, AppSize.textSize18),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Card(
              child: Container(
                height: 70,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.textDeliveryAddress,
                            style: getTextStyle(
                                AppFonts.regularGrey, AppSize.textSize14),
                          ),
                          Text(
                            AppString.textChangeAddress,
                            style: getTextStyle(
                                AppFonts.regularGreen, AppSize.textSize14),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            AppString.text841MontgomeryStJerseyCityNJ07306SA,
                            style: getTextStyle(
                                AppFonts.regularBlack2, AppSize.textSize14),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                height: 70,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppString.textBillingADDRESS,
                            style: getTextStyle(
                                AppFonts.regularGrey, AppSize.textSize14),
                          ),
                          Text(
                            AppString.textChangeAddress,
                            style: getTextStyle(
                                AppFonts.regularGreen, AppSize.textSize14),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            AppString.text56N22ndStEastOrangeNJ07017USA,
                            style: getTextStyle(
                                AppFonts.regularBlack2, AppSize.textSize14),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              AppString.textDeliveryType,
              style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize16),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: AppColor.colortextbox,
                  hintText: AppString.textSelectDeliveryType,
                  hintStyle:
                      getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.textYoursProducts,
                  style:
                      getTextStyle(AppFonts.regularBlack2, AppSize.textSize16),
                ),
                Text(
                  AppString.textViewDetail,
                  style:
                      getTextStyle(AppFonts.regularGreen, AppSize.textSize14),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 50, child: Image.asset(AppImage.p11)),
                Container(height: 50, child: Image.asset(AppImage.p12)),
                Container(height: 50, child: Image.asset(AppImage.p13)),
                Container(height: 50, child: Image.asset(AppImage.p14)),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppString.textYourOrder,
                          style: getTextStyle(
                              AppFonts.regularBlack2, AppSize.textSize16),
                        ),
                      ],
                    ),
                    SizedBox(
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
                    SizedBox(
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
                    SizedBox(
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.textTip,
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
                    SizedBox(
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
                    SizedBox(
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
                    SizedBox(
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
                    SizedBox(
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
                    SizedBox(
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
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.textAddDiscountCoupon,
                  style:
                      getTextStyle(AppFonts.regularBlack2, AppSize.textSize16),
                ),
                Image.asset(
                  AppImage.dropdown,
                  height: 20,
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                child: Text(AppString.textContinuetoPay,
                    style: getTextStyle(AppFonts.regular, AppSize.textSize16)),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.colorPrimary,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: SizedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            AppString.textSelectPaymentOption,
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
                                                    const PlaceOrder()),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Card(
                                    child: RadioListTile(
                                      title: Text(
                                          AppString.textPayusingVisaMasterCard),
                                      value: "info",
                                      groupValue: "info",
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Card(
                                    child: RadioListTile(
                                      title: Text(AppString.textCashondelivery),
                                      value: "info",
                                      groupValue: "info",
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Card(
                                    child: RadioListTile(
                                      title: Text(AppString.textACHpayment),
                                      value: "info",
                                      groupValue: "info",
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  Text(
                                    AppString.textBankaccountsforTransfer,
                                    style: getTextStyle(AppFonts.semiBoldBlack2,
                                        AppSize.textSize16),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    AppString
                                        .textBancoFicohsaCheckingAccountLempiras,
                                    style: getTextStyle(AppFonts.regularBlack2,
                                        AppSize.textSize16),
                                  ),
                                  Text(
                                    AppString.text200012651887,
                                    style: getTextStyle(AppFonts.regularBlack2,
                                        AppSize.textSize14),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    AppString
                                        .textBancoFicohsaCheckingAccountLempiras,
                                    style: getTextStyle(AppFonts.regularBlack2,
                                        AppSize.textSize16),
                                  ),
                                  Text(
                                    AppString.text200012651887,
                                    style: getTextStyle(AppFonts.regularBlack2,
                                        AppSize.textSize14),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      AppImage.ficohsa_logo,
                                      height: 60,
                                      width: 170,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      child: Text(
                                        AppString.textContinue,
                                        style: getTextStyle(AppFonts.regular,
                                            AppSize.textSize16),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        primary: AppColor.colorPrimary,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const OrderPlaced()),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
