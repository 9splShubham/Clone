import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '../Product_details/product_details.dart';

class AllCategory extends StatefulWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  State<AllCategory> createState() => _AllCategoryState();
}

class _AllCategoryState extends State<AllCategory> {
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
                  MaterialPageRoute(builder: (context) => Dashboard()),
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
              AppString.textAllCategory,
              style: getTextStyle(AppFonts.regular, AppSize.textSize18),
            ),
            SizedBox(
              width: 150,
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
      body: const MyStatefulWidget(),
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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Card(
              child: Container(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppImage.c1,
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      AppString.textWineLiqour,
                      style: getTextStyle(
                          AppFonts.mediumBoldBlack2, AppSize.textSize16),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    Image.asset(
                      AppImage.plus_circle,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppImage.c2,
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      AppString.textVitamins,
                      style: getTextStyle(
                          AppFonts.mediumBoldBlack2, AppSize.textSize16),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    Image.asset(
                      AppImage.plus_circle,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppImage.c3,
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      AppString.textHealth,
                      style: getTextStyle(
                          AppFonts.mediumBoldBlack2, AppSize.textSize16),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    Image.asset(
                      AppImage.plus_circle,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppImage.c4,
                      height: 40,
                      width: 40,
                    ),
                    Text(
                      AppString.textSkinCare,
                      style: getTextStyle(
                          AppFonts.mediumBoldBlack2, AppSize.textSize16),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    Image.asset(
                      AppImage.plus_circle,
                      height: 20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
