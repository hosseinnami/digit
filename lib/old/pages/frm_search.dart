import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/widget/btn_nav.dart';
import 'package:digicapp/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class search_1 extends StatefulWidget {
  const search_1({Key? key}) : super(key: key);

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<search_1> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  List<Color> clr_my_app5 = [
    Colors.black,
    Colors.blueGrey.shade700,
    Colors.blueGrey.shade500,
    Colors.white,
    Colors.blueGrey.shade100,
    Colors.grey.shade100,
  ];
  List<Color> clr_my_app1 = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  final Color kDarkBlueColor = const Color(0xFF053149);
  final BoxShadow kDefaultBoxshadow = const BoxShadow(
    color: Colors.transparent,
    spreadRadius: 1,
    blurRadius: 10,
    offset: Offset(2, 2),
  );

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, colors: [
            clr_my_app1[1],
            clr_my_app1[2],
            clr_my_app1[3],
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            card_sade(
              w_: with_screen,
              h_: 30,
              color_: Colors.grey.withOpacity(0.4),
              crop_: 20,
              child_: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: TextField(
                                controller: TextEditingController(),
                                keyboardType: TextInputType.text,
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  color: Colors.grey.shade200,
                                  fontSize: font_size_16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                                decoration: const InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  labelStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("TOP 10",
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.white,
                        fontSize: font_size_30,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  Text("July",
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.white,
                        fontSize: font_size_18,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                        clr_my_app5[0],
                        clr_my_app5[3],
                        clr_my_app5[3],
                      ]),
                    ),
                    height: 400,
                    width: with_screen,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "assets/images/DG-SRCH-1.png",
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(2.0)), color: Colors.blue.withOpacity(0.1)),
                    height: 100,
                    width: with_screen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Icon(
                        //   Icons.account_box,
                        //   size: 60,
                        // ),
                        // Icon(
                        //   Icons.account_box,
                        //   size: 60,
                        // ),
                        // Icon(
                        //   Icons.account_box,
                        //   size: 60,
                        // ),
                        // Icon(
                        //   Icons.account_box,
                        //   size: 60,
                        // ),
                        // Icon(
                        //   Icons.account_box,
                        //   size: 60,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                              clr_my_app5[0],
                              clr_my_app5[3],
                              clr_my_app5[3],
                            ]),
                          ),
                          height: 300,
                          width: with_screen,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/DG-SRCH-3.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(2.0)), color: Colors.transparent),
                          height: 50,
                          width: with_screen,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                              clr_my_app5[0],
                              clr_my_app5[3],
                              clr_my_app5[3],
                            ]),
                          ),
                          height: 300,
                          width: with_screen,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/DG-SRCH-4.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(2.0)), color: Colors.transparent),
                          height: 50,
                          width: with_screen,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                        clr_my_app5[0],
                        clr_my_app5[3],
                        clr_my_app5[3],
                      ]),
                    ),
                    height: 150,
                    width: with_screen,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "assets/images/DG-SRCH-5.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(2.0)), color: Colors.blue.withOpacity(0.1)),
                    height: 50,
                    width: with_screen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Icon(
                        //   Icons.account_box,
                        //   size: 45,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("TOP 5",
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.white,
                        fontSize: font_size_30,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                  Text("July",
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.white,
                        fontSize: font_size_18,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                        clr_my_app5[0],
                        clr_my_app5[3],
                        clr_my_app5[3],
                      ]),
                    ),
                    height: 400,
                    width: with_screen,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "assets/images/DG-SRCH-2.png",
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(2.0)), color: Colors.blue.withOpacity(0.1)),
                    height: 100,
                    width: with_screen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Icon(
                        //   Icons.account_box,
                        //   size: 60,
                        // ),
                        // Icon(
                        //   Icons.account_box,
                        //   size: 60,
                        // ),
                        // Icon(
                        //   Icons.account_box,
                        //   size: 60,
                        // ),
                        // Icon(
                        //   Icons.account_box,
                        //   size: 60,
                        // ),
                        // Icon(
                        //   Icons.account_box,
                        //   size: 60,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                              clr_my_app5[0],
                              clr_my_app5[3],
                              clr_my_app5[3],
                            ]),
                          ),
                          height: 300,
                          width: with_screen,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/DG-SRCH-7.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(2.0)), color: Colors.blue.withOpacity(0.1)),
                          height: 50,
                          width: with_screen,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                              clr_my_app5[0],
                              clr_my_app5[3],
                              clr_my_app5[3],
                            ]),
                          ),
                          height: 300,
                          width: with_screen,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                              "assets/images/DG-SRCH-8.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(2.0)), color: Colors.blue.withOpacity(0.1)),
                          height: 50,
                          width: with_screen,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                      gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                        clr_my_app5[0],
                        clr_my_app5[3],
                        clr_my_app5[3],
                      ]),
                    ),
                    height: 150,
                    width: with_screen,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        "assets/images/DG-SRCH-6.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(2.0)), color: Colors.blue.withOpacity(0.1)),
                    height: 50,
                    width: with_screen,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Icon(
                        //   Icons.account_box,
                        //   size: 45,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
      //bottomNavigationBar: mainFooterPage(),
      bottomNavigationBar: const navig(),
    );
  }
}
