import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/login/login.dart';
import 'package:clone/registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _login() async {
    try {
      await _googleSignIn.signIn();
      // User signed in successfully
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 56, left: 68, right: 68, bottom: 13),
            child: Container(
              child: Image.asset(AppImage.onboard),
            ),
          ),
          SizedBox(
            height: 50,
            width: 320,
            child: ElevatedButton(
              child: Text(AppString.textSignUp,
                  style: getTextStyle(AppFonts.regular, AppSize.textSize16)),
              style: ElevatedButton.styleFrom(
                primary: AppColor.colorPrimary,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Registration()));
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
                AppString.textContinueasaGuest,
                style: getTextStyle(
                  AppFonts.regularGreen,
                  AppSize.textSize16,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: AppColor.colorWhite,
                  side:
                      const BorderSide(color: AppColor.colorPrimary, width: 2)),
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Text(
            AppString.textor,
            style: getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
              height: 50,
              width: 320,
              child: OutlinedButton.icon(
                label: Text(
                  AppString.textContinuewithFacebook,
                  style: getTextStyle(AppFonts.regular, AppSize.textSize16),
                ),
                icon: Image.asset(
                  AppImage.fb,
                  height: 30,
                  width: 30,
                ),
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.colorBlue),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
              height: 50,
              width: 320,
              child: OutlinedButton.icon(
                label: Text(
                  AppString.textContinuewithGoogle,
                  style:
                      getTextStyle(AppFonts.regularBlack, AppSize.textSize16),
                ),
                icon: Image.asset(
                  AppImage.google,
                  height: 30,
                  width: 30,
                ),
                onPressed: () {
                  _login();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColor.colorWhite),
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          /*     Text.rich(TextSpan(children: [
            TextSpan(
                text: AppString.textAlreadyhaveanaccount,
                style: getTextStyle(AppFonts.regularGrey, AppSize.textSize14)),
            TextSpan(
                text: AppString.textSignIn,
                style: getTextStyle(AppFonts.regularGreen, AppSize.textSize14))
          ]))*/
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppString.textAlreadyhaveanaccount,
                  style:
                      getTextStyle(AppFonts.regularGrey, AppSize.textSize14)),
              InkWell(
                child: Text(
                  AppString.textSignIn,
                  style:
                      getTextStyle(AppFonts.regularGreen, AppSize.textSize14),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
