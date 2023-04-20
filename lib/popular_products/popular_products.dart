import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/category.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:clone/login/DbHelper.dart';
import 'package:clone/login/product_model.dart';
import 'package:flutter/material.dart';

class PopularProductsScreen extends StatefulWidget {
  final Category mCategory;

  const PopularProductsScreen({Key? key, required this.mCategory})
      : super(key: key);

  @override
  State<PopularProductsScreen> createState() => PopularProductsState();
}

class PopularProductsState extends State<PopularProductsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var dbHelper;
  List<ProductModel> mProductModel = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    if (widget.mCategory.id != null) {
      dbHelper = DbHelper();
      mProductModel = await dbHelper.getCategoryProduct(widget.mCategory.id!);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColor.colorPrimary,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                icon: Image.asset(
                  AppImage.back2,
                  height: 30,
                  fit: BoxFit.fill,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
              ),
              Text(
                widget.mCategory.id != null
                    ? widget.mCategory.name!
                    : AppString.textPopularProducts,
                style: getTextStyle(AppFonts.regular, AppSize.textSize18),
              ),
              SizedBox(
                width: 70,
              ),
              IconButton(
                icon: Image.asset(
                  AppImage.tab,
                  fit: BoxFit.fill,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset(
                  AppImage.shop,
                  fit: BoxFit.fill,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 750,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: mProductModel.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                      ),
                      itemBuilder: (context, index) {
                        ProductModel item = mProductModel[index];
                        return Card(
                          child: Container(
                              height: 240,
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    child: Image.network(
                                      item.productImage!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Wrap(
                                      children: [
                                        Text(
                                          item.productName!,
                                          style: getTextStyle(
                                              AppFonts.regularBlack2,
                                              AppSize.textSize14),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$${item.productPrice!}",
                                              style: getTextStyle(
                                                  AppFonts.regularGreen,
                                                  AppSize.textSize14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Align(
                                  //   alignment: Alignment.topLeft,
                                  //   child:
                                  // ),
                                ],
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
