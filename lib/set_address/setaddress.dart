import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';

import 'package:clone/otp_verification/otp_verification.dart';
import 'package:flutter/material.dart';

class SetAddress extends StatefulWidget {
  const SetAddress({Key? key}) : super(key: key);

  @override
  State<SetAddress> createState() => _SetAddressState();
}

class _SetAddressState extends State<SetAddress> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.colorWhite,
          elevation: 0,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
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
                      MaterialPageRoute(
                          builder: (context) => const OtpVerification()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  AppString.textSearchCity,
                  style: getTextStyle(AppFonts.regularGrey, AppSize.textSize16),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 280,
                width: double.infinity,
                child: Image.asset(
                  AppImage.Map,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppImage.location,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppString.text841MontgomerySt,
                                style: getTextStyle(AppFonts.mediumBoldBlack,
                                    AppSize.textSize14),
                              ),
                              Text(
                                AppString.textJerseyCityNJ07306USA,
                                style: getTextStyle(
                                    AppFonts.regularBlack, AppSize.textSize12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: AppColor.colortextbox,
                            hintText: AppString.textAddaddressinformation,
                            hintStyle: getTextStyle(
                                AppFonts.regularGrey, AppSize.textSize14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            fillColor: AppColor.colortextbox,
                            hintText: AppString.textZip,
                            hintStyle: getTextStyle(
                                AppFonts.regularGrey, AppSize.textSize14),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AppString.textThisaddresswillappearas,
                          style: getTextStyle(
                              AppFonts.regularBlack, AppSize.textSize12),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppImage.house,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppString.textHome,
                            style: getTextStyle(
                              AppFonts.regularBlack,
                              AppSize.textSize12,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                            AppImage.building,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppString.textOffice,
                            style: getTextStyle(
                              AppFonts.regularBlack,
                              AppSize.textSize12,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                            AppImage.family,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppString.textFamily,
                            style: getTextStyle(
                              AppFonts.regularBlack,
                              AppSize.textSize12,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Image.asset(
                            AppImage.location2,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppString.textOther,
                            style: getTextStyle(
                              AppFonts.regularBlack,
                              AppSize.textSize12,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text(
                            AppString.textSaveContinue,
                            style: getTextStyle(
                                AppFonts.regular, AppSize.textSize16),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.colorPrimary,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
