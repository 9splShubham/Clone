import 'package:clone/Onboard/Onboard.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/forgot_password/forgot_password.dart';
import 'package:clone/otp_verification/otp_verification.dart';
import 'package:clone/registration/registration.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.mainSize20),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OtpVerification()),
                  );
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
                      style: getTextStyle(
                          AppFonts.regularGrey, AppSize.textSize14)),
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
