import 'dart:async';

import 'package:clone/core/app_color.dart';
import 'package:clone/core/app_fonts.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/core/app_size.dart';
import 'package:clone/core/app_string.dart';
import 'package:clone/dashboard/dashboard.dart';

import 'package:clone/otp_verification/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SetAddress extends StatefulWidget {
  const SetAddress({Key? key}) : super(key: key);

  @override
  State<SetAddress> createState() => _SetAddressState();
}

class _SetAddressState extends State<SetAddress> {
  late var _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.04514731288731, 72.51512427787496),
    zoom: 17.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(23.04514731288731, 72.51512427787496),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{
    MarkerId('marker_id_1'): Marker(
      markerId: MarkerId('marker_id_1'),
      position: LatLng(23.04514731288731, 72.51512427787496),
      infoWindow: InfoWindow(
        title: 'My current location',
      ),
      onTap: () {
        //_onMarkerTapped(markerId);
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },
    )
  };

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
                height: 400,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  markers: Set<Marker>.of(markers.values),
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
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
                      BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: AppColor.colorPrimary,
                        unselectedItemColor:
                            AppColor.colorBlack.withOpacity(.60),
                        selectedFontSize: 14,
                        unselectedFontSize: 14,
                        currentIndex: _currentIndex,
                        onTap: _onItemTapped,
                        elevation: 0,
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            label: AppString.textHome,
                            icon: Icon(Icons.home_outlined),
                          ),
                          BottomNavigationBarItem(
                            label: AppString.textOffice,
                            icon: Icon(Icons.apartment),
                          ),
                          BottomNavigationBarItem(
                            label: AppString.textFamily,
                            icon: Icon(Icons.family_restroom_outlined),
                          ),
                          BottomNavigationBarItem(
                            label: AppString.textOther,
                            icon: Icon(Icons.pin_drop_outlined),
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
