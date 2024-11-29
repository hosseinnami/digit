import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

//String address_ip = '92.205.234.208';
String address_ip = 'digicapp.com';

double font_size_6 = 0;
double font_size_8 = 0;
double font_size_10 = 0;
double font_size_12 = 0;
double font_size_14 = 0;
double font_size_16 = 0;
double font_size_18 = 0;
double font_size_20 = 0;
double font_size_24 = 0;
double font_size_26 = 0;
double font_size_28 = 0;
double font_size_30 = 0;
double with_screen = 0;
double hight_screen = 0;
double hight_card = 90;
EmailOTP myauth = EmailOTP();
List<Color> clr_my_app = [
  Colors.blue.shade900,
  Colors.blue.shade800,
];
List<Color> clr_my_app2 = [
  Color(0xff0d0898),
  Color(0xff0c5cc5),
  Color(0xff0d0898),
];
String address = "null";
String autocompletePlace = "null";
String? deviceId;

String email = "";
String user_id = "";
Color selectedColor_qr = Color(0x00000000);
Color selectedColor_bkcard = Color(0x00000000);
String code_card = "";
String id_card_select = "";
List<Color> clr_text = [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white];
