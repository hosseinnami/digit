import 'package:digicapp/control/select.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/page/card/page_my_card.dart';
import 'package:digicapp/page/card/widghet_creat_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../control/insert.dart';
import '../control/val/val_list.dart';

class reset_page extends StatefulWidget {
  const reset_page({Key? key}) : super(key: key);

  @override
  State<reset_page> createState() => _reset_pageState();
}

class _reset_pageState extends State<reset_page> {
  @override
  void initState() {
    super.initState();
    btn();
  }

  Future<void> btn() async {
    setState(() {
      clr_text = [Color.fromRGBO(255, 199, 9, 1), Colors.white, Colors.white, Colors.white, Colors.white];
    });

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
    await Get.off(const my_card());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Container(
        height: hight_screen,
        width: with_screen,
        color: Colors.transparent,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset(
                  "assets/images/Loading.gif", // URL of the image
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 5),
                Text(
                  'Please Wait For Remove Card And Profile . . .',
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    color: Colors.black,
                    fontSize: font_size_14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
