import 'dart:convert';

import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../dashboard/category.dart';
import 'product_screen.dart';

class BottomSheetProduct extends StatefulWidget {
  const BottomSheetProduct({Key? key}) : super(key: key);

  @override
  State<BottomSheetProduct> createState() => _BottomSheetProduct();
}

class _BottomSheetProduct extends State<BottomSheetProduct> {
  @override
  void initState() {
    readJson();
    super.initState();
  }

  List<Category> _category = [];
  Category selectCategory = Category();

  Future<void> readJson() async {
    print('-------read');
    final String response =
        await rootBundle.loadString('assets/json/category.json');
    final data = await json.decode(response);
    CategoryList tutorial = CategoryList.fromJson(data);
    setState(() {
      _category = tutorial.category!;
      selectCategory = _category[0];

      print('--------${_category.length}');
    });

    debugPrint('Category--${json.encode(_category)}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          AppString.textAddProduct,
                          style: getTextStyle(
                              AppFonts.semiBoldBlack2, AppSize.textSize20),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Image.asset(
                        AppImage.cancel,
                        height: 20,
                        width: 20,
                      ),
                      onTap: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Product()),
                        );
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: AppString.textEnterproductname,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.colorPrimary),
                      ),
                      hintStyle: getTextStyle(
                          AppFonts.regularGrey, AppSize.textSize16)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: AppString.textEnterproductprice,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.colorPrimary),
                      ),
                      hintStyle: getTextStyle(
                          AppFonts.regularGrey, AppSize.textSize16)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: AppString.textEnterproductimage,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.colorPrimary),
                      ),
                      hintStyle: getTextStyle(
                          AppFonts.regularGrey, AppSize.textSize16)),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Text(
                      AppString.textSelectCategory,
                      style: getTextStyle(
                          AppFonts.regularGreen, AppSize.textSize16),
                    ),
                    Container(
                      height: 50,
                      width: 90,
                      child: DropdownButton<Category>(
                        value: selectCategory,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        elevation: 16,
                        style: const TextStyle(color: AppColor.colorBlack),
                        underline: Container(
                          height: 2,
                          color: AppColor.colorPrimary,
                        ),
                        onChanged: (Category? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            selectCategory = value!;
                          });
                        },
                        items: _category
                            .map<DropdownMenuItem<Category>>((Category value) {
                          return DropdownMenuItem<Category>(
                            value: value,
                            child: Text(value.name!),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(AppString.textAdd,
                        style:
                            getTextStyle(AppFonts.regular, AppSize.textSize16)),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.colorPrimary,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
