import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../control/val/control_val.dart';
import '../../widget/btn_nav.dart';
import 'login_page.dart';
import 'new_user.dart';

class frm_first extends StatelessWidget {
  const frm_first({Key? key}) : super(key: key);

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
          Text("Save Trees, Save the Planet, Save our Future",
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.displayLarge,
                color: Colors.white,
                fontSize: font_size_16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: btn_digica_1(
                        onPressed: () async {
                          Get.to(frm_login());
                        },
                        lbl: "Login")),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    flex: 1,
                    child: btn_digica_1(
                        onPressed: () async {
                          Get.to(new_user());
                        },
                        lbl: "Sign Up"))
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text("By Massive Dynamic Technologies",
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.displayLarge,
                color: Colors.white,
                fontSize: font_size_14,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
        ],
      ),
    );
  }
}
