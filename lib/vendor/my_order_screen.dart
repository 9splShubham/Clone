import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/vendor/details.dart';
import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrder();
}

class _MyOrder extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),



            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount:  details().length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 160,

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(  details()[index].orderNo!,
                                  style: getTextStyle(AppFonts.semiBoldBlack2, AppSize.textSize16),

                                ),

                                Text(details()[index].rs!,
                                  style: getTextStyle(AppFonts.regularGreen, AppSize.textSize16),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppString.textorderBy,
                                  style: getTextStyle(AppFonts.regularGrey, AppSize.textSize14),

                                ),

                                Text(details()[index].email!,
                                  style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize14),

                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppString.textorderDateTime,
                                  style: getTextStyle(AppFonts.regularGrey, AppSize.textSize14),

                                ),

                                Text(details()[index].dateTime!,
                                  style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize14),

                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Image.asset(  details()[index].image!,
                                  height: 50,
                                )
                              ],
                            )
                          ],
                        ),
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
