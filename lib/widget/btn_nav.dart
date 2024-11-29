import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digicapp/control/insert.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:digicapp/page/card/page_my_card.dart';
import 'package:digicapp/page/card/widghet_creat_list_card.dart';
import 'package:digicapp/page/frm_menu.dart';
import 'package:digicapp/page/page_contact.dart';
import 'package:digicapp/page/page_learn.dart';
import 'package:digicapp/page/page_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../control/help.dart';
import '../control/select.dart';

int page_navig = 0;

class navig extends StatefulWidget {
  const navig({Key? key}) : super(key: key);

  @override
  State<navig> createState() => _navigState();
}

class _navigState extends State<navig> {
  double size_icon = 38;
  String code_card = "";
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    code_card = create_new_code();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CurvedNavigationBar(
              height: 70,
              key: _bottomNavigationKey,
              index: page_navig,
              items: <Widget>[
                Image.asset(
                  "assets/images/9.png",
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/27.png",
                  width: size_icon,
                  height: size_icon,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Image.asset(
                    "assets/images/28.png",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Image.asset(
                  "assets/images/19.png",
                  width: size_icon,
                  height: size_icon,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/17.png",
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                ),
              ],
              color: Colors.grey.shade900,
              buttonBackgroundColor: Colors.grey.shade900,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 1000),
              onTap: (index) async {
                page_navig = index;
                print(page_navig);
                if (page_navig == 1) {
                  Get.to(const frm_map());
                  setState(() {
                    clr_text = [Colors.white, Color.fromRGBO(255, 199, 9, 1), Colors.white, Colors.white, Colors.white];
                  });
                } else if (page_navig == 0) {
                  setState(() {
                    clr_text = [Color.fromRGBO(255, 199, 9, 1), Colors.white, Colors.white, Colors.white, Colors.white];
                  });
                  please_waite(context);

                  await select_tbl_card();
                  if (list_card.isEmpty) {
                    await insertCard(
                        "My First Digital Card",
                        list_user[0]['name_user'].toString(),
                        list_user[0]['family_user'].toString(),
                        "",
                        "",
                        "",
                        list_user[0]['email_user'].toString(),
                        "",
                        "",
                        "",
                        "",
                        "",
                        "",
                        "${user_id}_${list_card.length}",
                        "",
                        "",
                        "",
                        "",
                        user_id,
                        DateTime.now(),
                        1,
                        1,
                        code_card,
                        "",
                        0,
                        0,
                        0);
                  }
                  await create_list_card();
                  await select_tbl_card_id_card(list_card[0]['id_card'].toString());
                  await select_tbl_link_card(list_card_select[0]['card_code'].toString());
                  Navigator.of(context).pop();
                  await Get.to(const my_card());
                } else if (page_navig == 2) {
                  Get.to(const frm_learn());
                  setState(() {
                    clr_text = [Colors.white, Colors.white, Color.fromRGBO(255, 199, 9, 1), Colors.white, Colors.white];
                  });
                } else if (page_navig == 3) {
                  setState(() {
                    clr_text = [Colors.white, Colors.white, Colors.white, Color.fromRGBO(255, 199, 9, 1), Colors.white];
                  });
                  await select_tbl_card();
                  if (list_card.isNotEmpty) {
                    please_waite(context);
                    list_combo = [];

                    for (int i = 0; i < list_card.length; i++) {
                      list_combo.add(list_card[i]['card_title'].toString());
                    }
                    list_combo.add("Draft");
                    selectedItem = list_combo.first;
                    await select_tbl_card_user_id_titr(selectedItem);
                    await select_tbl_contact_card(list_card_select[0]['id_card'].toString());
                    Navigator.of(context).pop();
                    await Get.to(const frm_contact());
                  }
                } else if (page_navig == 4) {
                  Get.to(const my_menu());
                  setState(() {
                    clr_text = [
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Color.fromRGBO(255, 199, 9, 1),
                    ];
                  });
                }
              },
              letIndexChange: (index) => true,
            ),
            Container(
              color: Colors.grey.shade900,
              height: 10,
            ),
          ],
        ),
        Container(
          color: Colors.transparent,
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      clr_text = [Color.fromRGBO(255, 199, 9, 1), Colors.white, Colors.white, Colors.white, Colors.white];
                    });
                    please_waite(context);

                    await select_tbl_card();
                    if (list_card.isEmpty) {
                      await insertCard(
                          "My First Digital Card",
                          list_user[0]['name_user'].toString(),
                          list_user[0]['family_user'].toString(),
                          "",
                          "",
                          "",
                          list_user[0]['email_user'].toString(),
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "${user_id}_${list_card.length}",
                          "",
                          "",
                          "",
                          "",
                          user_id,
                          DateTime.now(),
                          1,
                          1,
                          code_card,
                          "",
                          0,
                          0,
                          0);
                    }
                    await create_list_card();
                    await select_tbl_card_id_card(list_card[0]['id_card'].toString());
                    await select_tbl_link_card(list_card_select[0]['card_code'].toString());
                    Navigator.of(context).pop();
                    await Get.to(const my_card());
                  },
                  child: Container(
                    child: Center(
                      child: Text("My cards",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: clr_text[0],
                            fontSize: font_size_10,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.to(const frm_map());
                    setState(() {
                      clr_text = [Colors.white, Color.fromRGBO(255, 199, 9, 1), Colors.white, Colors.white, Colors.white];
                    });
                  },
                  child: Container(
                    child: Center(
                      child: Text("Map",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: clr_text[1],
                            fontSize: font_size_10,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.to(const frm_learn());
                    setState(() {
                      clr_text = [Colors.white, Colors.white, Color.fromRGBO(255, 199, 9, 1), Colors.white, Colors.white];
                    });
                  },
                  child: Container(
                    child: Center(
                      child: Text("News",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: clr_text[2],
                            fontSize: font_size_10,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    setState(() {
                      clr_text = [Colors.white, Colors.white, Colors.white, Color.fromRGBO(255, 199, 9, 1), Colors.white];
                    });
                    await select_tbl_card();
                    if (list_card.isNotEmpty) {
                      please_waite(context);
                      list_combo = [];

                      for (int i = 0; i < list_card.length; i++) {
                        list_combo.add(list_card[i]['card_title'].toString());
                      }
                      list_combo.add("Draft");
                      selectedItem = list_combo.first;
                      await select_tbl_card_user_id_titr(selectedItem);
                      await select_tbl_contact_card(list_card_select[0]['id_card'].toString());
                      Navigator.of(context).pop();
                      await Get.to(const frm_contact());
                    }
                  },
                  child: Container(
                    child: Center(
                      child: Text("Contacts",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: clr_text[3],
                            fontSize: font_size_10,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.to(const my_menu());
                    setState(() {
                      clr_text = [
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Color.fromRGBO(255, 199, 9, 1),
                      ];
                    });
                  },
                  child: Container(
                    child: Center(
                      child: Text("Settings",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: clr_text[4],
                            fontSize: font_size_10,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.normal,
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class btn_me2 extends StatelessWidget {
  final String text_;
  final Color color_;
  final double width_;
  final double height_;
  final VoidCallback onPressed;
  final Icon icon_;
  final double size_font;
  const btn_me2(
      {Key? key,
      required this.text_,
      required this.color_,
      required this.width_,
      required this.height_,
      required this.onPressed,
      required this.icon_,
      required this.size_font})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width_,
      height: height_,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: color_,
        ),
        icon: icon_,
        onPressed: onPressed,
        label: Text(text_,
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.displayLarge,
              color: Colors.black,
              fontSize: font_size_14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
      ),
    );
  }
}

class btn_digica_1 extends StatelessWidget {
  final VoidCallback onPressed;
  final String lbl;

  const btn_digica_1({Key? key, required this.onPressed, required this.lbl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    height: 55,
                    "assets/images/Button_80x100_Left.png",
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                    },
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Image.asset(
                      height: 55,
                      "assets/images/Button_170x100_Center.png",
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  child: Image.asset(
                    height: 55,
                    "assets/images/Button_80x100_Right.png",
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                    },
                  ),
                ),
              ],
            ),
            Text(lbl,
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  color: Colors.white,
                  fontSize: font_size_18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          ],
        ));
  }
}

class btn_digica_2 extends StatelessWidget {
  final VoidCallback onPressed;
  final String lbl;
  final double w_;
  final double h_;

  const btn_digica_2({Key? key, required this.onPressed, required this.lbl, required this.w_, required this.h_}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset(
                    height: 55,
                    "assets/images/Button_80x100_Left.png",
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                    },
                  ),
                ),
                SizedBox(
                  child: Image.asset(
                    height: 55,
                    "assets/images/Button_170x100_Center.png",
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                    },
                  ),
                ),
                SizedBox(
                  child: Image.asset(
                    height: 55,
                    "assets/images/Button_80x100_Right.png",
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                    },
                  ),
                ),
              ],
            ),
            Text(lbl,
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  color: Colors.white,
                  fontSize: font_size_18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                )),
          ],
        ));
  }
}

void please_waite(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevents dismissing by tapping outside
    builder: (BuildContext context) {
      // Schedule the dialog to be closed automatically after 5 seconds

      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/Loading.gif", // URL of the image
                height: 150,
                width: 150,
              ),
              SizedBox(height: 5),
              Text(
                'Please Wait...',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      );
    },
  );
}
