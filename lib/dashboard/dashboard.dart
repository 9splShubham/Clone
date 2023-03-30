import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone/Add_to_cart/AddToCart.dart';
import 'package:clone/Product_details/product_details.dart';
import 'package:clone/all_category/all_category.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/category.dart';
import 'package:clone/notifications/notifications.dart';
import 'package:clone/popular_products/popular_products.dart';
import 'package:clone/recommend_product/recommend_product.dart';
import 'package:clone/rewards_coupons/rewards_coupons.dart';
import 'package:clone/search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

final List<String> containerImages = [
  'assets/images/category1.png',
  'assets/images/category2.png',
  'assets/images/category3.png',
  'assets/images/category4.png',
];

final List<String> PopularImages = [
  'assets/images/doritos.png',
];

final List<String> Titles = [
  "Doritos Tangy Cheese Corn Chips",
];

final List<String> imageTitles = [
  AppString.textWineLiqour,
  AppString.textVitamins,
  AppString.textHealth,
  AppString.textSkinCare,
];

class _DashboardState extends State<Dashboard> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          key: scaffoldKey,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 50,
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.dhome,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    AppString.textHome,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.dcategory,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    AppString.textAllCategory,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AllCategory()),
                    );
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.dmyorder,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    AppString.textMyOrder,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.dwishlist,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    AppString.textMyWishlist,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.dprofile,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    AppString.textMyProfile,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.dnotification,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    AppString.textnotification,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Notifications()),
                    );
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.drewards,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    AppString.textRewardCoupons,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RewardsCoupons()),
                    );
                  },
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.dblog,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    AppString.textNewsBlog,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.dsettings,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    AppString.textSettings,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          appBar: AppBar(
            leading: IconButton(
              icon: Image.asset(
                AppImage.drawer,
                height: 30,
                width: 30,
              ),
              onPressed: () {
                if (scaffoldKey.currentState!.isDrawerOpen) {
                  scaffoldKey.currentState!.closeDrawer();
                  //close drawer, if drawer is open
                } else {
                  scaffoldKey.currentState!.openDrawer();
                  //open drawer, if drawer is closed
                }
              },
            ),
            backgroundColor: AppColor.colorPrimary,
            elevation: 0,
            title: Row(
              children: [
                Text(
                  AppString.textPharmacy,
                  style: getTextStyle(AppFonts.regular, AppSize.textSize18),
                ),
                SizedBox(
                  width: 70,
                ),
                SizedBox(
                    height: 30,
                    width: 90,
                    child: OutlinedButton.icon(
                      label: Text(
                        AppString.textDeals,
                        style: getTextStyle(
                            AppFonts.regularBlack, AppSize.textSize14),
                      ),
                      icon: Image.asset(
                        AppImage.discount,
                        height: 15,
                        width: 15,
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColor.colorWhite),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Image.asset(
                    AppImage.shop,
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddToCart()),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: AppColor.colorPrimary,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: InkWell(
                                child: Image.asset(
                                  AppImage.search,
                                  width: 20,
                                  height: 20,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Search()),
                                  );
                                },
                              ),
                            ),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: AppColor.colortextbox,
                            hintText: AppString.textSearch,
                            hintStyle: getTextStyle(
                                AppFonts.regularGrey, AppSize.textSize14)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 160,
                    color: Colors.white,
                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(height: 160),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Image.asset(AppImage.slider));
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(AppString.textCategory,
                                  style: getTextStyle(AppFonts.mediumBoldBlack,
                                      AppSize.textSize18)),
                            ),
                            Container(
                              child: Text(AppString.textViewAllCategory,
                                  textAlign: TextAlign.end,
                                  style: getTextStyle(AppFonts.regularGreen,
                                      AppSize.textSize14)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 20,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Column(children: [
                                Container(
                                  width: 80,
                                  child: Image.asset(containerImages[index],
                                      fit: BoxFit.cover),
                                ),
                                Text("${imageTitles[index]}")
                              ]);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            child: Text(
                              AppString.textPopularProducts,
                              style: getTextStyle(
                                  AppFonts.mediumBoldBlack, AppSize.textSize18),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PopularProducts()),
                              );
                            },
                          ),
                        ),
                        Container(
                          height: 350,
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 4,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                              ),
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Container(
                                      height: 300,
                                      width: 160,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 100,
                                            child: InkWell(
                                              child: Image.asset(
                                                items()[index].image!,
                                                fit: BoxFit.cover,
                                              ),
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const ProductDetails()),
                                                );
                                              },
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
                                                  items()[index].name!,
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
                                                      items()[index].price!,
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
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppString.textViewmore,
                              style: getTextStyle(
                                  AppFonts.regularGreen, AppSize.textSize14),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            child: Text(
                              AppString.textRecommendProduct,
                              style: getTextStyle(
                                  AppFonts.mediumBoldBlack, AppSize.textSize18),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RecommendProducts()),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 360,
                          child: GridView.builder(
                              itemCount: 4,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Container(
                                      height: 240,
                                      width: 160,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 90,
                                            width: 150,
                                            child: Image.asset(
                                                RecommendProduct()[index]
                                                    .image!),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3),
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  RecommendProduct()[index]
                                                      .name!,
                                                  style: getTextStyle(
                                                      AppFonts.regularBlack2,
                                                      AppSize.textSize14),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      RecommendProduct()[index]
                                                          .price!,
                                                      style: getTextStyle(
                                                          AppFonts.regularGreen,
                                                          AppSize.textSize14),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                );
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Text(
                              AppString.textViewmore,
                              style: getTextStyle(
                                  AppFonts.regularGreen, AppSize.textSize14),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppString.textOurInstagramFeed,
                            style: getTextStyle(
                                AppFonts.mediumBoldBlack, AppSize.textSize18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 130,
                              width: 130,
                              child: Image.asset(
                                AppImage.ss2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 130,
                              width: 130,
                              child: Image.asset(
                                AppImage.ss,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppString.textFOLLOWUSON,
                            style: getTextStyle(
                                AppFonts.mediumBoldBlack, AppSize.textSize18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                AppImage.fb2,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                AppImage.yt,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                AppImage.insta,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                AppImage.mail,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                AppImage.whatsapp,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                AppImage.messenger,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                AppImage.tiktok,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
