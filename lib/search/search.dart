/*
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/category.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => search();
}

class search extends State<SearchScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColor.colorPrimary,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                icon: Image.asset(
                  AppImage.back2,
                  height: 30,
                  fit: BoxFit.fill,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  );
                },
              ),
              Text(
                AppString.textsearch,
                style: getTextStyle(AppFonts.regular, AppSize.textSize18),
              ),
              SizedBox(
                width: 140,
              ),
              IconButton(
                icon: Image.asset(
                  AppImage.tab,
                  fit: BoxFit.fill,
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: 10,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: AppColor.colorPrimary,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                child: TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          AppImage.search,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: AppColor.colortextbox,
                      hintText: AppString.textMultivit,
                      hintStyle: getTextStyle(
                          AppFonts.regularGrey, AppSize.textSize14)),
                ),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 800,
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                        height: 240,
                        child: Column(
                          children: [
                            Container(
                              height: 130,
                              child: Image.asset(
                                Products2()[index].image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Wrap(
                                children: [
                                  Text(
                                    Products2()[index].name!,
                                    style: getTextStyle(AppFonts.regularBlack2,
                                        AppSize.textSize14),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        Products2()[index].price!,
                                        style: getTextStyle(
                                            AppFonts.regularGreen,
                                            AppSize.textSize14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Align(
                            //   alignment: Alignment.topLeft,
                            //   child:
                            // ),
                          ],
                        )),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
*/
