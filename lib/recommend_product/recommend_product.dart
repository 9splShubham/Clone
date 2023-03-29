import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/category.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class RecommendProducts extends StatefulWidget {
  const RecommendProducts({Key? key}) : super(key: key);

  @override
  State<RecommendProducts> createState() => _RecommendProductsState();
}

class _RecommendProductsState extends State<RecommendProducts> {
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
                AppString.textRecommendProduct,
                style: getTextStyle(AppFonts.regular, AppSize.textSize18),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                icon: Image.asset(
                  AppImage.tab,
                  fit: BoxFit.fill,
                ),
                onPressed: () {},
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 750,
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
                                height: 100,
                                child: Image.asset(
                                  Products()[index].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Wrap(
                                  children: [
                                    Text(
                                      Products()[index].name!,
                                      style: getTextStyle(
                                          AppFonts.regularBlack2,
                                          AppSize.textSize14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          Products()[index].price!,
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
      ),
    );
  }
}
