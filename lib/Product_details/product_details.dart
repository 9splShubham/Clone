import 'package:clone/Add_to_cart/AddToCart.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_config.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:clone/login/DbHelper.dart';
import 'package:clone/login/com_helper.dart';
import 'package:clone/login/product_model.dart';
import 'package:clone/otp_verification/otp_verification.dart';
import 'package:clone/vendor/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel mProductModel;
  final Function onProductAddToCart;

  const ProductDetails(
      {Key? key, required this.mProductModel, required this.onProductAddToCart})
      : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var dbHelper;
  CartModel mCartModel = CartModel();

  @override
  void initState() {
    initData();

    super.initState();
  }

  void initData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    dbHelper = DbHelper();
    await dbHelper
        .getCartProduct(
            widget.mProductModel.productId, sp.getInt(AppConfig.textUserId))
        .then((cartData) {
      if (cartData != null && cartData.cartId != null) {
        setState(() {
          mCartModel = cartData;
        });
      } else {
        setState(() {
          mCartModel = CartModel();
        });
      }
    });
  }

  int selectQty = 0;

  removeFromCart() async {
    dbHelper = DbHelper();
    await dbHelper.deleteCart(mCartModel.cartId);
    initData();
  }

  addToCart() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    CartModel cModel = CartModel();

    cModel.cartProductId = widget.mProductModel.productId;
    cModel.cartProductQty = selectQty;
    cModel.cartUserId = sp.getInt(AppConfig.textUserId);

    if (selectQty != 0) {
      dbHelper = DbHelper();
      await dbHelper.saveCart(cModel).then((cartData) {
        alertDialog("Successfully Added");
      }).catchError((error) {
        print(error);
        alertDialog("Error: Data Save Fail--$error");
      });
      initData();
    } else {
      alertDialog("Please Select Qty");
    }
    dbHelper = DbHelper();
    await dbHelper.saveProduct(cModel).then((productData) {
      widget.onProductAddToCart();
    }).catchError((error) {
      print(error);
      alertDialog("Error: Data Save Fail--$error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        elevation: 0,
        title: Row(
          children: [
            Text(
              AppString.textProductDetail,
              style: getTextStyle(AppFonts.regular, AppSize.textSize18),
            ),
            const SizedBox(
              width: 140,
            ),
            IconButton(
              icon: Image.asset(
                AppImage.shop,
                fit: BoxFit.fill,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddToCart()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 330,
              child: Image.network(
                widget.mProductModel.productImage!,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            /*        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 50, child: Image.asset(AppImage.p1)),
                Container(height: 50, child: Image.asset(AppImage.p2)),
                Container(height: 50, child: Image.asset(AppImage.p3)),
              ],
            ),*/
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    widget.mProductModel.productName!,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 160,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: AppColor.colorWhite,
                              side: const BorderSide(
                                  color: AppColor.colorPrimary, width: 2)),
                          onPressed: () {},
                          child: Text(
                            AppString.textAddtoWishlist,
                            style: getTextStyle(
                              AppFonts.regularGreen,
                              AppSize.textSize16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 160,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.colorPrimary,
                          ),
                          onPressed: () {
                            initData();
                            if (mCartModel.cartId != null) {
                              removeFromCart();
                            } else {
                              addToCart();
                            }
                          },
                          child: Text(
                              mCartModel.cartId != null
                                  ? 'Remove From Cart'
                                  : AppString.textAddtoCart,
                              style: getTextStyle(
                                  AppFonts.regular, AppSize.textSize16)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  if (mCartModel.cartId == null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppString.textSelectQty,
                          style: getTextStyle(
                              AppFonts.regularBlack, AppSize.textSize16),
                        ),
                        const SizedBox(
                          width: 10,
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
                              if (selectQty != 0)
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectQty--;
                                      });
                                    },
                                    child: Image.asset(
                                      AppImage.minus,
                                      height: 10,
                                      width: 10,
                                    )),
                              if (selectQty != 0)
                                const VerticalDivider(
                                  color: AppColor.colorgrey,
                                  thickness: 1,
                                ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.white),
                                child: Text(
                                  selectQty.toString(),
                                  style: getTextStyle(AppFonts.regularBlack,
                                      AppSize.textSize20),
                                ),
                              ),
                              if (selectQty !=
                                  widget.mProductModel.productQuantity!)
                                const VerticalDivider(
                                  color: AppColor.colorgrey,
                                  thickness: 1,
                                ),
                              if (selectQty !=
                                  widget.mProductModel.productQuantity!)
                                InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectQty++;
                                      });
                                    },
                                    child: Image.asset(
                                      AppImage.plus,
                                      height: 10,
                                      width: 10,
                                    )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    AppString.textProductDetail,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                   widget.mProductModel.productDescription!,
                    style:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: SizedBox(
                            height: 50,
                            width: 270,
                            child: OutlinedButton.icon(
                              label: Text(
                                AppString.textChatwithSeller,
                                style: getTextStyle(
                                    AppFonts.regular, AppSize.textSize14),
                              ),
                              icon: Image.asset(
                                AppImage.wa,
                                height: 30,
                                width: 30,
                              ),
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    AppColor.colorbrightgreen),
                              ),
                            )),
                      ),
                      IconButton(
                        icon: Image.asset(
                          AppImage.share,
                          height: 50,
                          width: 50,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
