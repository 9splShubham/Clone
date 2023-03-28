import 'package:clone/Onboard/Onboard.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/login/login.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.mainSize20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 30,
                  child: Text(
                    AppString.textRegistration,
                    textAlign: TextAlign.center,
                    style: getTextStyle(
                        AppFonts.mediumBoldBlack, AppSize.textSize24),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: AppColor.colortextbox,
                    hintText: AppString.textFullName,
                    hintStyle:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: AppColor.colortextbox,
                    hintText: AppString.textEmailAddress,
                    hintStyle:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: AppColor.colortextbox,
                    hintText: AppString.textMobileNumber,
                    hintStyle:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: AppColor.colortextbox,
                    hintText: AppString.textPassword,
                    hintStyle:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: AppColor.colortextbox,
                    hintText: AppString.textConfirmPassword,
                    hintStyle:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 40,
                  width: 230,
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: AppString.textByContinuingYoureAgreeToOur,
                        style: getTextStyle(
                            AppFonts.regularGrey, AppSize.textSize14),
                      ),
                      WidgetSpan(
                          child: SizedBox(
                        width: AppSize.mainSize6,
                      )),
                      TextSpan(
                        text: AppString.textTermANDCondition,
                        style: getTextStyle(
                            AppFonts.regularGreen, AppSize.textSize14),
                      ),
                      WidgetSpan(
                          child: SizedBox(
                        width: AppSize.mainSize6,
                      )),
                      TextSpan(
                        text: AppString.textand,
                        style: getTextStyle(
                            AppFonts.regularGrey, AppSize.textSize14),
                      ),
                      WidgetSpan(
                          child: SizedBox(
                        width: AppSize.mainSize6,
                      )),
                      TextSpan(
                        text: AppString.textPrivacyPolicy,
                        style: getTextStyle(
                            AppFonts.regularGreen, AppSize.textSize14),
                      )
                    ]),
                    softWrap: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    AppString.textContinue,
                    style: getTextStyle(AppFonts.regular, AppSize.textSize14),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.colorPrimary,
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: AppString.textAlreadyhaveanaccount,
                    style:
                        getTextStyle(AppFonts.regularGrey, AppSize.textSize14),
                  ),
                  TextSpan(
                    text: AppString.textSignIn,
                    style:
                        getTextStyle(AppFonts.regularGreen, AppSize.textSize14),
                  )
                ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
