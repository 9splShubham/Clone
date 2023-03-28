import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> notifications = [
    AppString.textn1,
    AppString.textn2,
    AppString.textn3,
    AppString.textn4,
    AppString.textn5,
    AppString.textn6,
    AppString.textn7,
  ];

  final List<String> time = [
    AppString.textd1,
    AppString.textd2,
    AppString.textd3,
    AppString.textd4,
    AppString.textd5,
    AppString.textd6,
    AppString.textd7,
  ];

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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(notifications[index],
                                    style: index == 0 || index == 1
                                        ? getTextStyle(AppFonts.regularBlack2,
                                            AppSize.textSize14)
                                        : getTextStyle(AppFonts.regularGrey,
                                            AppSize.textSize14)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  time[index],
                                  style: getTextStyle(
                                      AppFonts.regularGrey, AppSize.textSize14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
