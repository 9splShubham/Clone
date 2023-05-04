import 'dart:convert';

import 'package:clone/Onboard/Onboard.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_config.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:clone/forgot_password/forgot_password.dart';
import 'package:clone/login/DbHelper.dart';
import 'package:clone/login/com_helper.dart';

import 'package:clone/login/navigator_key.dart';

import 'package:clone/otp_verification/otp_verification.dart';
import 'package:clone/registration/registration.dart';
import 'package:clone/set_address/setaddress.dart';
import 'package:clone/vendor/vendor.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'user_model.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.colorWhite,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: IconButton(
              icon: Image.asset(
                AppImage.back,
                height: 30,
                width: 30,
                fit: BoxFit.fill,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Onboard()),
                );
              },
            ),
          ),
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final emailaddress = TextEditingController();
  final password = TextEditingController();
  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String email = emailaddress.text;
    String passwd = password.text;

    if (email.isEmpty) {
      alertDialog("Please Enter User ID");
    } else if (passwd.isEmpty) {
      alertDialog("Please Enter Password");
    } else {
      print('else------->');
      await dbHelper.getLoginUser(email, passwd).then((userData) {
        if (userData != null && userData.email != null) {
          print('else------->then----->');
          setSP(userData).whenComplete(() {
            if (userData.usertype == 0) {
              Navigator.pushAndRemoveUntil(
                  NavigatorKey.navigatorKey.currentContext!,
                  MaterialPageRoute(builder: (_) => const Vendor()),
                  (Route<dynamic> route) => false);
            } else {
              Navigator.pushAndRemoveUntil(
                  NavigatorKey.navigatorKey.currentContext!,
                  MaterialPageRoute(builder: (_) => const SetAddress()),
                  (Route<dynamic> route) => false);
            }
          });

          /*   setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                NavigatorKey.navigatorKey.currentContext!,
                MaterialPageRoute(builder: (_) => const Dashboard()),
                (Route<dynamic> route) => false);
          });*/
        } else {
          alertDialog("Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        alertDialog("Error: Login Fail");
      });
    }
  }

  Future setSP(UserModel user) async {
    final SharedPreferences sp = await _pref;

    print('object--->${jsonEncode(user)}');

    ///sp.setString("id", user.id!);
    sp.setInt(AppConfig.textUserId, user.id!);
    sp.setString("name", user.name!);
    sp.setString("email", user.email!);
    sp.setString("mobileno", user.mobileno!);
    sp.setString("password", user.password!);
    sp.setInt(AppConfig.textUserType, user.usertype!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.mainSize20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 30,
                child: Text(
                  AppString.textLogin,
                  style: getTextStyle(
                      AppFonts.mediumBoldBlack, AppSize.textSize24),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 50,
                width: 320,
                child: TextField(
                  controller: emailaddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: AppColor.colortextbox,
                    hintText: AppString.textEnteremailormobilenumber,
                    hintStyle:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 50,
                width: 320,
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: AppColor.colortextbox,
                      hintText: AppString.textEnterpassword,
                      hintStyle: getTextStyle(
                          AppFonts.regularGrey, AppSize.textSize14)),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 15,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppString.textForgotPassword,
                    style:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword()));
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 320,
              child: ElevatedButton(
                child: Text(
                  AppString.textLogin,
                  style: getTextStyle(AppFonts.regular, AppSize.textSize16),
                ),
                style: ElevatedButton.styleFrom(
                  primary: AppColor.colorPrimary,
                ),
                onPressed: () {
                  login();
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              child: Container(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: AppString.textDonthaveanaccount,
                    style:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                  TextSpan(
                      text: AppString.textRegisterNow,
                      style: getTextStyle(
                          AppFonts.regularGreen, AppSize.textSize14))
                ])),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Registration()));
              },
            )
          ],
        ),
      ),
    );
  }
}
