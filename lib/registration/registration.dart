import 'dart:convert';
import 'package:clone/login/DbHelper.dart';
import 'package:clone/login/com_helper.dart';

import 'package:clone/login/user_repo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:clone/Onboard/Onboard.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/login/login.dart';

import 'package:flutter/material.dart';

import '../login/user_model.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = new GlobalKey<FormState>();

  final fullnamecontroller = TextEditingController();
  final emailaddresscontroller = TextEditingController();
  final mobilenumbercontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  var dbHelper;

  @override
  int _value = 2;

  void initState() {
    super.initState();
    dbHelper = DbHelper();

    _value = 0;
  }

  signUp() async {
    String fullname = fullnamecontroller.text;
    String emailaddress = emailaddresscontroller.text;
    String mobilenumber = mobilenumbercontroller.text;
    String password = passwordcontroller.text;
    String confirmpassword = confirmpasswordcontroller.text;
    String userTypeName = '';

    bool isExist = false;
    if (emailaddress.isNotEmpty) {
      await dbHelper.getCheckEmailUser(emailaddress).then((userData) {
        if (userData != null && userData.email != null) {
          isExist = true;
        }
      });

      if (_value == 0) {
        userTypeName = 'Vendor';
      } else {
        userTypeName = 'Customer';
      }

      /* if (_value == 1) {
        await dbHelper.printVendor().then((userData) {});
      } else if (_value == 2) {
        await dbHelper.printCustomer().then((userData) {});
      }*/
    }

    /* else if (_value == 1) {
      await dbHelper.printVendor(_value).then((userData) {});
    }*/

    ///if (_formKey.currentState!.validate()) {

    if (fullname.isEmpty) {
      alertDialog("Please Enter Name");
    } else if (emailaddress.isEmpty) {
      alertDialog("Please Enter Email ID");
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
        .hasMatch(emailaddress)) {
      alertDialog("Invalid Email");
    } else if (isExist) {
      alertDialog("This Email ID already Exists. Please Enter new Email");
    } else if (mobilenumber.isEmpty) {
      alertDialog("Please Enter Mobile No");
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(mobilenumber)) {
      alertDialog("Invalid Mobile No");
    }
    /*else if (!RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$')
        .hasMatch(mobilenumber)) {
      alertDialog("Invalid Mobile No");
    } */
    else if (password.isEmpty) {
      alertDialog("Please Enter Password");
    } else if (!RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)')
        .hasMatch(password)) {
      alertDialog(
          "Please Enter Strong Password\n\nHint : Password must contain Upper/Lower case, number and special character");
    } else if (confirmpassword.isEmpty) {
      alertDialog("Please Enter Confirm Password");
    } else if (password != confirmpassword) {
      alertDialog('Password Mismatch');
    }
    /*else if (emailaddress == DbHelper.C_Email) {
      print('else _if----->');
      alertDialog('Email Already Exist');
    } */
    else {
      ///_formKey.currentState!.save();

      UserModel uModel = UserModel();

      uModel.name = fullname;
      uModel.email = emailaddress;
      uModel.mobileno = mobilenumber;
      uModel.password = password;
      uModel.usertype = _value;
      uModel.usertypeName = userTypeName;
      dbHelper = DbHelper();
      await dbHelper.saveData(uModel).then((userData) {
        alertDialog("Successfully Saved");

        Navigator.push(context, MaterialPageRoute(builder: (_) => login()));
      }).catchError((error) {
        print(error);
        alertDialog("Error: Data Save Fail--`$error");
      });
    }
  }

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
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          body: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppSize.mainSize20),
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
                        controller: fullnamecontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: AppColor.colortextbox,
                          hintText: AppString.textFullName,
                          hintStyle: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: emailaddresscontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: AppColor.colortextbox,
                          hintText: AppString.textEmailAddress,
                          hintStyle: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: mobilenumbercontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: AppColor.colortextbox,
                          hintText: AppString.textMobileNumber,
                          hintStyle: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: AppColor.colortextbox,
                          hintText: AppString.textPassword,
                          hintStyle: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: confirmpasswordcontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: AppColor.colortextbox,
                          hintText: AppString.textConfirmPassword,
                          hintStyle: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                            activeColor: AppColor.colorPrimary,
                            value: 0,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value!;
                              });
                            }),
                        Text("Vendor"),
                        Radio(
                            activeColor: AppColor.colorPrimary,
                            value: 1,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value!;
                              });
                            }),
                        Text("Customer"),
                      ],
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
                          style: getTextStyle(
                              AppFonts.regular, AppSize.textSize14),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.colorPrimary,
                        ),
                        onPressed: () {
                          signUp();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppString.textAlreadyhaveanaccount,
                          style: getTextStyle(
                              AppFonts.regularGrey, AppSize.textSize14),
                        ),
                        InkWell(
                          child: Text(
                            AppString.textSignIn,
                            style: getTextStyle(
                                AppFonts.regularGreen, AppSize.textSize14),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login()));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
