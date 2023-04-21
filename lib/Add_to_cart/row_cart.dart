import 'package:clone/Add_to_cart/Cart%20Content.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/login/com_helper.dart';
import 'package:flutter/material.dart';

class RowCart extends StatelessWidget {
  final ModelCartProduct item;
  final Function onDecrease;
  final Function onIncrease;
  final Function onDelete;

  const RowCart(
      {Key? key,
      required this.item,
      required this.onDecrease,
      required this.onIncrease,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.productName!.toString(),
                      style: getTextStyle(
                          AppFonts.regularBlack2, AppSize.textSize14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$${item.productPrice!.toString()}",
                      style: getTextStyle(
                          AppFonts.regularGreen, AppSize.textSize18),
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
                            border: Border.all(color: AppColor.colorgrey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (item.cartProductQty != 1)
                                InkWell(
                                    onTap: () {
                                      onDecrease();
                                    },
                                    child: Image.asset(
                                      AppImage.minus,
                                      height: 10,
                                      width: 10,
                                    )),
                              if (item.cartProductQty != 1)
                                VerticalDivider(
                                  color: AppColor.colorgrey,
                                  thickness: 1,
                                ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.white),
                                child: Text(
                                  item.cartProductQty.toString(),
                                  style: getTextStyle(AppFonts.regularBlack,
                                      AppSize.textSize20),
                                ),
                              ),
                              if (item.cartProductQty != item.productQty!)
                                VerticalDivider(
                                  color: AppColor.colorgrey,
                                  thickness: 1,
                                ),
                              if (item.cartProductQty != item.productQty!)
                                InkWell(
                                    onTap: () {
                                      onIncrease();
                                    },
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
                        InkWell(
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Padding(
                              padding: const EdgeInsets.all(6), // Border radius
                              child: ClipOval(
                                  child: Image.asset(
                                AppImage.delete,
                              )),
                            ),
                          ),
                          onTap: () {
                            showAlertDialog2(context);
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
  }

  showAlertDialog2(BuildContext context) {
    // set up the buttons
    Widget cancelButton = InkWell(
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Text(
          "Cancel",
          style: getTextStyle(AppFonts.regularGreen, AppSize.textSize16),
        ),
      ),
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget deleteButton = InkWell(
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Text("Delete",
            style: getTextStyle(AppFonts.regularGreen, AppSize.textSize16)),
      ),
      onTap: () {
        Navigator.of(context, rootNavigator: true).pop();
        onDelete();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Cart"),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text("Are you sure You want to Delete?"),
      ),
      actions: [
        cancelButton,
        deleteButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
