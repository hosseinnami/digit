import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:digicapp/control/update.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/frm_web_view.dart';
import 'package:digicapp/page/card/frm_edit_card.dart';
import 'package:digicapp/page/card/widghet_creat_list_card.dart';
import 'package:digicapp/widget/btn_nav.dart';
import 'package:digicapp/widget/card_widget.dart';
import 'package:digicapp/widget/check_image.dart';
import 'package:digicapp/widget/reset_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../control/delete.dart';
import '../../control/help.dart';
import '../../control/select.dart';
import '../../control/val/val_list.dart';
import '../../control/val/val_pic.dart';
import '../../widget/dialog.dart';
import '../activation/frm_selection_device.dart';
import '../new/frm_new_card.dart';
import '../new/frm_qr_code.dart';
import 'package:http/http.dart' as http;
class my_card extends StatefulWidget {
  const my_card({key});

  @override
  State<my_card> createState() => _PageViewDemoState();
}

List<Widget> ref = [];

class _PageViewDemoState extends State<my_card> {
  // var imageUrlList = [
  //   "https://$address_ip/assets/assets/cards/Digital_Card.png",
  //   "https://$address_ip/assets/assets/cards/dg_mc01sw_front.png",
  //   "https://$address_ip/assets/assets/cards/dg_mc01sb_front.png",
  //   // "https://$address_ip/assets/assets/cards/dg_ec01go_front.png",
  //   // "https://$address_ip/assets/assets/cards/dg_ec01ib_front.png",
  //   // "https://$address_ip/assets/assets/cards/dg_ec01mm_front.png",
  //   // "https://$address_ip/assets/assets/cards/dg_ec01rb_front.png",
  //   // "https://$address_ip/assets/assets/cards/dg_ec01re_front.png",
  //   // "https://$address_ip/assets/assets/cards/dg_ec01sa_front.png",
  //   // "https://$address_ip/assets/assets/cards/dg_le01rd_front.png",
  // ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page_navig = 0;
    id_card_select = list_card[0]['id_card'].toString();
    print(id_card_select);
  }

  Future<void> first_() async {
     await select_tbl_card_id_card(list_card[0]['id_card'].toString());
    await select_tbl_link_card(list_card_select[0]['card_code'].toString());
    link_qr = "https://www.digicapp.com/registration/accessories/${list_card_select[0]['card_url_qr']}";
  }

  Future<void> checkAndAddImage(
      List listImageSendFtp, Map<String, dynamic> listCardSelect) async {
    // لوگو
    String logoUrl = listCardSelect['card_url_pic_logo'].toString();
    bool isLogoValid = await isImageValid(logoUrl);
    listImageSendFtp.add({
      'file': Null,
      'newFileName': "${listCardSelect['card_code'].toString()}o",
      'renamedFile': Null,
      'Type': "0",
      'sRemoteName': Null,
      'imageview': NetworkImage(isLogoValid
          ? logoUrl
          : 'https://example.com/placeholder_logo.png'), // تصویر پیش‌فرض
    });

    // پروفایل
    String profileUrl = listCardSelect['card_url_pic_profile'].toString();
    bool isProfileValid = await isImageValid(profileUrl);
    listImageSendFtp.add({
      'file': Null,
      'newFileName': "${listCardSelect['card_code'].toString()}p",
      'renamedFile': Null,
      'Type': "0",
      'sRemoteName': Null,
      'imageview': NetworkImage(isProfileValid
          ? profileUrl
          : 'https://example.com/placeholder_profile.png'), // تصویر پیش‌فرض
    });
  }

  Future<bool> isImageValid(String url) async {
    try {
      final response = await http.head(Uri.parse(url));
      return response.statusCode == 200 &&
          response.headers['content-type']?.startsWith('image/') == true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  Image.network(
                    val_pic_png_network[15],
                    height: 100,
                    fit: BoxFit.fill,
                    width: with_screen,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("D  I  G  I  C  A",
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.displayLarge,
                                color: Colors.black,
                                fontSize: font_size_16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 200,
                child: StreamBuilder(
                  stream: NumberCreator().stream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.connectionState == ConnectionState.active) {
                      return widghet_creat_list_card();
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      return const Text('done');
                    } else {
                      return const Text('Something went wrong');
                    }
                  },
                ),
              ),

              // Text("Set As a Default",
              //     style: GoogleFonts.bonaNova(
              //       textStyle: Theme.of(context).textTheme.displayLarge,
              //       color: Colors.white,
              //       fontSize: font_size_14,
              //       fontWeight: FontWeight.w400,
              //       fontStyle: FontStyle.normal,
              //     )),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //edit card
           GestureDetector(
                      onTap: () async {
                      
                        if(no_card) {
                          list_image_send_ftp.clear();
                    
                          list_image_send_ftp.add({
                            'file': Null,
                            'newFileName': "${list_card_select[0]['card_code'].toString()}o",
                            'renamedFile': Null,
                            'Type': "0",
                            'sRemoteName': Null,
                            'imageview': NetworkImage(list_card_select[0]['card_url_pic_logo'].toString())
                          });
                          list_image_send_ftp.add({
                            'file': Null,
                            'newFileName': "${list_card_select[0]['card_code'].toString()}p",
                            'renamedFile': Null,
                            'Type': "0",
                            'sRemoteName': Null,
                            'imageview': NetworkImage(list_card_select[0]['card_url_pic_profile'].toString())
                          });
                    
                          Get.to(edit_card(val: [
                            list_card_select[0]['card_title'].toString(),
                            list_card_select[0]['card_jab_title'].toString(),
                            list_card_select[0]['card_fname'].toString(),
                            list_card_select[0]['card_lname'].toString(),
                            list_card_select[0]['card_mob_num'].toString(),
                            list_card_select[0]['card_email'].toString(),
                            list_card_select[0]['card_website'].toString(),
                            list_card_select[0]['card_code'].toString(),
                    
                          ]));
                        }
                        else
                          {
                            dialog_1(context, DialogType.warning, () {
                    
                              //Navigator.pop(context);
                            }, "Warning", "Define a new profile to use the services of this card..", true,
                                Colors.orangeAccent, "Close");
                          }
                      },
                      child: card_sade2(
                        w_: 125,
                        h_: 30,
                        color_: Colors.white,
                        crop_: 20,
                        child_: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                              Colors.white,
                              Colors.grey.shade300,
                              Colors.white,
                            ]),
                          ),
                          child: Center(
                            child: Text("Edit",
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  color: Colors.grey.shade700,
                                  fontSize: font_size_16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                        ),
                      ),
                    ),

                  //new card
                  GestureDetector(
                    onTap: () {
                      refresh_pic();
                      reset_my_card();
                      code_card = create_new_code();
                      Get.to(const new_card());
                    },
                    child: Column(
                      children: [
                        card_sade2(
                          w_: 30,
                          h_: 30,
                          color_: Colors.white,
                          crop_: 20,
                          child_: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                              gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                                Colors.white,
                                Colors.grey.shade300,
                                Colors.white,
                              ]),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.grey.shade700,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Add Profile",
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              color: Colors.grey.shade700,
                              fontSize: font_size_14,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                            ))
                      ],
                    ),
                  ),
                  //share card
                  GestureDetector(
                    onTap: () {
                      if(no_card)
                        {
                      Share.share(
                        link_qr,
                        subject: "Digicapp.com",
                      );
                        }
                      else
                      {
                        dialog_1(context, DialogType.warning, () {

                          //Navigator.pop(context);
                        }, "Warning", "Define a new profile to use the services of this card..", true,
                            Colors.orangeAccent, "Close");
                      }
                    },
                    child: card_sade2(
                      w_: 125,
                      h_: 30,
                      color_: Colors.white,
                      crop_: 20,
                      child_: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                            Colors.white,
                            Colors.grey.shade300,
                            Colors.white,
                          ]),
                        ),
                        child: Center(
                          child: Text("Share",
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.displayLarge,
                                color: Colors.grey.shade700,
                                fontSize: font_size_16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          if(no_card)
                            {
                          Get.to(qr_code(
                            type_frm_qr: 1,
                            val_qr: link_qr,
                          ));
                            }
                          else
                          {
                            dialog_1(context, DialogType.warning, () {

                              //Navigator.pop(context);
                            }, "Warning", "Define a new profile to use the services of this card..", true,
                                Colors.orangeAccent, "Close");
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 2),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.grey.shade200,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/Profile_QR1.png",
                                  width: 65,
                                  height: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("QR Code",
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                    color: Colors.grey.shade700,
                                    fontSize: font_size_14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () async {
                          Get.to(const WebViewScreen(val: ["S H O P", 'https://www.digica.app/collections/all-products']));
                          // Get.to(const WebViewScreen(val: ["S H O P", 'https://www.google.com']));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 2),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.grey.shade200,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/Shop.png",
                                  width: 65,
                                  height: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Shop",
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                    color: Colors.grey.shade700,
                                    fontSize: font_size_14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          if(no_card)
                            {
                          Get.to(select_device(
                            id_card: list_card_select[0]['id_card'].toString(),
                            get_code: list_card_select[0]['card_url_qr'].toString(),
                          ));
                            }
                          else
                          {
                            dialog_1(context, DialogType.warning, () {

                              //Navigator.pop(context);
                            }, "Warning", "Define a new profile to use the services of this card..", true,
                                Colors.orangeAccent, "Close");
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 2),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.grey.shade200,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/Activation.png",
                                  width: 65,
                                  height: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Activation",
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                    color: Colors.grey.shade700,
                                    fontSize: font_size_14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if(no_card)
                            {
                          await select_tbl_card();
                          String id_delete = id_card_select;
                           if (list_card.length > 1) {
                            dialog_2(
                                context,
                                DialogType.noHeader,
                                () {
                                  dialog_2(
                                      context,
                                      DialogType.noHeader,
                                      () {
                                        dialog_2(
                                            context,
                                            DialogType.warning,
                                            () async {
                                              await select_tbl_contact_card(id_delete);
                                              if (list_contact_card.isNotEmpty) {
                                                await update_tbl_contact_draft(id_delete);
                                              }

                                              await delete_card(id_delete);

                                              Get.to(reset_page());
                                            },
                                            "Save As a Draft & Remove",
                                            "Are you sure you want to delete your profile and save your contacts in draft?",
                                            false,
                                            Colors.red,
                                            "Save And Remove",
                                            Colors.grey,
                                            "Cancel",
                                            () {
                                              //Navigator.pop(context);
                                            });
                                      },
                                      "Save Contacts Before Removal",
                                      "Would you like to save your profile contacts in draft before removing your profile card?",
                                      false,
                                      Colors.orange,
                                      "Yes",
                                      Colors.grey,
                                      "No",
                                      () {
                                        dialog_2(
                                            context,
                                            DialogType.warning,
                                            () async {
                                              await select_tbl_contact_card(id_delete);
                                              if (list_contact_card.isNotEmpty) {
                                                await delete_tbl_contact_id_card(id_delete);
                                              }

                                              await delete_card(id_delete);

                                              Get.to(reset_page());
                                            },
                                            "Remove Profile and Contacts?",
                                            "Are you sure you want to delete your profile and contacts?",
                                            false,
                                            Colors.red,
                                            " Yes",
                                            Colors.grey,
                                            "No",
                                            () {
                                              //Navigator.pop(context);
                                            });
                                      });
                                },
                                "Profile Removal",
                                "Are you sure you want to delete your profile?",
                                false,
                                Colors.orange,
                                "Remove Profile",
                                Colors.grey,
                                "Cancel",
                                () {
                                  //Navigator.pop(context);
                                });
                          } else {
                            dialog_1(context, DialogType.error, () {
                              // Navigator.pop(context);
                            }, "Remove Card", "You are not allowed to remove this card. Each user must have at least one active card.", true,
                                Colors.red, "ُTanks");
                          }
                            }
                          else
                          {
                            dialog_1(context, DialogType.warning, () {

                              //Navigator.pop(context);
                            }, "Warning", "Define a new profile to use the services of this card..", true,
                                Colors.orangeAccent, "Close");
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(0, 2),
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.grey.shade200,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/Delete.png",
                                  width: 65,
                                  height: 65,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text("Remove",
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context).textTheme.displayLarge,
                                    color: Colors.grey.shade700,
                                    fontSize: font_size_14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                  )),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const navig(),
    );
  }
}

class card_panel extends StatelessWidget {
  final List list_card;

  const card_panel({Key? key, required this.list_card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.network(
                            list_card[1],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Image.network(
                      height: 75,
                      width: 75,
                      list_card[4],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(val_pic_image_network[24], width: 75, height: 75, fit: BoxFit.cover);
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 125,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(list_card[2] + " " + list_card[3],
                        style: GoogleFonts.bonaNova(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_10,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(list_card[0],
            style: GoogleFonts.bonaNova(
              textStyle: Theme.of(context).textTheme.displayLarge,
              color: Colors.black,
              fontSize: font_size_10,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ))
       //
      ],
    );
  }
}
