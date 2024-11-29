import 'dart:io';

import 'package:digicapp/page/login/login_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:mobile_unique_id/mobile_unique_id.dart';

import 'control/val/control_val.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  runApp(ResponsiveTextWidget());
  getdeviceId();
  await dotenv.load();
  String? shopifyToken = dotenv.env['SHOPIFY_ACCESS_TOKEN'];
  String? githubToken = dotenv.env['GITHUB_PERSONAL_ACCESS_TOKEN'];

  print(shopifyToken); // تست خروجی
}

class ResponsiveTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    with_screen = MediaQuery.of(context).size.width;
    hight_screen = MediaQuery.of(context).size.height;

    font_size_6 = 6 * (screenWidth / 375);
    font_size_8 = 8 * (screenWidth / 375);
    font_size_10 = 10 * (screenWidth / 375);
    font_size_12 = 12 * (screenWidth / 375);
    font_size_14 = 14 * (screenWidth / 375);
    font_size_16 = 16 * (screenWidth / 375);
    font_size_18 = 18 * (screenWidth / 375);
    font_size_20 = 20 * (screenWidth / 375);
    font_size_24 = 24 * (screenWidth / 375);
    font_size_26 = 26 * (screenWidth / 375);
    font_size_28 = 28 * (screenWidth / 375);
    font_size_30 = 30 * (screenWidth / 375);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Digica',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: frm_login_logo(),
      // home: PageViewDemo(),
      // home: MyApp(),
    );
  }
}

Future<void> getdeviceId() async {
  final _mobileUniqueIdPlugin = MobileUniqueId();

  deviceId =  await _mobileUniqueIdPlugin.getUniqueId();
  print(deviceId);
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
