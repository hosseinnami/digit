// import 'package:digicapp/control/val/val_list.dart';
// import 'package:digicapp/page/card/frm_my_card_me.dart';
// import 'package:digicapp/page/card/page_my_card.dart';
// import 'package:flutter/material.dart';
// import 'package:gallery_3d/gallery_3d.dart';
// import 'package:get/get.dart';
//
// import '../../control/select.dart';
// import '../../control/val/control_val.dart';
//
// class widghet_creat_list_card2 extends StatefulWidget {
//   const widghet_creat_list_card2({Key? key}) : super(key: key);
//
//   @override
//   State<widghet_creat_list_card2> createState() => _widghet_creat_list_cardState();
// }
//
// List<Widget> wid_list_select = [];
// Future<void> create_list_card() async {
//   List<Widget> l2 = [];
//   await select_tbl_card();
//   int count_list_card = list_card.length;
//   print(count_list_card);
//
//   for (int i = 0; i < count_list_card; i++) {
//     print(i);
//     l2.add(
//       card_panel(
//         list_card: [
//           list_card[i]['card_title'].toString(),
//           "https://$address_ip/assets/assets/cards/dg_mc01sw_front.png",
//           list_card[i]['card_fname'].toString(),
//           list_card[i]['card_lname'].toString(),
//           list_card[i]['card_url_pic_profile'].toString(),
//           list_card[i]['id_card'].toString(),
//         ],
//       ),
//     );
//   }
//   if (count_list_card == 1) {
//     l2.add(
//       card_panel(
//         list_card: [
//           "",
//           "https://$address_ip/assets/assets/cards/1_gray.png",
//           "",
//           "",
//           "",
//           "",
//         ],
//       ),
//     );
//     l2.add(
//       card_panel(
//         list_card: [
//           "",
//           "https://$address_ip/assets/assets/cards/1_gray.png",
//           "",
//           "",
//           "",
//           "",
//         ],
//       ),
//     );
//   } else if (count_list_card == 2) {
//     l2.add(
//       card_panel(
//         list_card: [
//           "",
//           "https://$address_ip/assets/assets/cards/1_gray.png",
//           "",
//           "",
//           "",
//           "",
//         ],
//       ),
//     );
//   }
//   wid_list_select = l2;
// }
//
// class _widghet_creat_list_cardState extends State<widghet_creat_list_card2> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _initCardList();
//   }
//
//   Future<void> _initCardList() async {
//     await create_list_card1();
//     setState(() {
//       // رابط کاربری را بعد از به‌روزرسانی لیست ویجت‌ها رندر کنید
//     });
//   }
//
//   Future<void> create_list_card1() async {
//     List<Widget> l2 = [];
//     await select_tbl_card();
//     int count_list_card = list_card.length;
//     print(count_list_card);
//
//     for (int i = 0; i < count_list_card; i++) {
//       print(i);
//       l2.add(
//         card_panel(
//           list_card: [
//             list_card[i]['card_title'].toString(),
//             "https://$address_ip/assets/assets/cards/dg_mc01sw_front.png",
//             list_card[i]['card_fname'].toString(),
//             list_card[i]['card_lname'].toString(),
//             list_card[i]['card_url_pic_profile'].toString(),
//             list_card[i]['id_card'].toString(),
//           ],
//         ),
//       );
//     }
//
//     if (count_list_card == 1) {
//       l2.add(
//         card_panel(
//           list_card: [
//             "",
//             "https://$address_ip/assets/assets/cards/1_gray.png",
//             "",
//             "",
//             "",
//             "",
//           ],
//         ),
//       );
//       l2.add(
//         card_panel(
//           list_card: [
//             "",
//             "https://$address_ip/assets/assets/cards/1_gray.png",
//             "",
//             "",
//             "",
//             "",
//           ],
//         ),
//       );
//     } else if (count_list_card == 2) {
//       l2.add(
//         card_panel(
//           list_card: [
//             "",
//             "https://$address_ip/assets/assets/cards/1_gray.png",
//             "",
//             "",
//             "",
//             "",
//           ],
//         ),
//       );
//     }
//
//     setState(() {
//       wid_list_select = l2;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Gallery3D(
//         width: MediaQuery.of(context).size.width,
//         height: 200,
//         isClip: true,
//         onItemChanged: (index) async {
//           id_card_select = list_card[index]['id_card'].toString();
//           print(list_card[index]['id_card'].toString());
//           await select_tbl_card_id_card(list_card[index]['id_card'].toString());
//           await select_tbl_link_card(list_card_select[0]['card_code'].toString());
//           setState(() {
//             link_qr = "https://www.digicapp.com/registration/accessories/${list_card_select[0]['card_url_qr']}";
//           });
//         },
//         itemConfig: const GalleryItemConfig(width: 300, height: 200, radius: 20, isShowTransformMask: true),
//         onClickItem: (index) async {
//           print(index);
//
//           Get.to(my_card_me(name_card: [
//             list_card_select[0]['card_title'].toString(),
//             list_card_select[0]['card_jab_title'].toString(),
//             list_card_select[0]['card_fname'].toString(),
//             list_card_select[0]['card_lname'].toString(),
//             list_card_select[0]['card_website'].toString(),
//             list_card_select[0]['card_mob_num'].toString(),
//             list_card_select[0]['card_email'].toString(),
//             list_card_select[0]['card_website'].toString(),
//             list_card_select[0]['card_code'].toString(),
//             list_card_select[0]['card_url_pic_profile'].toString(),
//             list_card_select[0]['card_url_pic_logo'].toString(),
//             list_card_select[0]['card_address'].toString(),
//           ]));
//         },
//         itemBuilder: (context, index) {
//           return wid_list_select[index];
//         },
//         itemCount: wid_list_select.length,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class ContactSearchPage extends StatefulWidget {
  @override
  _ContactSearchPageState createState() => _ContactSearchPageState();
}

class _ContactSearchPageState extends State<ContactSearchPage> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> contacts = [
    {
      'id_contact': 98,
      'name_contact': 'hossein',
      'family_contact': 'nami',
      'email_contact': 'good morning I',
      'pic_url_ferend': 'https://www.digicapp.com/digic_pic/user/contact/1241p.jpg',
      // بقیه فیلدها...
    },
    {
      'id_contact': 97,
      'name_contact': 'sbs',
      'family_contact': 'zbvzv88',
      'email_contact': 'zhzg@fdgdfg.fdsgdf',
      'pic_url_ferend': '',
      // بقیه فیلدها...
    },
  ];

  List<Map<String, dynamic>> filteredContacts = [];

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void filterContacts(String query) {
    setState(() {
      filteredContacts = contacts.where((contact) {
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
      appBar: AppBar(
        title: Text('Search Contacts'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
              onChanged: filterContacts,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return ListTile(
                  leading: contact['pic_url_ferend'] != '' ? Image.network(contact['pic_url_ferend'], width: 50, height: 50) : Icon(Icons.person),
                  title: Text('${contact['name_contact']} ${contact['family_contact']}'),
                  subtitle: Text(contact['email_contact']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
