import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:clone/forgot_password/forgot_password.dart';
import 'package:clone/rewards_coupons/rewards_data.dart';
import 'package:flutter/material.dart';

class RewardsCoupons extends StatefulWidget {
  const RewardsCoupons({Key? key}) : super(key: key);

  @override
  State<RewardsCoupons> createState() => _RewardsCouponsState();
}

class _RewardsCouponsState extends State<RewardsCoupons> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style: getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              },
            ),
            ListTile(
              leading: Image.asset(
                AppImage.dcategory,
                height: 40,
                width: 40,
              ),
              title: Text(
                AppString.textAllCategory,
                style: getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
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
                AppString.textMyOrder,
                style: getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
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
                style: getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
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
                style: getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
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
                style: getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Image.asset(
                AppImage.drewards,
                height: 40,
                width: 40,
              ),
              title: Text(
                AppString.textRewardCoupons,
                style: getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
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
                AppString.textNewsBlog,
                style: getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
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
                style: getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
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
              AppString.textRewardCoupons,
              style: getTextStyle(AppFonts.regular, AppSize.textSize18),
            ),
            SizedBox(
              width: 90,
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
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.textRewardPoints,
                  style: getTextStyle(
                      AppFonts.mediumBoldBlack2, AppSize.textSize18),
                ),
                Text(
                  AppString.textViewHistory,
                  style:
                      getTextStyle(AppFonts.regularGreen, AppSize.textSize14),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(AppImage.decoration),
              )),
              child: Row(
                children: [
                  Image.asset(
                    AppImage.rewardlogo,
                    height: 60,
                    width: 60,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppString.text1000,
                        style: getTextStyle(
                            AppFonts.boldGreen, AppSize.textSize30),
                      ),
                      Text(
                        AppString.textCurrentRewardPoints,
                        style: getTextStyle(
                            AppFonts.regularBlack2, AppSize.textSize14),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              AppString.text100Points1Dollar,
              style: getTextStyle(AppFonts.regularBlack2, AppSize.textSize14),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              AppString.textCoupons,
              style: getTextStyle(AppFonts.mediumBoldBlack, AppSize.textSize18),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: rewards().length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      height: 160,
                      color: Colors.blue,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                rewards()[index].perct!,
                                style: getTextStyle(
                                    AppFonts.regular, AppSize.textSize30),
                              ),
                              Text(
                                rewards()[index].title!,
                                style: getTextStyle(
                                    AppFonts.regular, AppSize.textSize14),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                rewards()[index].desc!,
                                style: getTextStyle(
                                    AppFonts.regular, AppSize.textSize14),
                              ),
                            ],
                          ),
                        ],
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
