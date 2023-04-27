import 'package:clone/Add_to_cart/Cart%20Content.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_config.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/login/DbHelper.dart';
import 'package:clone/login/com_helper.dart';
import 'package:clone/login/product_model.dart';
import 'package:clone/place_order/place_order.dart';
import 'package:clone/vendor/bottom_sheet.dart';
import 'package:clone/vendor/row_product.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _Product();
}

class _Product extends State<Product> {
  var dbHelper;
  List<ProductModel> mProductModel = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    dbHelper = DbHelper();
    mProductModel =
        await dbHelper.getUserProduct(sp.getInt(AppConfig.textUserId));
    print('object--mProductModel---${mProductModel.length}');
    setState(() {});
  }

  removeFromProduct(int index) async {
    dbHelper = DbHelper();
    await dbHelper.deleteProduct(mProductModel[index].productId);
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 550,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: mProductModel.length,
                  itemBuilder: (context, index) {
                    ProductModel item = mProductModel[index];
                    return RowProduct(
                      item: mProductModel[index],
                      onDelete: () => removeFromProduct(index),
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (builder) {
                        return BottomSheetProduct(
                          onProductAdd: () {
                            initData();
                            Navigator.pop(context);
                            alertDialog("Successfully Saved");
                          },
                        );
                      });
                },
                child: Icon(
                  Icons.add,
                  color: AppColor.colorWhite,
                ),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    backgroundColor: AppColor.colorPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
