import 'dart:convert';

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
import 'package:clone/login/DbHelper.dart';
import 'package:clone/login/com_helper.dart';
import 'package:clone/login/product_model.dart';
import 'package:clone/notifications/notifications.dart';
import 'package:clone/popular_products/popular_products.dart';
import 'package:clone/recommend_product/recommend_product.dart';
import 'package:clone/rewards_coupons/rewards_coupons.dart';
import 'package:clone/search/search.dart';
import 'package:clone/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

/*final List<String> containerImages = [
  'assets/images/rice.png',
  'assets/images/category2.png',
  'assets/images/category3.png',
  'assets/images/category4.png',
];*/

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
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void onLogout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Splash()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          key: scaffoldKey,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.textnotification,
                        style: getTextStyle(
                            AppFonts.regularBlack, AppSize.textSize16),
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(2), // Border radius
                          child: Text("2",
                              style: getTextStyle(
                                  AppFonts.regular, AppSize.textSize12)),
                        ),
                      ),
                    ],
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
                    AppString.textLogout,
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {
                    // alertDialog("Are you sure you want to logout?");
                    onLogout();
                  },
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
                const SizedBox(
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
                const SizedBox(
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
          // body: IndexedStack(
          //   index: selectedIndex,
          //   children: [
          //     Dashboard(),
          //     AllCategory(),
          //     Center(child: Text('Account')),
          //   ],
          // ),
          body: _dashboard(
            viewAllCategory: () {},
          )),
    );
  }
}

class _dashboard extends StatefulWidget {
  final Function viewAllCategory;

  const _dashboard({Key? key, required this.viewAllCategory}) : super(key: key);

  @override
  State<_dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<_dashboard> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  late DbHelper dbHelper;

  List<Category> _category = [];

  @override
  void initState() {
    getUserData();
    dbHelper = DbHelper();
    readJson();
    super.initState();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');
    final data = await json.decode(response);
    CategoryList tutorial = CategoryList.fromJson(data);

    setState(() {
      _category = tutorial.category!;
    });

    debugPrint('Category--${json.encode(_category)}');
  }

  Future<void> getUserData() async {
    final SharedPreferences sp = await _pref;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  builder: (context) => SearchScreen()),
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
            const SizedBox(
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
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Image.asset(AppImage.slider));
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppString.textCategory,
                          style: getTextStyle(
                              AppFonts.mediumBoldBlack, AppSize.textSize18)),
                      InkWell(
                        child: Text(AppString.textViewAllCategory,
                            textAlign: TextAlign.end,
                            style: getTextStyle(
                                AppFonts.regularGreen, AppSize.textSize14)),
                        onTap: () {
                          widget.viewAllCategory();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _category.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        _category[index].image!,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      _category[index].name!,
                                      style: getTextStyle(
                                          AppFonts.regularBlack2,
                                          AppSize.textSize14),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppString.textPopularProducts,
                      style: getTextStyle(
                          AppFonts.mediumBoldBlack, AppSize.textSize18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 350,
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                        ),
                        itemBuilder: (context, index) {
                          return Card(
                            child: SizedBox(
                                height: 300,
                                width: 160,
                                child: Column(
                                  children: [
                                    SizedBox(
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
                                                    ProductDetails(
                                                      mProductModel:
                                                          ProductModel(),
                                                    )),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
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
                                          const SizedBox(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(
                          AppString.textViewmore,
                          style: getTextStyle(
                              AppFonts.regularGreen, AppSize.textSize14),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PopularProductsScreen(
                                      mCategory: Category(),
                                    )),
                          );
                        },
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppString.textRecommendProduct,
                      style: getTextStyle(
                          AppFonts.mediumBoldBlack, AppSize.textSize18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 360,
                    child: GridView.builder(
                        itemCount: 4,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return Card(
                            child: SizedBox(
                                height: 240,
                                width: 160,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 90,
                                      width: 150,
                                      child: Image.asset(
                                          RecommendProduct()[index].image!),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Wrap(
                                        children: [
                                          Text(
                                            RecommendProduct()[index].name!,
                                            style: getTextStyle(
                                                AppFonts.regularBlack2,
                                                AppSize.textSize14),
                                          ),
                                          const SizedBox(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        child: Text(
                          AppString.textViewmore,
                          style: getTextStyle(
                              AppFonts.regularGreen, AppSize.textSize14),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RecommendProductsScreen()));
                        },
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      AppString.textLatestNewsBlog,
                      style: getTextStyle(
                          AppFonts.mediumBoldBlack, AppSize.textSize18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 210,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: 230,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 130,
                                        child: Image.asset(
                                          AppImage.NWS,
                                        ),
                                      ),
                                      Text(
                                        AppString.textNWS,
                                        style: getTextStyle(
                                            AppFonts.regularBlack,
                                            AppSize.textSize14),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppString.textCategoryName,
                                            style: getTextStyle(
                                                AppFonts.regularGrey,
                                                AppSize.textSize14),
                                          ),
                                          Text(
                                            AppString.text1hoursago,
                                            style: getTextStyle(
                                                AppFonts.regularGrey,
                                                AppSize.textSize14),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: 230,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 130,
                                        child: Image.asset(
                                          AppImage.NWS,
                                        ),
                                      ),
                                      Text(
                                        AppString.textNWS,
                                        style: getTextStyle(
                                            AppFonts.regularBlack,
                                            AppSize.textSize14),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppString.textCategoryName,
                                            style: getTextStyle(
                                                AppFonts.regularGrey,
                                                AppSize.textSize14),
                                          ),
                                          Text(
                                            AppString.text1hoursago,
                                            style: getTextStyle(
                                                AppFonts.regularGrey,
                                                AppSize.textSize14),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 130,
                        width: 130,
                        child: Image.asset(
                          AppImage.ss2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 130,
                        width: 130,
                        child: Image.asset(
                          AppImage.ss,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Wrap(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          AppImage.fb2,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          AppImage.yt,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          AppImage.insta,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          AppImage.mail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          AppImage.whatsapp,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          AppImage.messenger,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          AppImage.tiktok,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
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
    );
  }
}
