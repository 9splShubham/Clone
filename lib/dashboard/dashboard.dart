import 'package:carousel_slider/carousel_slider.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/notifications/notifications.dart';
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
  "Wine/Liqour",
  "Vitamins",
  "Health",
  "Skin Care",
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
                    "Home",
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
                    "All Category",
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.dmyorder,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    "My Order",
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
                    "My Wishlist",
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
                    "My Profile",
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
                    "Notification",
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
                    "Rewards & Coupons",
                    style:
                        getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Image.asset(
                    AppImage.dblog,
                    height: 40,
                    width: 40,
                  ),
                  title: Text(
                    "News & Blog",
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
                    "Settings",
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
                  onPressed: () {},
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
                              child: Image.asset(
                                AppImage.search,
                                width: 20,
                                height: 20,
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
                          child: Text(
                            AppString.textPopularProducts,
                            style: getTextStyle(
                                AppFonts.mediumBoldBlack, AppSize.textSize18),
                          ),
                        ),
                        Container(
                          height: 340,
                          child: GridView.builder(
                              itemCount: 4,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 0,
                                mainAxisSpacing: 0,
                              ),
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Container(
                                      height: 240,
                                      width: 160,
                                      child: Column(
                                        children: [
                                          Image.asset(AppImage.doritos),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Container(
                                              child:
                                                  Text.rich(TextSpan(children: [
                                                TextSpan(
                                                  text:
                                                      AppString.textDoritostext,
                                                  style: getTextStyle(
                                                      AppFonts.regularBlack,
                                                      AppSize.textSize14),
                                                ),
                                                TextSpan(
                                                  text: AppString.textRS,
                                                  style: getTextStyle(
                                                      AppFonts.regularGreen,
                                                      AppSize.textSize14),
                                                )
                                              ])),
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
                            AppString.textRecommendProduct,
                            style: getTextStyle(
                                AppFonts.mediumBoldBlack, AppSize.textSize18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 300,
                          child: GridView.builder(
                              itemCount: 4,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
                                            height: 115,
                                            width: 150,
                                            child:
                                                Image.asset(AppImage.medicine),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Container(
                                              child:
                                                  Text.rich(TextSpan(children: [
                                                TextSpan(
                                                  text: AppString
                                                      .textTrueBasicsMultivitSport,
                                                  style: getTextStyle(
                                                      AppFonts.regularBlack,
                                                      AppSize.textSize14),
                                                ),
                                                TextSpan(
                                                  text: AppString.textRS,
                                                  style: getTextStyle(
                                                      AppFonts.regularGreen,
                                                      AppSize.textSize14),
                                                )
                                              ])),
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
