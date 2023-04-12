import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/order_placed/order_placed.dart';
import 'package:clone/place_order/place_order.dart';
import 'package:flutter/material.dart';

class BottomSheetPaymentSelect extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onChange;

  const BottomSheetPaymentSelect({
    Key? key,
    required this.selectedIndex,
    required this.onChange,
  }) : super(key: key);

  @override
  State<BottomSheetPaymentSelect> createState() =>
      _BottomSheetPaymentSelectState();
}

class _BottomSheetPaymentSelectState extends State<BottomSheetPaymentSelect> {
  int x = 1;

  @override
  void initState() {
    x = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        AppString.textSelectPaymentOption,
                        style: getTextStyle(
                            AppFonts.semiBoldBlack2, AppSize.textSize20),
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
                            builder: (context) => const PlaceOrder()),
                      );
                    },
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: x,
                    onChanged: (value) {
                      setState(() {
                        x = value!;
                        widget.onChange(value);
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppString.textPayusingVisaMasterCard,
                    style: getTextStyle(
                        AppFonts.regularBlack2, AppSize.textSize16),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: x,
                    onChanged: (value) {
                      setState(() {
                        x = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppString.textCashondelivery,
                    style: getTextStyle(
                        AppFonts.regularBlack2, AppSize.textSize16),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: x,
                    onChanged: (value) {
                      setState(() {
                        x = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppString.textACHpayment,
                    style: getTextStyle(
                        AppFonts.regularBlack2, AppSize.textSize16),
                  ),
                ],
              ),
              Text(
                AppString.textBankaccountsforTransfer,
                style:
                    getTextStyle(AppFonts.semiBoldBlack2, AppSize.textSize16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                AppString.textBancoFicohsaCheckingAccountLempiras,
                style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize16),
              ),
              Text(
                AppString.text200012651887,
                style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize14),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                AppString.textBancoFicohsaCheckingAccountLempiras,
                style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize16),
              ),
              Text(
                AppString.text200012651887,
                style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize14),
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
                    style: getTextStyle(AppFonts.regular, AppSize.textSize16),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.colorPrimary,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderPlaced()),
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
  }
}
