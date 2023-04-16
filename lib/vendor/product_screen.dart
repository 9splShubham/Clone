import 'package:clone/Add_to_cart/Cart%20Content.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/login/com_helper.dart';
import 'package:clone/place_order/place_order.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _Product();

}

class _Product extends State<Product> {
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
                                        width: 10,
                                      ),
                                      Text(
                                        AppString.textQuantity,
                                        style: getTextStyle(
                                            AppFonts.regularGrey,
                                            AppSize.textSize14),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),

                                      InkWell(
                                        child: Text(
                                          AppString.textEdit,
                                          style: getTextStyle(
                                              AppFonts.regularGrey,
                                              AppSize.textSize14),
                                        ),
                                        onTap: (){},
                                      ),
                                      SizedBox(
                                        width: 50,
                                      ),
                                      InkWell(
                                        child: CircleAvatar(
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
                                        onTap: (){

                                          alertDialog("Are you sure you want to delete the item?");
                                        },
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
          ],
        ),
      ),
    );
  }
}
