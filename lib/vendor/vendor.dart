import 'package:clone/Add_to_cart/AddToCart.dart';
import 'package:clone/Onboard/Onboard.dart';
import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/login/com_helper.dart';
import 'package:clone/vendor/product_screen.dart';
import 'package:flutter/material.dart';

import 'my_order_screen.dart';
import 'order_history.dart';

class Vendor extends StatefulWidget {
  const Vendor({Key? key}) : super(key: key);

  @override
  State<Vendor> createState() => _VendorState();
}

class _VendorState extends State<Vendor> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.colorPrimary,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppString.textVendor,
                  style: getTextStyle(AppFonts.semiBold, AppSize.textSize20),
                ),
                const SizedBox(
                  width: 70,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Onboard()));
                  },
                  icon: Icon(
                    Icons.logout,
                  ),
                )
              ],
            ),
          ),
        ),
        body: MyStatefulWidget(),
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
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.production_quantity_limits,
                    size: 35,
                  ),
                  backgroundColor: AppColor.colorPrimary,
                  label: AppString.textProduct),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit_note_rounded),
                  backgroundColor: AppColor.colorPrimary,
                  label: AppString.textMyorder),
              BottomNavigationBarItem(
                icon: Icon(Icons.history, size: 35),
                backgroundColor: AppColor.colorPrimary,
                label: AppString.textOrderHistory,
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: selectedIndex,
            iconSize: 40,
            onTap: _onItemTapped,
            elevation: 5),
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          Product(),
          MyOrder(),
          OrderHistory(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
