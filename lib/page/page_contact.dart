import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:digicapp/control/delete.dart';
import 'package:digicapp/control/select.dart';
import 'package:digicapp/control/update.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:digicapp/control/val/val_pic.dart';
import 'package:digicapp/page/new/frm_new_contact.dart';
import 'package:digicapp/widget/btn_nav.dart';
import 'package:digicapp/widget/card_widget.dart';
import 'package:digicapp/widget/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:share_plus/share_plus.dart';

import '../control/help.dart';

class frm_contact extends StatefulWidget {
  const frm_contact({Key? key}) : super(key: key);

  @override
  State<frm_contact> createState() => _frm_contactState();
}

String com_select_val = "";
String com_select_val_2 = "";
String? selectedItem = "";
String? selectedItem_2 = "";
List<String> list_combo = [
  'null',
  'null',
  'null',
  'null',
  'null',
  'null',
];
List<String> list_combo_transfer = [];

class _frm_contactState extends State<frm_contact> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list_combo_transfer = [];
    selectedItem_2 = list_combo.first;
    page_navig = 3;
    for (int i = 0; i < list_contact_card.length; i++) {
      isChecked1.add(false);
    }
    filterContacts("");
  }

  List<Map<String, dynamic>> filteredContacts = [];
  TextEditingController searchController = TextEditingController();
  List<bool> isChecked1 = [];
  void filterContacts(String query) {
    setState(() {
      filteredContacts = list_contact_card.where((contact) {
        final nameLower = contact['name_contact'].toLowerCase();
        final familyLower = contact['family_contact'].toLowerCase();
        final emailLower = contact['email_contact'].toLowerCase();
        final searchLower = query.toLowerCase();

        return nameLower.contains(searchLower) || familyLower.contains(searchLower) || emailLower.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawerScrimColor: Colors.white,
      bottomNavigationBar: const navig(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      height: 450,
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Image.network(
                            height: 450,
                            width: with_screen,
                            "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Digital_Card.png",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              // Visibility(
                              //   visible: false,
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(top: 135.0),
                              //     child: Container(
                              //       height: 150,
                              //       width: 60,
                              //       decoration: BoxDecoration(
                              //         border: Border.all(),
                              //         borderRadius: BorderRadius.only(
                              //           bottomRight: Radius.circular(30.0),
                              //           topRight: Radius.circular(30.0),
                              //         ),
                              //         color: Colors.grey.shade200,
                              //       ),
                              //       child: Column(
                              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //         children: [
                              //           GestureDetector(
                              //             onTap: () {
                              //               code_card = create_new_code();
                              //               Get.to(new_contact());
                              //             },
                              //             child: Icon(
                              //               Icons.add,
                              //               color: Colors.black,
                              //               size: 35,
                              //             ),
                              //           ),
                              //           Padding(
                              //             padding: const EdgeInsets.only(left: 8.0, right: 8),
                              //             child: Container(
                              //               height: 1,
                              //               color: Colors.grey,
                              //             ),
                              //           ),
                              //           Icon(
                              //             Icons.contacts_outlined,
                              //             color: Colors.black,
                              //             size: 35,
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 350,
                                child: StreamBuilder(
                                  stream: NumberCreator2().stream,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                    } else if (snapshot.connectionState == ConnectionState.done) {
                                      return const Text('done');
                                    } else if (snapshot.hasError) {
                                      return const Text('Error!');
                                    } else if (snapshot.connectionState == ConnectionState.active && list_card_select.isNotEmpty) {
                                      // مقداردهی URLها با بررسی وجود داده در لیست
                                      String profileUrl = list_card_select.isNotEmpty
                                          ? list_card_select[0]['card_url_pic_profile'].toString()
                                          : "https://$address_ip/assets/assets/images/default_profile.png";
                                      String logoUrl = list_card_select.isNotEmpty
                                          ? list_card_select[0]['card_url_pic_logo'].toString()
                                          : "https://$address_ip/assets/assets/images/default_logo.png";

                                      return Padding(
                                        padding: const EdgeInsets.only(top: 135.0),
                                        child: Stack(
                                          alignment: AlignmentDirectional.topCenter,
                                          children: [
                                            Stack(
                                              alignment: AlignmentDirectional.center,
                                              children: [
                                                Image.network(
                                                  height: 200,
                                                  width: 200,
                                                  "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Frame.png",
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error, stackTrace) {
                                                    return Image.network("https://$address_ip/assets/assets/images/25.png",
                                                        width: 70, height: 70, fit: BoxFit.fitWidth);
                                                  },
                                                ),
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(85.0),
                                                  child: Image.network(
                                                    height: 165,
                                                    width: 165,
                                                    profileUrl,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) {
                                                      return Image.network(
                                                          "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Add_Profile.png",
                                                          width: 180,
                                                          height: 180,
                                                          fit: BoxFit.fitWidth);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Stack(
                                              alignment: AlignmentDirectional.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 130.0, left: 130),
                                                  child: Image.network(
                                                    height: 75,
                                                    width: 75,
                                                    "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Frame.png",
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) {
                                                      return Image.network("https://$address_ip/assets/assets/images/25.png",
                                                          width: 70, height: 70, fit: BoxFit.fitWidth);
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 130.0, left: 130),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(35.0),
                                                    child: Image.network(
                                                      height: 60,
                                                      width: 60,
                                                      logoUrl,
                                                      fit: BoxFit.cover,
                                                      errorBuilder: (context, error, stackTrace) {
                                                        return Image.network("https://$address_ip/assets/assets/images/25.png",
                                                            width: 70, height: 70, fit: BoxFit.fitWidth);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return const Text('No data available');
                                    }
                                  },
                                ),

                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 135.0),
                                child: Container(
                                  height: 150,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    // border: Border.all(),

                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15.0),
                                      topLeft: Radius.circular(15.0),
                                    ),
                                    color: Colors.grey.shade200.withOpacity(0.65),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          list_text_edite_val_contact = [
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
                                          val_new_contact = [
                                            "",
                                            "",
                                            "",
                                            "",
                                            "",
                                            "",
                                          ];
                                          refresh_pic();
                                          code_card = create_new_code();

                                          if (com_select_val != "Draft") {
                                            Get.to(new_contact(
                                              type_page: [1, 0, list_card_select[0]['id_card'].toString()],
                                            ));
                                          } else {
                                            Get.to(new_contact(
                                              type_page: [1, 0, 0],
                                            ));
                                          }
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              height: 40,
                                              width: 40,
                                              "assets/images/icons8-add-50-2.png",
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Image.network("https://$address_ip/assets/assets/images/25.png",
                                                    width: 70, height: 70, fit: BoxFit.fitWidth);
                                              },
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Center(
                                              child: Text("Add",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                                    color: Colors.black,
                                                    fontSize: font_size_10,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                                        child: Container(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Get.to(qr_code(
                                          //   val_qr: "https://$address_ip/registration/accessories/${list_card_select[0]['card_url_qr'].toString()}",
                                          //   type_frm_qr: 2,
                                          // ));
                                          showModalBottomSheet(
                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
                                            backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (BuildContext context) {
                                              return SingleChildScrollView(
                                                child: StatefulBuilder(
                                                  builder: (context, setState1) {
                                                    return Padding(
                                                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                                        child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            children: <Widget>[
                                                              SizedBox(
                                                                height: 400,
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
                                                                      return ListView.builder(
                                                                          itemCount: list_contact_card.length,
                                                                          itemBuilder: (context, int index) {
                                                                            return card_sade(
                                                                              w_: with_screen - 10,
                                                                              h_: 60,
                                                                              color_: Colors.white,
                                                                              crop_: 12,
                                                                              child_: CheckboxListTile(
                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                value: isChecked1[index],
                                                                                activeColor: Colors.black,
                                                                                title: Row(
                                                                                  children: [
                                                                                    ClipOval(
                                                                                      child: Image.network(
                                                                                        height: 55,
                                                                                        width: 55,
                                                                                        list_contact_card[index]['pic_url_ferend'].toString(),
                                                                                        fit: BoxFit.cover,
                                                                                        errorBuilder: (context, error, stackTrace) {
                                                                                          return Image.network(
                                                                                              "https://$address_ip/assets/assets/images/25.png",
                                                                                              width: 55,
                                                                                              height: 55,
                                                                                              fit: BoxFit.fitWidth);
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    const SizedBox(
                                                                                      width: 10,
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                            "${list_contact_card[index]['name_contact']} ${list_contact_card[index]['family_contact']}",
                                                                                            style: GoogleFonts.bonaNova(
                                                                                              textStyle: Theme.of(context).textTheme.displayLarge,
                                                                                              color: Colors.black,
                                                                                              fontSize: font_size_18,
                                                                                              fontWeight: FontWeight.w400,
                                                                                              fontStyle: FontStyle.normal,
                                                                                            )),
                                                                                        const SizedBox(
                                                                                          height: 2,
                                                                                        ),
                                                                                        Text(list_contact_card[index]['email_contact'].toString(),
                                                                                            style: GoogleFonts.bonaNova(
                                                                                              textStyle: Theme.of(context).textTheme.displayLarge,
                                                                                              color: Colors.grey.shade600,
                                                                                              fontSize: font_size_14,
                                                                                              fontWeight: FontWeight.w400,
                                                                                              fontStyle: FontStyle.normal,
                                                                                            )),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                onChanged: (bool? value) {
                                                                                  setState(() {
                                                                                    isChecked1[index] = value ?? false;
                                                                                  });

                                                                                  if (isChecked1[index]) {
                                                                                    list_combo_transfer
                                                                                        .add(list_contact_card[index]['id_contact'].toString());
                                                                                  } else {
                                                                                    list_combo_transfer
                                                                                        .remove(list_contact_card[index]['id_contact'].toString());
                                                                                  }
                                                                                  print(list_combo_transfer);
                                                                                },
                                                                              ),
                                                                            );
                                                                          });
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.all(15.0),
                                                                child: Container(
                                                                  height: 1,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 10.0, right: 10),
                                                                child: Row(
                                                                  children: [
                                                                    Center(
                                                                      child: Text("To : ",
                                                                          style: GoogleFonts.roboto(
                                                                            textStyle: Theme.of(context).textTheme.displayLarge,
                                                                            color: Colors.black,
                                                                            fontSize: font_size_18,
                                                                            fontWeight: FontWeight.w300,
                                                                            fontStyle: FontStyle.normal,
                                                                          )),
                                                                    ),
                                                                    Expanded(
                                                                      child: CustomDropdown<String>.search(
                                                                        hintText: 'Select cuisines',
                                                                        items: list_combo,
                                                                        initialItem: selectedItem_2,
                                                                        overlayHeight: 342,
                                                                        onChanged: (value) async {
                                                                          setState(() {
                                                                            selectedItem_2 = value;
                                                                          });
                                                                          print(selectedItem_2);
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
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
                                                                            lbl: "Cancel")),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: btn_digica_1(
                                                                            onPressed: () async {
                                                                              // please_waite(context);
                                                                              if (selectedItem_2 != "Draft") {
                                                                                await select_tbl_card_user_id_titr(selectedItem_2);
                                                                                for (int i = 0; i < list_combo_transfer.length; i++) {
                                                                                  await update_tbl_contact_transfer(list_combo_transfer[i],
                                                                                      list_card_select[0]['id_card'].toString());
                                                                                }
                                                                              } else {
                                                                                for (int i = 0; i < list_combo_transfer.length; i++) {
                                                                                  await update_tbl_contact_transfer(list_combo_transfer[i], "0");
                                                                                }
                                                                              }
                                                                              list_combo_transfer = [];
                                                                              selectedItem = list_combo.first;
                                                                              await select_tbl_card_user_id_titr(selectedItem);
                                                                              await select_tbl_contact_card(
                                                                                  list_card_select[0]['id_card'].toString());

                                                                              setState1(() {
                                                                                int a = 0;
                                                                              });
                                                                              Navigator.of(context).pop();
                                                                              //  Navigator.of(context).pop();
                                                                            },
                                                                            lbl: "Apply"))
                                                                  ],
                                                                ),
                                                              ),
                                                            ]));
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              height: 45,
                                              width: 45,
                                              "assets/images/icons8-transfer-64.png",
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) {
                                                return Image.network("https://$address_ip/assets/assets/images/25.png",
                                                    width: 70, height: 70, fit: BoxFit.fitWidth);
                                              },
                                            ),
                                            Center(
                                              child: Text("Transfer",
                                                  style: GoogleFonts.roboto(
                                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                                    color: Colors.black,
                                                    fontSize: font_size_10,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle: FontStyle.normal,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  width: with_screen / 2.5,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(-5, 5),
                                        blurRadius: 6.0,
                                      ),
                                    ],
                                  ),
                                  child: CustomDropdown<String>.search(
                                    hintText: 'Select cuisines',
                                    items: list_combo,
                                    initialItem: selectedItem,
                                    overlayHeight: 342,
                                    onChanged: (value) async {
                                      com_select_val = value!;

                                      if (value != "Draft") {
                                        await select_tbl_card_user_id_titr(value);
                                        await select_tbl_contact_card(list_card_select[0]['id_card'].toString());
                                        setState(() {
                                          selectedItem = value;
                                        });
                                      } else {
                                        //  await select_tbl_card_user_id_titr("0");
                                        await select_tbl_contact_card("0");
                                        setState(() {
                                          selectedItem = value;
                                        });
                                      }
                                      isChecked1.clear();
                                      for (int i = 0; i < list_contact_card.length; i++) {
                                        isChecked1.add(false);
                                      }
                                      filterContacts("");
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(list_card_select[0]['card_fname'].toString(),
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.displayLarge,
                                color: Colors.black,
                                fontSize: font_size_18,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(list_card_select[0]['card_lname'].toString(),
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.displayLarge,
                                color: Colors.black,
                                fontSize: font_size_18,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: card_sade(
                    w_: with_screen,
                    h_: 30,
                    color_: Colors.white,
                    crop_: 10,
                    child_: Align(
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
                                  onChanged: filterContacts,
                                  controller: searchController,
                                  keyboardType: TextInputType.text,
                                  style: GoogleFonts.bonaNova(
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
                        )),
                  ),
                ),
                // const SizedBox(
                //   width: 10,
                // ),
                // GestureDetector(
                //   onTap: () {
                //     code_card = create_new_code();
                //     refresh_pic();
                //     Get.to(new_contact(
                //       type_page: [1, 0, code_card],
                //     ));
                //   },
                //   child: Column(
                //     children: [
                //       Image.asset(
                //         "assets/images/icons8-transfer-64-2.png",
                //         height: 50,
                //         width: 50,
                //       ),
                //       Text(
                //         'transfer',
                //         style: TextStyle(color: Colors.white),
                //       )
                //     ],
                //   ),
                // )
              ],
            ),
            SizedBox(
              height: 400,
              child: StreamBuilder(
                //Error number 2
                stream: NumberCreator2().stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return const Text('done');
                  } else if (snapshot.hasError) {
                    return const Text('Error!');
                  } else {
                    return ListView.builder(
                        itemCount: filteredContacts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return card_sade(
                            w_: with_screen - 10,
                            h_: 60,
                            color_: Colors.white,
                            crop_: 12,
                            child_: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        height: 55,
                                        width: 55,
                                        list_contact_card[index]['pic_url_ferend'].toString(),
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Image.network("https://$address_ip/assets/assets/images/25.png",
                                              width: 55, height: 55, fit: BoxFit.fitWidth);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${list_contact_card[index]['name_contact']} ${list_contact_card[index]['family_contact']}",
                                            style: GoogleFonts.bonaNova(
                                              textStyle: Theme.of(context).textTheme.displayLarge,
                                              color: Colors.black,
                                              fontSize: font_size_18,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            )),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(list_contact_card[index]['email_contact'].toString(),
                                            style: GoogleFonts.bonaNova(
                                              textStyle: Theme.of(context).textTheme.displayLarge,
                                              color: Colors.grey.shade600,
                                              fontSize: font_size_14,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                ExampleMenu(
                                  val: [list_contact_card[index]['pic_url_ferend'].toString(), list_contact_card[index]['id_contact'].toString(), ""],
                                  builder: (_, showMenu) => CupertinoButton(
                                    onPressed: showMenu,
                                    padding: EdgeInsets.zero,
                                    pressedOpacity: 1,
                                    child: const Icon(
                                      Icons.more_vert,
                                      color: Colors.black,
                                      size: 40,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleMenu extends StatefulWidget {
  final List val;
  const ExampleMenu({
    super.key,
    required this.builder,
    required this.val,
  });

  final PullDownMenuButtonBuilder builder;

  @override
  State<ExampleMenu> createState() => _ExampleMenuState();
}

class _ExampleMenuState extends State<ExampleMenu> {
  @override
  Widget build(BuildContext context) => PullDownButton(
        itemBuilder: (context) => [
          PullDownMenuHeader(
            leading: Image.asset(
              widget.val[0],
              width: 65,
              height: 65,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  val_pic_image_network[24],
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                  },
                );
              },
            ),
            title: 'Profile',
            subtitle: 'Tap to open',
            onTap: () async {},
            icon: CupertinoIcons.profile_circled,
          ),
          const PullDownMenuDivider.large(),
          PullDownMenuActionsRow.medium(
            items: [
              PullDownMenuItem(
                onTap: () async {
                  await select_contact_id_contact(widget.val[1]);
                  String sh_ = "${list_contact_select[0]['name_contact']}"
                      " ${list_contact_select[0]['family_contact']}-"
                      "${list_contact_select[0]['mob_contact']}-${list_contact_select[0]['email_contact']}";

                  Share.share(
                    sh_,
                    subject: "Digicapp.com",
                  );
                },
                title: 'Share',
                icon: CupertinoIcons.share,
              ),
              PullDownMenuItem(
                onTap: () async {
                  dialog_2(
                      context,
                      DialogType.warning,
                      () async {
                        await delete_tbl_contact(widget.val[1]);
                        await select_tbl_contact_card(list_card_select[0]['id_card'].toString());
                        setState(() {});
                      },
                      "Remove Contact",
                      "Are you sure you want to Remove Contact?",
                      false,
                      Colors.orange,
                      "Yes",
                      Colors.grey,
                      "No",
                      () {
                        // Navigator.pop(context);
                      });
                },
                title: 'Delete',
                iconColor: Colors.redAccent,
                icon: CupertinoIcons.delete,
              ),
              PullDownMenuItem(
                onTap: () async {
                  please_waite(context);
                  code_card = create_new_code();
                  list_image_send_ftp = [];
                  await select_contact_id_contact(widget.val[1]);
                  list_text_edite_val_contact = [
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
                  val_new_contact = [
                    "",
                    "",
                    "",
                    "",
                    "",
                    "",
                  ];
                  url_test_ = list_contact_select[0]['pic_url_ferend_logo'].toString();
                  url_end_ = "https://$address_ip/assets/assets/images/25.png";
                  await check_Image_url(url_test_, url_end_);

                  list_image_send_ftp.add({
                    'file': "null",
                    'newFileName': Null,
                    'renamedFile': Null,
                    'Type': "0",
                    'sRemoteName': Null,
                    'imageview': NetworkImage(url_test_)
                  });

                  url_test_ = list_contact_select[0]['pic_url_ferend'].toString();
                  url_end_ = "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Add_Profile.png";

                  await check_Image_url(url_test_, url_end_);

                  list_image_send_ftp.add({
                    'file': "null",
                    'newFileName': Null,
                    'renamedFile': Null,
                    'Type': "0",
                    'sRemoteName': Null,
                    'imageview': NetworkImage(url_test_)
                  });
                  list_text_edite_val_contact[0].text = list_contact_select[0]['name_contact'].toString();
                  list_text_edite_val_contact[1].text = list_contact_select[0]['family_contact'].toString();
                  list_text_edite_val_contact[2].text = list_contact_select[0]['jab_title_contact'].toString();
                  list_text_edite_val_contact[3].text = list_contact_select[0]['co_name_contact'].toString();
                  list_text_edite_val_contact[4].text = list_contact_select[0]['mob_contact'].toString();
                  list_text_edite_val_contact[5].text = list_contact_select[0]['email_contact'].toString();
                  list_text_edite_val_contact[6].text = list_contact_select[0]['web_site_contact'].toString();
                  list_text_edite_val_contact[8].text = list_contact_select[0]['address_contact'].toString();
                  list_text_edite_val_contact[7].text = list_contact_select[0]['bio_contact'].toString();
                  print(extractValueFromUrl(list_contact_select[0]['pic_url_ferend_logo'].toString()));
                  Navigator.pop(context);

                  Get.to(new_contact(
                    type_page: [0, widget.val[1], extractValueFromUrl(list_contact_select[0]['pic_url_ferend_logo'].toString())],
                  ));
                },
                title: 'Edit',
                icon: CupertinoIcons.pencil,
              ),
            ],
          ),
          const PullDownMenuDivider.large(),
        ],
        animationBuilder: null,
        position: PullDownMenuPosition.automatic,
        buttonBuilder: widget.builder,
      );
}

class MultiSelectSearchDropdown extends StatelessWidget {
  const MultiSelectSearchDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<String>.multiSelectSearch(
      hintText: 'Select cuisines',
      items: list_combo,
      onListChanged: (value) {
        log('SearchDropdown onChanged value: $value');
      },
    );
  }
}

String extractValueFromUrl(String url) {
  // یافتن مکان شروع و پایان بخش مورد نظر
  int startIndex = url.indexOf('contact/') + 'contact/'.length;
  int endIndex = url.indexOf('o.jpg');

  // استخراج بخش مورد نظر با استفاده از substring
  if (startIndex >= 0 && endIndex > startIndex) {
    return url.substring(startIndex, endIndex);
  } else {
    return 'No match found';
  }
}
