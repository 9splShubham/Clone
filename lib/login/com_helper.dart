import 'package:clone/login/navigator_key.dart';
import 'package:clone/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:toast/toast.dart';

/*void onLogout() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.clear();
  Navigator.of(context as BuildContext).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => Splash()),
      (Route<dynamic> route) => false);
}*/

alertDialog(String msg) {
  //Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  //Toast.show(msg, duration: Toast.lengthShort, gravity: Toast.bottom);
  print('msg--$msg');
  print(
      'NavigatorKey.navigatorKey.currentContext--${NavigatorKey.navigatorKey.currentContext}');
  showAlertDialog(NavigatorKey.navigatorKey.currentContext!, msg);
}

showAlertDialog(BuildContext context, String msg) {
  // set up the button
  Widget okCancel = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      // onLogout();
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text(msg),
    actions: [
      okCancel,
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

validateEmail(String email) {
  final emailReg = new RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  return emailReg.hasMatch(email);
}
