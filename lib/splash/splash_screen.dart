import 'package:clone/Onboard/Onboard.dart';
import 'package:clone/core/app_config.dart';
import 'package:clone/core/app_image.dart';
import 'package:clone/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    Future.delayed(const Duration(seconds: 2), () {
      if (sp.getInt(AppConfig.textUserId) != null &&
          sp.getInt(AppConfig.textUserType) == 0) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Onboard()),
            (Route<dynamic> route) => false);
      } else if (sp.getInt(AppConfig.textUserId) != null &&
          sp.getInt(AppConfig.textUserType) == 1) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Dashboard()),
            (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Onboard()),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.appBackground),
          fit: BoxFit.cover,
        ),
      ),
    ));
  }
}
