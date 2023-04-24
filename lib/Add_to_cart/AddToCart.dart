import 'package:clone/Add_to_cart/Cart%20Content.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_config.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:clone/login/DbHelper.dart';
import 'package:clone/login/com_helper.dart';
import 'package:clone/login/navigator_key.dart';
import 'package:clone/login/product_model.dart';
import 'package:clone/place_order/place_order.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'row_cart.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  var dbHelper;
  ModelCartProduct mCartModelData = ModelCartProduct();

  List<ModelCartProduct> mCartModel = [];
int totalCartAmount=0;
  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    dbHelper = DbHelper();

    await dbHelper
        .getUserCart(sp.getInt(AppConfig.textUserId))
        .then((List<ModelCartProduct> cartData) {
      if (cartData.isNotEmpty) {
        setState(() {
          totalCartAmount=0;
          mCartModel = cartData;
          for (int i=0;i<mCartModel.length;i++){
            int cartPrice = (mCartModel[i].productPrice!*mCartModel[i].cartProductQty!);
            totalCartAmount=totalCartAmount+cartPrice;
          }
        });
      } else {
        setState(() {
          mCartModel = [];
          totalCartAmount=0;

        });
      }
    });

  }
  void initDataOrder() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    dbHelper = DbHelper();

    for (int i = 0; i < mCartModel.length; i++) {
      ModelCartProduct item = mCartModel[i];

      OrderModel oModel = OrderModel();
      oModel.orderProductId =item.productId;
      oModel.orderQty = item.cartProductQty;
      oModel.orderUserId = sp.getInt(AppConfig.textUserId);
      oModel.orderStatus = 0;

      int remainingQty = item.productQty! - item.cartProductQty!;
      await dbHelper.saveOrder(oModel).then((orderData) async {
        await dbHelper
            .updateCartProduct(remainingQty, item.productId)
            .then((ss) async {
          await dbHelper.deleteCart(item.cartId);
        });
      });
    }
    alertDialog("Order Placed Successfully");
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          NavigatorKey.navigatorKey.currentContext!,
          MaterialPageRoute(builder: (_) => const Dashboard()),
              (Route<dynamic> route) => false);
    });
  }


  int selectQty = 0;

  removeFromCart(int index) async {
    dbHelper = DbHelper();
    await dbHelper.deleteCart(mCartModel[index].cartId);
    initData();
  }

  addToCart(int index, bool isIncrease) async {
    int selectQty = mCartModel[index].cartProductQty!;
    dbHelper = DbHelper();
    await dbHelper
        .updateCart(isIncrease ? selectQty + 1 : selectQty - 1,
            mCartModel[index].cartId)
        .then((cartData) {
      alertDialog("Successfully Modified Cart");
      initData();
    }).catchError((error) {
      print(error);
      alertDialog("Error: Data Save Fail--$error");
    });
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        elevation: 0,
        title: Text(
          AppString.textMyCart,
          style: getTextStyle(AppFonts.regular, AppSize.textSize18),
        ),
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mCartModel.length,
                    itemBuilder: (context, index) {
                      return RowCart(
                        item: mCartModel[index],
                        onDecrease: () => addToCart(index, false),
                        onIncrease: () => addToCart(index, true),
                        onDelete: () => removeFromCart(index),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.textSubTotal,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize14),
                  ),
                  Text(
                    '\$ ${totalCartAmount.toString()}',
                    style:
                        getTextStyle(AppFonts.regularGreen, AppSize.textSize14),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                      child: Text(
                        AppString.textShareMyCart,
                        style: getTextStyle(
                          AppFonts.regularGreen,
                          AppSize.textSize16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: AppColor.colorWhite,
                          side: const BorderSide(
                              color: AppColor.colorPrimary, width: 2)),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                      child: Text(AppString.textOrderNow,
                          style: getTextStyle(
                              AppFonts.regular, AppSize.textSize16)),
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.colorPrimary,
                      ),
                      onPressed: () {
                        initDataOrder();
                 /*       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlaceOrder()),
                        );*/
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
