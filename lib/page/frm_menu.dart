import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:digicapp/control/delete.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:digicapp/page/card/page_my_card.dart';
import 'package:digicapp/page/login/login_page.dart';
import 'package:digicapp/page/new/frm_qr_code.dart';
import 'package:digicapp/widget/btn_nav.dart';
import 'package:digicapp/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../control/insert.dart';
import '../control/select.dart';
import '../frm_web_view.dart';
import 'login/login_logo.dart';

class my_menu extends StatefulWidget {
  const my_menu({Key? key}) : super(key: key);

  @override
  State<my_menu> createState() => _my_menuState();
}

class _my_menuState extends State<my_menu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page_navig = 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawerScrimColor: Colors.white,
      bottomNavigationBar: const navig(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text("SETTING",
                      style: GoogleFonts.bonaNova(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.white,
                        fontSize: font_size_24,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                link_page_menu(val: [
                  "Profile",
                  () {
                    Get.to(my_card());
                  }
                ]),
                // link_page_menu(val: [
                //   "PASSWORD",
                //   () async {
                //     await selectShopify();
                //   }
                // ]),
                const SizedBox(
                  height: 24,
                ),
                link_page_menu(val: [
                  "QR Code",
                  () async {
                    Get.to(qr_code(
                      type_frm_qr: 1,
                      val_qr: "https://www.digicapp.com/registration/accessories/${list_card[0]['card_url_qr']}",
                    ));
                  }
                ]),
                link_page_menu(val: [
                  "Share Contacts",
                  () {
                    Share.share(
                      "https://www.digicapp.com/registration/accessories/${list_card[0]['card_url_qr']}",
                      subject: "Digicapp.com",
                    );
                  }
                ]),
                const SizedBox(
                  height: 24,
                ),
                // link_page_menu(val: ["SUBSCRIPTION PLANS", () {}]),
                // link_page_menu(val: ["PAYMENT METHODS", () {}]),
                // const SizedBox(
                //   height: 24,
                // ),
               // const link_url_menu(val: ["Iconic Tools", 'https://www.digica.app/collections/all-products']),
                link_page_menu(val: [
                  "Activation Devices",
                  () {
                    Get.to(my_card());
                  }
                ]),
                const SizedBox(
                  height: 24,

                ),
                const link_url_menu(val: ["Support", 'https://www.digica.app/pages/contact']),
                const link_url_menu(val: ["News", 'https://www.digica.app/blogs/news']),
                const link_url_menu(val: ["FAQ", 'https://www.digica.app']),
                const SizedBox(
                  height: 24,
                ),
                const link_url_menu(val: ["Digital Manual", 'https://www.digica.app/pages/manual']),
                const link_url_menu(val: ["Affiliate Policy", 'https://www.digica.app/pages/affiliate-policy']),
                const link_url_menu(val: ["Refund Policy", 'https://www.digica.app/policies/refund-policy']),
                const link_url_menu(val: ["Shipping Policy", 'https://www.digica.app/policies/shipping-policy']),
                const link_url_menu(val: ["Privacy Policy", 'https://www.digica.app/policies/privacy-policy']),
                const link_url_menu(val: ["Youtube", 'https://www.youtube.com/@Digica_official']),
                const SizedBox(
                  height: 24,
                ),
                // link_page_menu(val: [
                //   "Subscription",
                //       () {
                //         showDialog(
                //           context: context,
                //           builder: (BuildContext context) {
                //             return Dialog(
                //               backgroundColor: Colors.grey[900], // تنظیم بک‌گراند خاکستری تیره
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(12.0),
                //               ),
                //               child: Padding(
                //                 padding: const EdgeInsets.all(16.0),
                //                 child: Column(
                //                   mainAxisSize: MainAxisSize.min,
                //                   children: [
                //                     const link_url_menu(val: ["DG PLUS (Monthly)", 'https://buy.stripe.com/8wMfZDfQyexO3GE144']),
                //                     const link_url_menu(val: ["DG PLUS (Annually)", 'https://buy.stripe.com/bIYbJn6fYblCcdaaEG']),
                //
                //                   ],
                //                 ),
                //               ),
                //             );
                //           },
                //         );
                //   }
                // ]),

                const link_url_menu(val: ["Tutorial", 'https://www.youtube.com/@Digica_official']),


                link_page_menu(val: [
                  "Delete Account",
                  () {
                    dialog_2(
                        context,
                        DialogType.noHeader,
                        () {
                          dialog_2(context, DialogType.warning, () async {
                            please_waite(context);
                            print(list_user);

                            await insert_user_delete(
                                list_user.first['name_user'].toString(),
                                list_user.first['family_user'].toString(),
                                list_user.first['email_user'].toString(),
                                list_user.first['pass_user'].toString(),
                                list_user.first['mob_user'].toString(),
                                list_user.first[' address_user'].toString(),
                                list_user.first[' city_user'].toString(),
                                list_user.first[' province_user'].toString(),
                                list_user.first['tel_user'].toString(),
                                list_user.first['zip_user'].toString(),
                                list_user.first['country_user'].toString(),
                                list_user.first['pic_user'].toString(),
                                DateTime.now().toString(),
                                list_user.first['biert_day_user'].toString(),
                                0,
                                0);

                            await select_tbl_card();

                            for (int i = 0; i < list_card.length; i++) {
                              await delete_tbl_contact_id_card(list_card[i]['id_card'].toString());
                              await delete_card(list_card[i]['id_card'].toString());
                            }
                            await delete_tbl_contact_id_user();
                            await delete_link_card_id_user();
                            await delete_tbl_user_device_add_id_user();
                            await delete_tbl_user();

                            Navigator.of(context).pop();
                            await Get.offAll(frm_login_logo());
                          },
                              "remove Accent",
                              "Warning: By deleting the account, all information and data related to this account will be permanently deleted from the system and this operation is irreversible. Are you sure you want to delete your account?",
                              false,
                              Colors.orange,
                              "remove Accent",
                              Colors.grey,
                              "Cancel",
                              () {});
                        },
                        "remove Accent",
                        "Are you sure you want to delete Accent?",
                        false,
                        Colors.orange,
                        "remove Accent",
                        Colors.grey,
                        "Cancel",
                        () {
                          //Navigator.pop(context);
                        });
                  }
                ]),
                link_page_menu(val: [
                  "SIGN OUT",
                  () {
                    dialog_2(
                        context,
                        DialogType.warning,
                        () async {
                          await delete_tbl_user_device_add();
                          Get.offAll(frm_login());
                        },
                        "SIGN OUT",
                        "Are you sure you want to sign out?",
                        false,
                        Colors.orange,
                        "SIGN OUT",
                        Colors.grey,
                        "Cancel",
                        () {
                          // Navigator.pop(context);
                        });
                  }
                ]),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Version 1.0.11",
                      style: GoogleFonts.bonaNova(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.white,
                        fontSize: font_size_12,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class link_url_menu extends StatelessWidget {
  final List val;
  const link_url_menu({Key? key, required this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print(val);
        Get.to(WebViewScreen(val: [val[0], val[1]]));
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 15),
        child: Text(val[0],
            style: GoogleFonts.bonaNova(
              textStyle: Theme.of(context).textTheme.displayLarge,
              color: Colors.white,
              fontSize: font_size_18,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
      ),
    );
  }
}

class link_page_menu extends StatelessWidget {
  final List val;
  const link_page_menu({Key? key, required this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: val[1],
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 15),
        child: Text(val[0],
            style: GoogleFonts.bonaNova(
              textStyle: Theme.of(context).textTheme.displayLarge,
              color: Colors.white,
              fontSize: font_size_18,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
      ),
    );
  }
}

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.grey[900], // تنظیم بک‌گراند خاکستری تیره
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'انتخاب کنید',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      // لینک اول - باز کردن یک لینک در مرورگر
                    //  launchURL('https://example.com/1');
                    },
                    child: Text(
                      'لینک اول',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // لینک دوم - باز کردن یک لینک در مرورگر
                      //launchURL('https://example.com/2');
                    },
                    child: Text(
                      'لینک دوم',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
