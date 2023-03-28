import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/login/login.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                child: Text(
                  AppString.textForgotPassword,
                  style: getTextStyle(
                      AppFonts.mediumBoldBlack, AppSize.textSize24),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 230,
            child: Text(
              AppString.textmessage,
              textAlign: TextAlign.center,
              style: getTextStyle(AppFonts.regularGrey, AppSize.textSize16),
            ),
          ),
          SizedBox(
            height: 20,
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
            height: 110,
          ),
          SizedBox(
            height: 50,
            width: 320,
            child: ElevatedButton(
              child: Text(
                AppString.textSubmit,
                style: getTextStyle(AppFonts.regular, AppSize.textSize16),
              ),
              style: ElevatedButton.styleFrom(
                primary: AppColor.colorPrimary,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
