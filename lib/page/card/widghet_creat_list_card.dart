import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:digicapp/page/card/frm_my_card_me.dart';
import 'package:digicapp/page/card/page_my_card.dart';
import 'package:digicapp/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:get/get.dart';

import '../../control/select.dart';
import '../../control/val/control_val.dart';

class widghet_creat_list_card extends StatefulWidget {
  const widghet_creat_list_card({Key? key}) : super(key: key);

  @override
  State<widghet_creat_list_card> createState() => _widghet_creat_list_cardState();
}
bool no_card=false;
List<Widget> wid_list_select = [];
Future<void> create_list_card() async {
  List<Widget> l2 = [];
  await select_tbl_card();
  int count_list_card = list_card.length;

  for (int i = 0; i < count_list_card; i++) {
     l2.add(
      card_panel(
        list_card: [
          list_card[i]['card_title'].toString(),
          "https://$address_ip/assets/assets/cards/dg_mc01sw_front.png",
          list_card[i]['card_fname'].toString(),
          list_card[i]['card_lname'].toString(),
          list_card[i]['card_url_pic_profile'].toString(),
          list_card[i]['id_card'].toString(),
        ],
      ),
    );
  }
  if (count_list_card == 1) {
    l2.add(
      card_panel(
        list_card: [
          "",
          "https://$address_ip/assets/assets/cards/1_gray.png",
          "",
          "",
          "",
          "",
        ],
      ),
    );
    l2.add(
      card_panel(
        list_card: [
          "",
          "https://$address_ip/assets/assets/cards/1_gray.png",
          "",
          "",
          "",
          "",
        ],
      ),
    );
  } else if (count_list_card == 2) {
    l2.add(
      card_panel(
        list_card: [
          "",
          "https://$address_ip/assets/assets/cards/1_gray.png",
          "",
          "",
          "",
          "",
        ],
      ),
    );
  }
  wid_list_select = l2;
}

class _widghet_creat_list_cardState extends State<widghet_creat_list_card> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCardList();
  }

  Future<void> _initCardList() async {
    await create_list_card();
    setState(() {
      // رابط کاربری را بعد از به‌روزرسانی لیست ویجت‌ها رندر کنید
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Gallery3D(
          controller: Gallery3DController(itemCount: wid_list_select.length, delayTime: 4000, autoLoop: true),
          width: MediaQuery.of(context).size.width,
          height: 240,
          isClip: true,
          onItemChanged: (index) async {
            // بررسی اینکه آیا اندیس معتبر است و لیست حداقل به طول index+1 می‌رسد
            if (index >= 0 && index < list_card.length) {
              no_card=true;
              id_card_select = list_card[index]['id_card'].toString();
              print(id_card_select);

              // بررسی مجدد برای اطمینان از عدم خالی بودن list_card_select
              await select_tbl_card_id_card(id_card_select);
              await select_tbl_link_card(list_card_select[0]['card_code'].toString());

              if (list_card_select.isNotEmpty && list_card_select[0].containsKey('card_code') && list_card_select[0].containsKey('card_url_qr')) {

                setState(() {
                  link_qr = "https://www.digicapp.com/registration/accessories/${list_card_select[0]['card_url_qr']}";
                });
              } else {
                print("list_card_select is empty or does not contain necessary keys");
              }
            } else {
              setState(() {
                no_card=false;
              });
              print("Index out of range for list_card");
            }

          },
          itemConfig: const GalleryItemConfig(width: 300, height: 200, radius: 20, isShowTransformMask: false),
          onClickItem: (index) async {
            // بررسی اینکه اندیس معتبر است و list_card_select حداقل یک عنصر دارد
            if (index >= 0 && index < list_card.length) {
              no_card=true;
              Get.to(my_card_me(name_card: [
                list_card_select[0]['card_title']?.toString() ?? '',
                list_card_select[0]['card_jab_title']?.toString() ?? '',
                list_card_select[0]['card_fname']?.toString() ?? '',
                list_card_select[0]['card_lname']?.toString() ?? '',
                list_card_select[0]['card_website']?.toString() ?? '',
                list_card_select[0]['card_mob_num']?.toString() ?? '',
                list_card_select[0]['card_email']?.toString() ?? '',
                list_card_select[0]['card_website']?.toString() ?? '',
                list_card_select[0]['card_code']?.toString() ?? '',
                list_card_select[0]['card_url_pic_profile']?.toString() ?? '',
                list_card_select[0]['card_url_pic_logo']?.toString() ?? '',
                list_card_select[0]['card_address']?.toString() ?? '',
              ]));
            } else {
              no_card=false;
              dialog_1(context, DialogType.warning, () {

                //Navigator.pop(context);
              }, "UPGRADE", "Define a new profile to use the services of this card..", true,
                  Colors.orangeAccent, "Upgrade Now");
            }
          },

          itemBuilder: (context, index) {
            return wid_list_select[index];
          }),
    );
  }
}
