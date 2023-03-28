import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                onTap: () {},
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
                AppString.textNotification,
                style: getTextStyle(AppFonts.regular, AppSize.textSize18),
              ),
              SizedBox(
                width: 160,
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Card(
                child: Container(
                  height: 240,
                  width: 160,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
