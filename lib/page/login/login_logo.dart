import 'dart:async';

import 'package:digicapp/control/db_base.dart';
import 'package:digicapp/control/select.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:digicapp/page/page_learn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../control/val/control_val.dart';
import '../../models/posts_model.dart';
import 'first_page.dart';

class frm_login_logo extends StatelessWidget {
  const frm_login_logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: page_(),
    );
  }
}

class page_ extends StatefulWidget {
  const page_({Key? key}) : super(key: key);

  @override
  State<page_> createState() => _page_State();
}

class _page_State extends State<page_> {
  @override
  void initState() {
    super.initState();
    select_login();

    create_list_circel();
  }

  Future<void> select_login() async {
    print("------deviceId-----");
    await select_tbl_pass_app();
    token_3=list_tbl_pass_app[0]['pass'].toString();
    print("------token_3-----");
    print(token_3);
    print("------token_3-----");
    Timer(Duration(seconds: 3), () async {
      print(deviceId);
      String dvic = deviceId!;
      print("------deviceId4444-----");
      await select_uda();

      if (list_user.isNotEmpty) {

        user_id = list_user[0]['id_user'].toString();
        Get.off(frm_learn());
      } else {
        Get.off(frm_first());
      }
    });

    // Timer(Duration(seconds: 2), () async {
    //   if (list_user.isNotEmpty) {
    //     user_id = list_user[0]['id_user'].toString();
    //     Get.off(frm_learn());
    //   } else {
    //     Get.off(frm_first());
    //   }
    // });
  }

  final shadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 5,
    blurRadius: 7,
    offset: const Offset(0, 2),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: with_screen,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 80,
          ),
          // Text("D I G I C A",
          //     style: GoogleFonts.roboto(
          //       textStyle: Theme.of(context).textTheme.displayLarge,
          //       color: Colors.white,
          //       fontSize: font_size_28,
          //       fontWeight: FontWeight.w700,
          //       fontStyle: FontStyle.normal,
          //     )),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            "assets/images/logo_static.png",
            width: 240,
            height: 240,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text("PREMIUM NETWORKING SOLUTION",
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.displayLarge,
                color: Colors.white,
                fontSize: font_size_20,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          CircularProgressIndicator(
            color: Colors.amber,
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

List<Widget> list_circel = [];

void create_list_circel() {
  for (int i = 0; i < stories.length; i++) {
    list_circel.add(Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        width: 65.0,
        height: 65.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: CircleAvatar(
          child: ClipOval(
            child: Image(
              height: 63.0,
              width: 63.0,
              image: AssetImage(stories[i]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ));
  }
}
