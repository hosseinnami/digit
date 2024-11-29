import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:digicapp/control/ftp/ftp_panel.dart';
import 'package:digicapp/control/help.dart';
import 'package:digicapp/control/insert.dart';
import 'package:digicapp/control/update.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:digicapp/page/card/page_my_card.dart';
import 'package:digicapp/widget/card_widget.dart';
import 'package:digicapp/widget/dialog.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_location_picker/map_location_picker.dart';

import '../../../control/ftp/ftp_dialog_image_and_camera.dart';
import '../../../control/val/val_pic.dart';
import '../../../widget/btn_nav.dart';
import '../../control/delete.dart';
import '../../control/select.dart';
import 'frm_card_preview.dart';

class edit_card extends StatefulWidget {
  final List val;
  const edit_card({Key? key, required this.val}) : super(key: key);

  @override
  State<edit_card> createState() => _new_cardState();
}

List<Widget> list_wiget_link = [];
List<Widget> list_add_wiget_link = [];
ValueNotifier<bool> controller1 = ValueNotifier<bool>(false);
ValueNotifier<bool> controller2 = ValueNotifier<bool>(false);
ValueNotifier<bool> controller3 = ValueNotifier<bool>(false);
ValueNotifier<bool> controller4 = ValueNotifier<bool>(false);
ValueNotifier<bool> controller5 = ValueNotifier<bool>(false);
List<bool> list_bool_val = [false, false, false, false, false];
List<int> list_bool_val_int = [0, 0, 0, 0];

class _new_cardState extends State<edit_card> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // if (list_image_send_ftp.isEmpty) {
    // }
    final assetImage = const AssetImage('assets/images/Black_3D_T.png');

    list_text_edite_val_card[7] = TextEditingController();
    // list_text_edite_val_card[7].text = list_card.first['card_address'].toString();
    // _controller.text = list_card.first['card_address'].toString();
    // try {
    //
    // } catch (e) {}
    list_text_stayl.add(t1);
    list_text_stayl.add(t2);
    list_text_stayl.add(t2);
    list_text_stayl.add(t2);
    list_text_stayl.add(t2);
    list_text_stayl.add(t2);
    list_text_stayl.add(t2);
    list_link_add_ofter = [];
    list_text_edite_val_card[0].text = list_card_select[0]['card_title'].toString();
    list_text_edite_val_card[4].text = list_card_select[0]['card_jab_title'].toString();
    list_text_edite_val_card[1].text = list_card_select[0]['card_fname'].toString();
    list_text_edite_val_card[2].text = list_card_select[0]['card_lname'].toString();
    list_text_edite_val_card[5].text = list_card_select[0]['card_mob_num'].toString();
    list_text_edite_val_card[6].text = list_card_select[0]['card_email'].toString();
    list_text_edite_val_card[9].text = list_card_select[0]['card_website'].toString();
    list_text_edite_val_card[8].text = list_card_select[0]['card_caption'].toString();
    list_text_edite_val_card[7].text = list_card_select[0]['card_address'].toString();
    list_text_edite_val_card[3].text = list_card_select[0]['card_co_name'].toString();
    code_card = list_card_select[0]['card_code'].toString();
    if (list_card_select[0]['ppm_card'].toString() == "1") {
      list_bool_val[0] = true;
    } else {
      list_bool_val[0] = false;
    }

    if (list_card_select[0]['hpi_card'].toString() == "1") {
      list_bool_val[1] = true;
    } else {
      list_bool_val[1] = false;
    }

    if (list_card_select[0]['hdl_card'].toString() == "1") {
      list_bool_val[2] = true;
    } else {
      list_bool_val[2] = false;
    }
    if (list_card_select[0]['def_card'].toString() == "1") {
      list_bool_val[3] = true;
    } else {
      list_bool_val[3] = false;
    }

    for (int i = 0; i < list_card_link_share.length; i++) {
      list_link_add_ofter.add(
        {
          'name_logo': list_card_link_share[i]['name_logo'].toString(),
          'type': list_card_link_share[i]['type_link_card'].toString(),
          'username': list_card_link_share[i]['usarname_link_card'].toString(),
          'link_username': list_card_link_share[i]['link_username'].toString(),
          'link': list_card_link_share[i]['link_card'].toString(),
        },
      );
    }


  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // دسترسی به ویجت‌های موروثی مانند Theme.of(context) در اینجا انجام شود
    add_list_link();
    refresh_list_link();
    // سایر کدهای مربوط به ویجت موروثی
  }

  void refresh_list_link() {
    list_wiget_link = [];
    List<Widget> val2 = [];
    for (int i = 0; i < list_link_add_type.length; i++) {
      val2 = [];
      list_wiget_link.add(
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(list_link_add_type[i]['type'] + ":",
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.displayLarge,
                color: Colors.grey.shade700,
                fontSize: font_size_16,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              )),
        ),
      );
      int counter = 1;
      for (int j = 0; j < list_link_add_type_sub.length; j++) {
        if (list_link_add_type_sub[j]['type'] == list_link_add_type[i]['type']) {
          val2.add(panel_row_Social(val: [
            string_line(list_link_add_type_sub[j]['name'], 10),
            link_logo_add_link(list_link_add_type_sub[j]['name']).replaceAll(" ", "_"),
            list_link_add_type_sub[j]['type'],
            list_link_add_type_sub[j]['name'],
            list_link_add_type_sub[j]['link_username'],

          ]));
          counter++;
        }
      }
      if (counter == 2) {
        list_wiget_link.add(SizedBox(
            height: counter * 50,
            child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                scrollDirection: Axis.vertical,
                primary: false,
                crossAxisCount: 4, // Number of columns in the grid
                children: val2)));
      } else if (counter < 15) {
        list_wiget_link.add(SizedBox(
            height: counter * 33,
            child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                scrollDirection: Axis.vertical,
                primary: false,
                crossAxisCount: 4, // Number of columns in the grid
                children: val2)));
      } else {
        list_wiget_link.add(SizedBox(
            height: counter * 25,
            child: GridView.count(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                scrollDirection: Axis.vertical,
                primary: false,
                crossAxisCount: 4, // Number of columns in the grid
                children: val2)));
      }
    }
  }

  void refresh_list_link_select(val) {
    list_wiget_link = [];
    List<Widget> val2 = [];
    list_wiget_link.add(
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(val + ":",
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.displayLarge,
              color: Colors.grey.shade700,
              fontSize: font_size_16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            )),
      ),
    );
    int counter = 0;
    for (int j = 0; j < list_link_add_type_sub.length; j++) {
      if (list_link_add_type_sub[j]['type'] == val) {
        val2.add(panel_row_Social(val: [
          string_line(list_link_add_type_sub[j]['name'], 10),
          link_logo_add_link(list_link_add_type_sub[j]['name']).replaceAll(" ", "_"),
          list_link_add_type_sub[j]['type'],
          list_link_add_type_sub[j]['name'],
          list_link_add_type_sub[j]['link_username'],
        ]));
        counter++;
      }
    }
    list_wiget_link.add(SizedBox(
        height: counter * 35,
        child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            scrollDirection: Axis.vertical,
            primary: false,
            crossAxisCount: 4, // Number of columns in the grid
            children: val2)));
  }

  void add_list_link() {
    list_add_wiget_link = [];
    List<Widget> val2 = [];
    for (int i = 0; i < list_link_add_ofter.length; i++) {
      val2 = [];
      list_add_wiget_link.add(
        GestureDetector(
          onTap: () {

            TextEditingController v1 = TextEditingController();
            TextEditingController v2 = TextEditingController();
            v1.text = list_link_add_ofter[i]['username'].toString();
            v2.text = list_link_add_ofter[i]['link'].toString();
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
              backgroundColor: const Color.fromRGBO(240, 240, 240, 1).withOpacity(0.85),
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: StatefulBuilder(
                    builder: (BuildContext context, setState2) {
                      return Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(list_link_add_ofter[i]['name_logo'],
                                        style: GoogleFonts.roboto(
                                          textStyle: Theme.of(context).textTheme.displayLarge,
                                          color: Colors.grey.shade700,
                                          fontSize: font_size_18,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal,
                                        ))),
                              ),
                              SizedBox(
                                  height: 431,
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                        color: Colors.black.withOpacity(0.03),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.network(
                                          link_logo_add_link(list_link_add_ofter[i]['name_logo']),
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Image.network("https://$address_ip/assets/assets/images/25.png",
                                                width: 70, height: 70, fit: BoxFit.fitWidth);
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Color.fromRGBO(32, 39, 47, 1),
                                                        width: 1.0, // عرض بوردر
                                                      ),
                                                    ),
                                                  ),
                                                  height: 60,
                                                  child: Center(
                                                      child: TextField(
                                                        controller: v1,
                                                        maxLength: 3000,
                                                        keyboardType: TextInputType.text,
                                                        style: GoogleFonts.roboto(
                                                          textStyle: Theme.of(context).textTheme.displayLarge,
                                                          color: Colors.black,
                                                          fontSize: font_size_16,
                                                          fontWeight: FontWeight.w400,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                        decoration: const InputDecoration(
                                                          hintText: "Paste Your URL / Link",
                                                          counterText: '',
                                                          isDense: true,
                                                          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                                                          hintStyle: TextStyle(
                                                            color: Color.fromRGBO(32, 39, 47, 0.6),
                                                          ),
                                                          labelStyle: TextStyle(color: Colors.black),
                                                          border: InputBorder.none,
                                                        ),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Text("OR",
                                                style: GoogleFonts.roboto(
                                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                                  color: Colors.black,
                                                  fontSize: font_size_14,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                )),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Color.fromRGBO(32, 39, 47, 1),
                                                        width: 1.0, // عرض بوردر
                                                      ),
                                                    ),
                                                  ),
                                                  height: 60,
                                                  child: Center(
                                                      child: TextField(
                                                        controller: v2,
                                                        maxLength: 3000,
                                                        keyboardType: TextInputType.text,
                                                        style: GoogleFonts.roboto(
                                                          textStyle: Theme.of(context).textTheme.displayLarge,
                                                          color: Colors.black,
                                                          fontSize: font_size_16,
                                                          fontWeight: FontWeight.w400,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                        decoration: const InputDecoration(
                                                          hintText: "Insert Your ID / Username",
                                                          counterText: '',
                                                          isDense: true,
                                                          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                                                          hintStyle: TextStyle(
                                                            color: Color.fromRGBO(32, 39, 47, 0.6),
                                                          ),
                                                          labelStyle: TextStyle(color: Colors.black),
                                                          border: InputBorder.none,
                                                        ),
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
                                      child: btn_digica_1(
                                          onPressed: () async {
                                            list_link_add_ofter[i]['username'] = v1.text;
                                            list_link_add_ofter[i]['link'] = v2.text;
                                            Navigator.pop(context);
                                          },
                                          lbl: "S a v e"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: btn_digica_1(
                                                  onPressed: () async {
                                                    if (list_link_add_ofter[i]['username'] != v1.text ||
                                                        list_link_add_ofter[i]['link'] != v2.text) {
                                                      dialog_2(
                                                          context,
                                                          DialogType.warning,
                                                              () {
                                                            // list_link_add_ofter[i]['username'] = list_edit_link[0].text;
                                                            // list_link_add_ofter[i]['link'] = list_edit_link[1].text;
                                                            Navigator.pop(context);
                                                          },
                                                          "Discard",
                                                          "Are you sure you want to discard the changes? All unsaved changes will be lost.",
                                                          false,
                                                          Colors.orange,
                                                          "Discard Changes",
                                                          Colors.grey,
                                                          "Cancel",
                                                              () {
                                                            // Navigator.pop(context);
                                                          });
                                                    } else {
                                                      Navigator.pop(context);
                                                    }
                                                  },
                                                  lbl: "Discard")),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              flex: 1,
                                              child: btn_digica_1(
                                                  onPressed: () async {
                                                    dialog_1(context, DialogType.error, () {
                                                      setState2(() {
                                                        list_link_add_ofter.removeAt(i);
                                                        refresh_list_link();
                                                      });
                                                      Navigator.pop(context);
                                                    }, "Remove", "Are you sure you want to remove this item? This action cannot be undone.", true,
                                                        Colors.red, "Remove");
                                                  },
                                                  lbl: "Remove"))
                                        ],
                                      ),
                                    ),
                                  ])),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ));
                    },
                  ),
                );
              },
            );


          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: 108,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.black.withOpacity(0.03),
                    border: Border.all(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Center(
                    child: Image.network(
                      link_logo_add_link(list_link_add_ofter[i]['name_logo']).replaceAll(" ", "_"),
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                      },
                    ),
                  ),
                ),
              ),
              Text(list_link_add_ofter[i]['name_logo'],
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context).textTheme.displayLarge,
                    color: Colors.grey.shade700,
                    fontSize: font_size_12,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ))
            ],
          ),
        ),
      );
    }
    list_add_wiget_link.add(
      GestureDetector(
        onTap: () {
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
          //  backgroundColor: Color.fromRGBO(240, 240, 240, 1),
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
            backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: StatefulBuilder(
                  builder: (BuildContext context, setState1) {
                    return Padding(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text("Select Link",
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context).textTheme.displayLarge,
                                        color: Colors.grey.shade700,
                                        fontSize: font_size_16,
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.normal,
                                      ))),
                            ),
                            Column(
                              children: [
                                card_sade(
                                  w_: with_screen,
                                  h_: 30,
                                  color_: Colors.white,
                                  crop_: 20,
                                  child_: Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.search,
                                                color: Colors.black,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 15.0),
                                                  child: TextField(
                                                    controller: TextEditingController(),
                                                    keyboardType: TextInputType.text,
                                                    style: GoogleFonts.roboto(
                                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                                      color: Colors.black,
                                                      fontSize: font_size_16,
                                                      fontWeight: FontWeight.w400,
                                                      fontStyle: FontStyle.normal,
                                                    ),
                                                    decoration: const InputDecoration(
                                                      hintText: "Search",
                                                      hintStyle: TextStyle(color: Colors.grey),
                                                      labelStyle: TextStyle(color: Colors.black),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ))),
                                ),
                                SizedBox(
                                  height: 100,
                                  width: with_screen,
                                  child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState1(() {
                                          list_text_stayl = [t1, t2, t2, t2, t2, t2, t2];
                                          refresh_list_link();
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("All", style: list_text_stayl[0]),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("||",
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context).textTheme.displayLarge,
                                              color: Colors.grey.shade700,
                                              fontSize: font_size_16,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.normal,
                                            ))),
                                    GestureDetector(
                                      onTap: () {
                                        setState1(() {
                                          list_text_stayl = [t2, t1, t2, t2, t2, t2, t2];
                                          refresh_list_link_select("Social Media");
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Social Media", style: list_text_stayl[1]),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState1(() {
                                          list_text_stayl = [t2, t2, t1, t2, t2, t2, t2];
                                          refresh_list_link_select("Business");
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Business", style: list_text_stayl[2]),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState1(() {
                                          list_text_stayl = [t2, t2, t2, t1, t2, t2, t2];
                                          refresh_list_link_select("Online Sales");
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Online Sales", style: list_text_stayl[3]),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState1(() {
                                          list_text_stayl = [t2, t2, t2, t2, t1, t2, t2];
                                          refresh_list_link_select("Real Estate");
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Real Estate", style: list_text_stayl[4]),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState1(() {
                                          list_text_stayl = [t2, t2, t2, t2, t2, t1, t2];
                                          refresh_list_link_select("Payments");
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Payments", style: list_text_stayl[5]),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState1(() {
                                          list_text_stayl = [t2, t2, t2, t2, t2, t2, t1];
                                          refresh_list_link_select("Others");
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Others", style: list_text_stayl[6]),
                                      ),
                                    ),
                                  ]),
                                ),
                                Column(crossAxisAlignment: CrossAxisAlignment.start, children: list_wiget_link)
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ));
                  },
                ),
              );
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                width: 108,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.black.withOpacity(0.03),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.black.withOpacity(0.3),
                    size: 65,
                  ),
                ),
              ),
            ),
            Text("Add New link",
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  color: Colors.grey.shade700,
                  fontSize: font_size_12,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    list_text_edite_val_card[7].dispose();

    // _currentTime?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      // Use the dialogPickerColor as start and active color.
      color: selectedColor_qr,
      // Update the dialogPickerColor using the callback.
      onColorChanged: (Color color) => setState(() => selectedColor_qr = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
    ).showPickerDialog(
      context,
      // New in version 3.0.0 custom transitions support.
      transitionBuilder: (BuildContext context, Animation<double> a1, Animation<double> a2, Widget widget) {
        final double curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      constraints: const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
    );
  }

  Future<bool> colorPickerDialog2() async {
    return ColorPicker(
      // Use the dialogPickerColor as start and active color.
      color: selectedColor_bkcard,

      // Update the dialogPickerColor using the callback.
      onColorChanged: (Color color) => setState(() => selectedColor_bkcard = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
    ).showPickerDialog(
      context,
      // New in version 3.0.0 custom transitions support.
      transitionBuilder: (BuildContext context, Animation<double> a1, Animation<double> a2, Widget widget) {
        final double curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      constraints: const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
    );
  }

  XFile? _image;

  Future<void> _selectPhotoFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  Future<void> _selectPhotoFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }
  TextStyle t1 = GoogleFonts.roboto(
    textStyle: const TextStyle(fontStyle: FontStyle.italic),
    color: Colors.black,
    fontSize: font_size_16,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  TextStyle t2 = GoogleFonts.roboto(
    textStyle: const TextStyle(fontStyle: FontStyle.italic),
    color: Colors.grey.shade700,
    fontSize: font_size_14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
  List<TextStyle> list_text_stayl = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      drawerScrimColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.network(
                  val_pic_png_network[15],
                  height: 90,
                  fit: BoxFit.fill,
                  width: with_screen,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Text("Edit Card",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: Colors.black,
                            fontSize: font_size_20,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          )),
                      GestureDetector(
                        onTap: () {
                          Get.to(card_preview(name_card: [
                            list_text_edite_val_card[0].text,
                            list_text_edite_val_card[4].text,
                            list_text_edite_val_card[1].text,
                            list_text_edite_val_card[2].text,
                            list_text_edite_val_card[5].text,
                            list_text_edite_val_card[6].text,
                            list_text_edite_val_card[9].text,
                            code_card,
                            "", //pic_profile
                            "", //pic_logo
                          ]));
                        },
                        child: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            // Visibility(
            //   visible: false,
            //   child: Container(
            //     height: 450,
            //     decoration: BoxDecoration(
            //       borderRadius: const BorderRadius.all(Radius.circular(0.0)),
            //       gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            //         selectedColor_bkcard,
            //         Colors.white,
            //       ]),
            //     ),
            //     child: Center(
            //       child: SizedBox(
            //         height: 270,
            //         child: StreamBuilder(
            //           //Error number 2
            //           stream: NumberCreator().stream,
            //           builder: (context, snapshot) {
            //             if (snapshot.connectionState == ConnectionState.waiting) {
            //               return const Center(child: CircularProgressIndicator());
            //             } else if (snapshot.connectionState == ConnectionState.done) {
            //               return const Text('done');
            //             } else if (snapshot.hasError) {
            //               return const Text('Error!');
            //             } else {
            //               if (list_image_send_ftp[1]['imageview'] == null) {
            //                 return btn_select_image(
            //                   patch_: "/user",
            //                   name_file: "${list_card_select[0]['card_code'].toString()}p",
            //                   label_dialog: 'Select picture',
            //                   Type_image: 1,
            //                   child_: ClipOval(
            //                     child: Image.network(
            //                       height: 270,
            //                       width: 270,
            //                       "assets/images/post_image1.jpeg",
            //                       fit: BoxFit.cover,
            //                     ),
            //                   ),
            //                 );
            //               } else {
            //                 return btn_select_image(
            //                     patch_: "/user",
            //                     name_file: "${list_card_select[0]['card_code'].toString()}p",
            //                     label_dialog: 'Select picture',
            //                     Type_image: 1,
            //                     child_: Container(
            //                       width: 270,
            //                       height: 270,
            //                       decoration: BoxDecoration(
            //                         borderRadius: const BorderRadius.all(Radius.circular(135.0)),
            //                         image: DecorationImage(
            //                           image: list_image_send_ftp[1]['imageview'],
            //                           fit: BoxFit.cover,
            //                         ),
            //                       ),
            //                     ));
            //               }
            //             }
            //           },
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      height: 450,
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                height: 450,
                                width: with_screen,
                                "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Digital_Card.png",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network("https://$address_ip/assets/assets/images/25.png",
                                      width: 70, height: 70, fit: BoxFit.fitWidth);
                                },
                              ),
                              Container(
                                height: 450,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                  gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                                    // const Color.fromRGBO(245, 245, 247, 1),
                                    // selectedColor_bkcard, Colors.transparent,

                                    Colors.transparent,
                                    Colors.transparent,
                                  ]),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Center(
                                child: SizedBox(

                                  height: 270,
                                  child: StreamBuilder(
                                      //Error number 2
                                      stream: NumberCreator().stream,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const Center(child: CircularProgressIndicator());
                                        } else if (snapshot.connectionState == ConnectionState.done) {
                                          return const Text('done');
                                        } else if (snapshot.hasError) {
                                          return const Text('Error!');
                                        } else {
                                          return btn_select_image(
                                              patch_: "/user",
                                              name_file: "${list_card_select[0]['card_code'].toString()}p",
                                              label_dialog: 'Select picture',
                                              Type_image: 1,
                                              child_: Stack(
                                                alignment: AlignmentDirectional.center,
                                                children: [
                                                  Image.network(
                                                    height: 240,
                                                    width: 240,
                                                    "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Frame.png",
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) {
                                                      return Image.network("https://$address_ip/assets/assets/images/25.png",
                                                          width: 70, height: 70, fit: BoxFit.fitWidth);
                                                    },
                                                  ),
                                                  Container(
                                                    width: 200,
                                                    height: 200,
                                                    decoration: BoxDecoration(
                                                      borderRadius: const BorderRadius.all(Radius.circular(135.0)),
                                                      image: DecorationImage(
                                                        image: list_image_send_ftp[1]['imageview'],
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ));
                                        }
                                      }),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 190.0, left: 135),
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Image.network(
                                      height: 75,
                                      width: 75,
                                      "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Frame.png",
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.network("https://$address_ip/assets/assets/images/25.png",
                                            width: 70, height: 70, fit: BoxFit.fitWidth);
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 1.0),
                                      child: SizedBox(
                                        height: 65,
                                        width: 65,
                                        child: StreamBuilder(
                                            //Error number 2
                                            stream: NumberCreator().stream,
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState == ConnectionState.waiting) {
                                                return const CircularProgressIndicator();
                                              } else if (snapshot.connectionState == ConnectionState.done) {
                                                return const Text('done');
                                              } else if (snapshot.hasError) {
                                                return const Text('Error!');
                                              } else {
                                                return btn_select_image(
                                                    patch_: "/user",
                                                    name_file: "${list_card_select[0]['card_code'].toString()}o",
                                                    label_dialog: 'Select picture',
                                                    Type_image: 0,
                                                    child_: Container(
                                                      width: 70,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                                                        image: DecorationImage(
                                                          image: list_image_send_ftp[0]['imageview'],
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ));
                                              }
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Image.network(
                                      height: 35,
                                      width: 150,
                                      "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Digicapp.png",
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.network("https://$address_ip/assets/assets/images/25.png",
                                            width: 70, height: 70, fit: BoxFit.fitWidth);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container()
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 260,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(),
                              //--------Profile_Background_Edit
                              // GestureDetector(
                              //   onTap: () async {
                              //     colorPickerDialog2();
                              //   },
                              //   child: Image.network(
                              //     height: 50,
                              //     width: 50,
                              //     "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Background_Edit.png",
                              //     fit: BoxFit.cover,
                              //     errorBuilder: (context, error, stackTrace) {
                              //       return Image.network("https://$address_ip/assets/assets/images/25.png",
                              //           width: 70, height: 70, fit: BoxFit.fitWidth);
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
                      color: const Color.fromRGBO(245, 245, 247, 1),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, -5),
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 3.0,
                        ),
                      ]),
                  height: 50,
                  width: with_screen,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Profile Private Mode",
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              color: Colors.black,
                              fontSize: font_size_16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20.0)), boxShadow: [
                              BoxShadow(
                                offset: const Offset(-1, 4),
                                color: Colors.grey.shade500,
                                blurRadius: 2.0,
                              ),
                            ]),
                            child: AdvancedSwitch(
                              onChanged: (val) {
                                if (val) {
                                  list_bool_val_int[0] = 1;
                                } else {
                                  list_bool_val_int[0] = 0;
                                }
                              },
                              initialValue: list_bool_val[0],
                              thumb: Image.network(
                                height: 40,
                                width: 40,
                                "https://$address_ip/digic_pic/user/share/DIGICA_icons/Buttons/Switch_Circle.png",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network("https://$address_ip/assets/assets/images/25.png",
                                      width: 70, height: 70, fit: BoxFit.fitWidth);
                                },
                              ),
                              controller: controller1,
                              activeColor: Colors.black,
                              inactiveColor: Colors.black,
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              width: 60.0,
                              height: 30.0,
                              enabled: true,
                              disabledOpacity: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              color: const Color.fromRGBO(187, 187, 201, 1),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hide Profile Image",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: Colors.black,
                            fontSize: font_size_16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20.0)), boxShadow: [
                            BoxShadow(
                              offset: const Offset(-1, 4),
                              color: Colors.grey.shade500,
                              blurRadius: 2.0,
                            ),
                          ]),
                          child: AdvancedSwitch(
                            onChanged: (val) {
                              if (val) {
                                list_bool_val_int[1] = 1;
                              } else {
                                list_bool_val_int[1] = 0;
                              }
                            },
                            initialValue: list_bool_val[1],
                            thumb: Image.network(
                              height: 40,
                              width: 40,
                              "https://$address_ip/digic_pic/user/share/DIGICA_icons/Buttons/Switch_Circle.png",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                              },
                            ),
                            controller: controller2,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            width: 60.0,
                            height: 30.0,
                            enabled: true,
                            disabledOpacity: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  color: const Color.fromRGBO(187, 187, 201, 1),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hide Digica Logo's",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: Colors.black,
                            fontSize: font_size_16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20.0)), boxShadow: [
                            BoxShadow(
                              offset: const Offset(-1, 4),
                              color: Colors.grey.shade500,
                              blurRadius: 2.0,
                            ),
                          ]),
                          child: AdvancedSwitch(
                            onChanged: (val) {
                              if (val) {
                                list_bool_val_int[2] = 1;
                              } else {
                                list_bool_val_int[2] = 0;
                              }
                            },
                            initialValue: list_bool_val[2],
                            thumb: Image.network(
                              height: 40,
                              width: 40,
                              "https://$address_ip/digic_pic/user/share/DIGICA_icons/Buttons/Switch_Circle.png",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                              },
                            ),
                            controller: controller3,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            width: 60.0,
                            height: 30.0,
                            enabled: true,
                            disabledOpacity: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  color: const Color.fromRGBO(187, 187, 201, 1),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Set as a Default Profile",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: Colors.black,
                            fontSize: font_size_16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20.0)), boxShadow: [
                            BoxShadow(
                              offset: const Offset(-1, 4),
                              color: Colors.grey.shade500,
                              blurRadius: 2.0,
                            ),
                          ]),
                          child: AdvancedSwitch(
                            onChanged: (val) {
                              if (val) {
                                list_bool_val_int[3] = 1;
                                print(list_bool_val_int[3]);
                              } else {
                                list_bool_val_int[3] = 0;
                                print(list_bool_val_int[3]);
                              }
                            },
                            initialValue: list_bool_val[3],
                            thumb: Image.network(
                              height: 40,
                              width: 40,
                              "https://$address_ip/digic_pic/user/share/DIGICA_icons/Buttons/Switch_Circle.png",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                              },
                            ),
                            controller: controller5,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black,
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            width: 60.0,
                            height: 30.0,
                            enabled: true,
                            disabledOpacity: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  color: const Color.fromRGBO(187, 187, 201, 1),
                ),
              ],
            ),
            Visibility(
              visible: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Hide Background Color's",
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              color: Colors.black,
                              fontSize: font_size_16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20.0)), boxShadow: [
                              BoxShadow(
                                offset: const Offset(-1, 4),
                                color: Colors.grey.shade500,
                                blurRadius: 2.0,
                              ),
                            ]),
                            child: AdvancedSwitch(
                              initialValue: list_bool_val[3],
                              onChanged: (val) {
                                if (val) {
                                  print("ttt");
                                  setState(() {
                                    selectedColor_bkcard = const Color(0x00000000);
                                  });
                                } else {
                                  setState(() {
                                    selectedColor_bkcard = const Color(0xff0d0898);
                                  });
                                }
                              },
                              thumb: Image.network(
                                height: 40,
                                width: 40,
                                "https://$address_ip/digic_pic/user/share/DIGICA_icons/Buttons/Switch_Circle.png",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network("https://$address_ip/assets/assets/images/25.png",
                                      width: 70, height: 70, fit: BoxFit.fitWidth);
                                },
                              ),
                              controller: controller4,
                              activeColor: Colors.black,
                              inactiveColor: Colors.black,
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              width: 60.0,
                              height: 30.0,
                              enabled: true,
                              disabledOpacity: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 1,
                    color: const Color.fromRGBO(187, 187, 201, 1),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Profile Name",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_card[0],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Name",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_card[1],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "First",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_card[2],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Last",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Job Title",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_card[4],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Company",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_card[3],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Phone",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_card[5],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Email",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_card[6],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 19, right: 5),
                    child: Text("Web Site",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 60,
                    child: Center(
                        child: TextField(
                      controller: list_text_edite_val_card[9],
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_16,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Type Here",
                        counterText: '',
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.black),
                        border: InputBorder.none,
                      ),
                    )),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10, right: 5),
                    child: Text("Bio",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(187, 187, 201, 1),
                          width: 1.0, // عرض بوردر
                        ),
                      ),
                    ),
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 10),
                      child: TextField(
                        controller: list_text_edite_val_card[8],
                        maxLength: 1000,
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Type Here",
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                          hintStyle: TextStyle(color: Colors.grey),
                          labelStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 10, right: 5),
                    child: Text("Address",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                Expanded(
                  child: PlacesAutocomplete(
                    top: false,
                    bottom: false,
                    topCardColor: const Color.fromRGBO(245, 245, 247, 1),
                    searchController: list_text_edite_val_card[7],
                    apiKey: 'AIzaSyAFSAQJIdM1VwsSxXZ4VQE95kOpk5ZSU2A',
                    mounted: mounted,
                    hideBackButton: true,
                    onGetDetailsByPlaceId: (PlacesDetailsResponse? result) {
                      if (result != null) {
                        setState(() {
                          val_new_card[0] = result.result.geometry?.location.lat.toString();
                          val_new_card[1] = result.result.geometry?.location.lng.toString();
                          val_new_card[2] = result.result.formattedAddress;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              color: const Color.fromRGBO(187, 187, 201, 1),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 285,
              width: with_screen - 20,
              child: StreamBuilder(
                //Error number 2
                stream: NumberCreator().stream,
                builder: (context, snapshot) {
                  add_list_link();
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text(
                      " Refresh List . . . ",
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return const Text('done');
                  } else if (snapshot.hasError) {
                    return const Text('Error!');
                  } else {
                    return GridView.count(
                        primary: false,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 3, // Number of columns in the grid
                        children: list_add_wiget_link);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
              child: btn_digica_1(
                  onPressed: () async {
                    Get.to(card_preview(name_card: [
                      list_text_edite_val_card[0].text,
                      list_text_edite_val_card[4].text,
                      list_text_edite_val_card[1].text,
                      list_text_edite_val_card[2].text,
                      list_text_edite_val_card[5].text,
                      list_text_edite_val_card[6].text,
                      list_text_edite_val_card[9].text,
                      code_card,
                      "", //pic_profile
                      "", //pic_logo
                    ]));
                  },
                  lbl: "P r e v i e w"),
            ),
            // GestureDetector(
            //   onTap: () {
            //     showModalBottomSheet(
            //       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
            //       backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
            //       context: context,
            //       isScrollControlled: true,
            //       builder: (BuildContext context) {
            //         return SingleChildScrollView(
            //           child: StatefulBuilder(
            //             builder: (BuildContext context, setState1) {
            //               return Padding(
            //                   padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            //                   child: Column(
            //                     mainAxisSize: MainAxisSize.min,
            //                     mainAxisAlignment: MainAxisAlignment.end,
            //                     children: <Widget>[
            //                       Padding(
            //                         padding: const EdgeInsets.all(18.0),
            //                         child: Align(
            //                             alignment: Alignment.center,
            //                             child: Text("Select Link",
            //                                 style: GoogleFonts.roboto(
            //                                   textStyle: Theme.of(context).textTheme.displayLarge,
            //                                   color: Colors.grey.shade700,
            //                                   fontSize: font_size_16,
            //                                   fontWeight: FontWeight.w700,
            //                                   fontStyle: FontStyle.normal,
            //                                 ))),
            //                       ),
            //                       Column(
            //                         children: [
            //                           card_sade(
            //                             w_: with_screen,
            //                             h_: 30,
            //                             color_: Colors.white,
            //                             crop_: 20,
            //                             child_: Padding(
            //                                 padding: const EdgeInsets.only(left: 10.0),
            //                                 child: Align(
            //                                     alignment: Alignment.centerLeft,
            //                                     child: Row(
            //                                       children: [
            //                                         const Icon(
            //                                           Icons.search,
            //                                           color: Colors.black,
            //                                         ),
            //                                         Expanded(
            //                                           child: Padding(
            //                                             padding: const EdgeInsets.only(left: 15.0),
            //                                             child: TextField(
            //                                               controller: TextEditingController(),
            //                                               keyboardType: TextInputType.text,
            //                                               style: GoogleFonts.roboto(
            //                                                 textStyle: Theme.of(context).textTheme.displayLarge,
            //                                                 color: Colors.black,
            //                                                 fontSize: font_size_16,
            //                                                 fontWeight: FontWeight.w400,
            //                                                 fontStyle: FontStyle.normal,
            //                                               ),
            //                                               decoration: const InputDecoration(
            //                                                 hintText: "Search",
            //                                                 hintStyle: TextStyle(color: Colors.grey),
            //                                                 labelStyle: TextStyle(color: Colors.black),
            //                                                 border: InputBorder.none,
            //                                               ),
            //                                             ),
            //                                           ),
            //                                         ),
            //                                       ],
            //                                     ))),
            //                           ),
            //                           SizedBox(
            //                             height: 100,
            //                             width: with_screen,
            //                             child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
            //                               GestureDetector(
            //                                 onTap: () {
            //                                   setState1(() {
            //                                     list_text_stayl = [t1, t2, t2, t2, t2, t2, t2];
            //                                     refresh_list_link();
            //                                   });
            //                                 },
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Text("All", style: list_text_stayl[0]),
            //                                 ),
            //                               ),
            //                               Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Text("||",
            //                                       style: GoogleFonts.roboto(
            //                                         textStyle: Theme.of(context).textTheme.displayLarge,
            //                                         color: Colors.grey.shade700,
            //                                         fontSize: font_size_16,
            //                                         fontWeight: FontWeight.w700,
            //                                         fontStyle: FontStyle.normal,
            //                                       ))),
            //                               GestureDetector(
            //                                 onTap: () {
            //                                   setState1(() {
            //                                     list_text_stayl = [t2, t1, t2, t2, t2, t2, t2];
            //                                     refresh_list_link_select("Social Media");
            //                                   });
            //                                 },
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Text("Social Media", style: list_text_stayl[1]),
            //                                 ),
            //                               ),
            //                               GestureDetector(
            //                                 onTap: () {
            //                                   setState1(() {
            //                                     list_text_stayl = [t2, t2, t1, t2, t2, t2, t2];
            //                                     refresh_list_link_select("Business");
            //                                   });
            //                                 },
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Text("Business", style: list_text_stayl[2]),
            //                                 ),
            //                               ),
            //                               GestureDetector(
            //                                 onTap: () {
            //                                   setState1(() {
            //                                     list_text_stayl = [t2, t2, t2, t1, t2, t2, t2];
            //                                     refresh_list_link_select("Online Sales");
            //                                   });
            //                                 },
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Text("Online Sales", style: list_text_stayl[3]),
            //                                 ),
            //                               ),
            //                               GestureDetector(
            //                                 onTap: () {
            //                                   setState1(() {
            //                                     list_text_stayl = [t2, t2, t2, t2, t1, t2, t2];
            //                                     refresh_list_link_select("Real Estate");
            //                                   });
            //                                 },
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Text("Real Estate", style: list_text_stayl[4]),
            //                                 ),
            //                               ),
            //                               GestureDetector(
            //                                 onTap: () {
            //                                   setState1(() {
            //                                     list_text_stayl = [t2, t2, t2, t2, t2, t1, t2];
            //                                     refresh_list_link_select("Payments");
            //                                   });
            //                                 },
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Text("Payments", style: list_text_stayl[5]),
            //                                 ),
            //                               ),
            //                               GestureDetector(
            //                                 onTap: () {
            //                                   setState1(() {
            //                                     list_text_stayl = [t2, t2, t2, t2, t2, t2, t1];
            //                                     refresh_list_link_select("Others");
            //                                   });
            //                                 },
            //                                 child: Padding(
            //                                   padding: const EdgeInsets.all(8.0),
            //                                   child: Text("Others", style: list_text_stayl[6]),
            //                                 ),
            //                               ),
            //                             ]),
            //                           ),
            //                           Column(crossAxisAlignment: CrossAxisAlignment.start, children: list_wiget_link)
            //                         ],
            //                       ),
            //                       const SizedBox(
            //                         height: 20,
            //                       ),
            //                     ],
            //                   ));
            //             },
            //           ),
            //         );
            //       },
            //     );
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: GestureDetector(
            //       onTap: () async {},
            //       child: card_sade(
            //         w_: with_screen - 40,
            //         h_: 50,
            //         color_: Colors.grey.shade300,
            //         crop_: 15,
            //         child_: Center(
            //           child: Text("Priview",
            //               style: GoogleFonts.roboto(
            //                 textStyle: Theme.of(context).textTheme.displayLarge,
            //                 color: Colors.black,
            //                 fontSize: font_size_16,
            //                 fontWeight: FontWeight.w400,
            //                 fontStyle: FontStyle.normal,
            //               )),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: btn_digica_1(
                          onPressed: () async {
                            Navigator.pop(context);
                            // Navigator.of(context).pop();
                          },
                          lbl: "Discard")),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: btn_digica_1(
                          onPressed: () async {
                            please_waite(context);
                            if (list_bool_val_int[3] == 1) {
                              await update_tbl_card_def_user();
                            } else {
                              list_bool_val_int[3] = 0;
                            }

                            if (list_text_edite_val_card[0].text != list_card_select[0]['card_title'].toString()) {
                              await select_tbl_card_user_id_titr_edit(list_text_edite_val_card[0].text);
                              if (list_card_select_edit.isEmpty) {
                                await updateCard(
                                    list_card_select[0]['id_card'].toString(),
                                    list_text_edite_val_card[0].text,
                                    list_text_edite_val_card[1].text,
                                    list_text_edite_val_card[2].text,
                                    list_text_edite_val_card[3].text,
                                    list_text_edite_val_card[4].text,
                                    list_text_edite_val_card[5].text,
                                    list_text_edite_val_card[6].text,
                                    val_new_card[0],
                                    val_new_card[1],
                                    list_text_edite_val_card[7].text,
                                    list_text_edite_val_card[8].text,
                                    0,
                                    0,
                                    "https://$address_ip/digic_pic/user/user/${code_card}o.jpg",
                                    "https://$address_ip/digic_pic/user/user/${code_card}p.jpg",
                                    "0",
                                    "0",
                                    list_bool_val_int[3],
                                    list_text_edite_val_card[9].text,
                                    list_bool_val_int[0],
                                    list_bool_val_int[1],
                                    list_bool_val_int[2]);
                              } else {
                                dialog_1(context, DialogType.error, () {
                                  Navigator.pop(context);
                                }, "Error", "You already used this title for the card.", true, Colors.red, "Back To Add New Card");

                              }
                            } else {
                              await updateCard(
                                  list_card_select[0]['id_card'].toString(),
                                  list_text_edite_val_card[0].text,
                                  list_text_edite_val_card[1].text,
                                  list_text_edite_val_card[2].text,
                                  list_text_edite_val_card[3].text,
                                  list_text_edite_val_card[4].text,
                                  list_text_edite_val_card[5].text,
                                  list_text_edite_val_card[6].text,
                                  val_new_card[0],
                                  val_new_card[1],
                                  list_text_edite_val_card[7].text,
                                  list_text_edite_val_card[8].text,
                                  0,
                                  0,
                                  "https://$address_ip/digic_pic/user/user/${code_card}o.jpg",
                                  "https://$address_ip/digic_pic/user/user/${code_card}p.jpg",
                                  "0",
                                  "0",
                                  list_bool_val_int[3],
                                  list_text_edite_val_card[9].text,
                                  list_bool_val_int[0],
                                  list_bool_val_int[1],
                                  list_bool_val_int[2]);
                            }

                            await delete_link_card(list_card_select[0]['card_code'].toString());
                            for (int i = 0; i < list_link_add_ofter.length; i++) {
                              try {
                                await insert_link_card(
                                    user_id,
                                    list_card_select[0]['card_code'].toString(),
                                    list_link_add_ofter[i]['name_logo'].toString(),
                                    list_link_add_ofter[i]['type'].toString(),
                                    list_link_add_ofter[i]['username'].toString(),
                                    list_link_add_ofter[i]['link'].toString(),
                                    list_link_add_ofter[i]['link_username'].toString(),
                                    i + 1);
                              } on Exception catch (e) {
                                // TODO
                              }
                            }

                            list_text_edite_val_card = [
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                              TextEditingController(),
                            ];

                            val_new_card = [
                              "",
                              "",
                              "",
                              "",
                              "",
                              "",
                            ];
                            try {
                              for (int i = 0; i < list_image_send_ftp.length; i++) {
                                if (list_image_send_ftp[i]['Type'] != "0") {
                                  await ftp.connect();
                                  final newFileName = "${list_image_send_ftp[i]['newFileName']}";
                                  print(newFileName); // Provide the new file name here
                                  final file = list_image_send_ftp[i]['file'];
                                  final renamedFile = await file.rename("${file.parent.path}/$newFileName");
                                  await ftp.uploadFile(
                                    renamedFile,
                                    sRemoteName: list_image_send_ftp[i]['sRemoteName'],
                                  );
                                  await ftp.disconnect();
                                  print("Upload successful");
                                }
                              }
                            } on Exception catch (e) {
                              // TODO
                            }
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // title: Text('Save Card'),
                                  content: const Text('All your changes has been saved.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.off(const my_card());
                                      },
                                      child: const Text('OK'),
                                    ),
                                    //
                                  ],
                                );
                              },
                            );
                          },
                          lbl: "Update"))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class panel_row_Social extends StatefulWidget {
  final List val;
  const panel_row_Social({Key? key, required this.val}) : super(key: key);

  @override
  State<panel_row_Social> createState() => _panel_row_SocialState();
}

class _panel_row_SocialState extends State<panel_row_Social> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TextEditingController v1 = TextEditingController();
        TextEditingController v2 = TextEditingController();

        showModalBottomSheet(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
          backgroundColor: const Color.fromRGBO(240, 240, 240, 1).withOpacity(0.85),
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: StatefulBuilder(
                builder: (BuildContext context, setState2) {
                  return Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(widget.val[0],
                                    style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      color: Colors.grey.shade700,
                                      fontSize: font_size_18,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                    ))),
                          ),
                          SizedBox(
                              height: 400,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                    color: Colors.black.withOpacity(0.03),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.network(
                                      widget.val[1],
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.network("https://$address_ip/assets/assets/images/25.png",
                                            width: 70, height: 70, fit: BoxFit.fitWidth);
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Color.fromRGBO(32, 39, 47, 1),
                                                    width: 1.0, // عرض بوردر
                                                  ),
                                                ),
                                              ),
                                              height: 60,
                                              child: Center(
                                                  child: TextField(
                                                controller: v1,
                                                maxLength: 1000,
                                                keyboardType: TextInputType.text,
                                                style: GoogleFonts.roboto(
                                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                                  color: Colors.black,
                                                  fontSize: font_size_16,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                decoration: const InputDecoration(
                                                  hintText: "Paste Your URL / Link",
                                                  counterText: '',
                                                  isDense: true,
                                                  contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                                                  hintStyle: TextStyle(
                                                    color: Color.fromRGBO(32, 39, 47, 0.6),
                                                  ),
                                                  labelStyle: TextStyle(color: Colors.black),
                                                  border: InputBorder.none,
                                                ),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text("OR",
                                            style: GoogleFonts.roboto(
                                              textStyle: Theme.of(context).textTheme.displayLarge,
                                              color: Colors.black,
                                              fontSize: font_size_14,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            )),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Color.fromRGBO(32, 39, 47, 1),
                                                    width: 1.0, // عرض بوردر
                                                  ),
                                                ),
                                              ),
                                              height: 60,
                                              child: Center(
                                                  child: TextField(
                                                controller: v2,
                                                maxLength: 1000,
                                                keyboardType: TextInputType.text,
                                                style: GoogleFonts.roboto(
                                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                                  color: Colors.black,
                                                  fontSize: font_size_16,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                ),
                                                decoration: const InputDecoration(
                                                  hintText: "Insert Your ID / Username",
                                                  counterText: '',
                                                  isDense: true,
                                                  contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                                                  hintStyle: TextStyle(
                                                    color: Color.fromRGBO(32, 39, 47, 0.6),
                                                  ),
                                                  labelStyle: TextStyle(color: Colors.black),
                                                  border: InputBorder.none,
                                                ),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
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
                                                Navigator.pop(context);
                                              },
                                              lbl: "Discard")),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: btn_digica_1(
                                              onPressed: () async {
                                                setState2(() {
                                                  list_link_add_ofter.add(
                                                    {
                                                      'name_logo': widget.val[3],
                                                      'type': widget.val[2],
                                                      'username': v1.text,
                                                      'link_username': widget.val[4],
                                                      'link': v2.text,
                                                    },
                                                  );
                                                });
                                                print(list_link_add_ofter);
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              lbl: "Save"))
                                    ],
                                  ),
                                ),
                              ])),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ));
                },
              ),
            );
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              color: Colors.black.withOpacity(0.03),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
                style: BorderStyle.solid,
              ),
            ),
            child: Center(
              child: Image.network(
                widget.val[1],
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                },
              ),
            ),
          ),
          Text(widget.val[0],
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.displayLarge,
                color: Colors.grey.shade700,
                fontSize: font_size_12,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ))
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> list_link_add_ofter = [];
