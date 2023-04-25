import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/login/com_helper.dart';
import 'package:clone/login/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RowProduct extends StatelessWidget {
  final ProductModel item;
  final Function onDelete;
  const RowProduct({Key? key, required this.item, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Card(
      child: Container(
        height: 120,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                      item.productName!,
                      style: getTextStyle(
                          AppFonts.regularBlack2,
                          AppSize.textSize14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "\$${item.productPrice!}",
                      style: getTextStyle(
                          AppFonts.regularGreen,
                          AppSize.textSize18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          AppString.textQuantity,
                          style: getTextStyle(
                              AppFonts.regularGrey,
                              AppSize.textSize14),
                        ),     Text(
                          item.productQuantity.toString(),
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
                          onTap: () {},
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

