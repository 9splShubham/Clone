import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/my_order/my_order.dart';
import 'package:flutter/material.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 320),
            child: Center(
              child: Image.asset(
                AppImage.order_placed,
                height: 120,
                width: 130,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            AppString.textOrderSuccessfullyPlaced,
            style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize20),
          ),
          SizedBox(
            height: 260,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                AppString.textViewMyOrder,
                style: getTextStyle(AppFonts.regular, AppSize.textSize16),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColor.colorPrimary,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyOrder()),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
