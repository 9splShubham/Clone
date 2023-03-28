import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/login/login.dart';

import 'package:clone/set_address/setaddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
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
                  MaterialPageRoute(builder: (context) => const login()),
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 30,
              child: Text(
                AppString.textVerification,
                textAlign: TextAlign.center,
                style:
                    getTextStyle(AppFonts.mediumBoldBlack, AppSize.textSize24),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 240,
              child: Text(
                AppString.textPleaseTypeVerificationCodeSentTo,
                textAlign: TextAlign.center,
                style: getTextStyle(AppFonts.regularGrey, AppSize.textSize16),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: const Color(0xFFf2f2f2),
                  height: 50,
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
                        hintStyle: getTextStyle(
                            AppFonts.regularGrey, AppSize.textSize14)),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                const SizedBox(width: AppSize.mainSize16),
                Container(
                  color: const Color(0xFFf2f2f2),
                  height: 50,
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
                        hintStyle: getTextStyle(
                            AppFonts.regularGrey, AppSize.textSize14)),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                const SizedBox(width: AppSize.mainSize16),
                Container(
                  color: const Color(0xFFf2f2f2),
                  height: 50,
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
                        hintStyle: getTextStyle(
                            AppFonts.regularGrey, AppSize.textSize14)),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
                const SizedBox(width: AppSize.mainSize16),
                Container(
                  color: const Color(0xFFf2f2f2),
                  height: 50,
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "0",
                        hintStyle: getTextStyle(
                            AppFonts.regularGrey, AppSize.textSize14)),
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    style: Theme.of(context).textTheme.headline6,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: AppString.textDidntgettheOTP,
                  style: getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                ),
                TextSpan(
                  text: AppString.textResendOTP,
                  style:
                      getTextStyle(AppFonts.regularGreen, AppSize.textSize14),
                )
              ])),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: 320,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColor.colorPrimary,
                ),
                child: Text(
                  AppString.textVerify,
                  style: getTextStyle(AppFonts.regular, AppSize.textSize16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SetAddress()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
