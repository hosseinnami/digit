import 'package:digicapp/control/val/control_val.dart';
import 'package:flutter/cupertino.dart';

List<TextEditingController> list_text_new_val_insert_user = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];
List<TextEditingController> list_text_new_val_forget_pass = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];
List<TextEditingController> list_text_new_val_select_user = [
  TextEditingController(),
  TextEditingController(),
];
List<bool> act_forget_pass = [false, false, false];
// LatLong myloc = LatLong(29.658898, 52.477784);
List list_user = [];
List list_user_sopify = [];
List list_card = [];List list_all_card = [];
List list_card_select = [];
List list_card_select_edit = [];
List<Map<String, dynamic>> list_contact_card = [];
List list_contact = [];
List list_contact_select = [];
List list_card_id = [];
List list_card_link_share = [];
List list_tbl_pass_app = [];
List<TextEditingController> list_text_edite_val_user = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];
List<TextEditingController> list_text_edite_val_new_share = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];
List<TextEditingController> list_text_edite_val_card = [
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
List val_new_card = [
  "",
  "",
  "",
  "",
  "",
  "",
];
void reset_my_card() {
  val_new_card = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
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
}

List<TextEditingController> list_text_edite_val_contact = [
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
List val_new_contact = [
  "",
  "",
  "",
  "",
  "",
  "",
];

void reset_list_cotact() {
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
}

List val_new_contact_selected = [];
List<Map<String, dynamic>> list_image_send_ftp = [];
String link_logo_add_link(val) {
  String link_ = "https://$address_ip/digic_pic/user/share/DIGICA_icons/social_Media/";
  return "${link_ + val}.png";
}

//http://digicapp.com/apk/Digica-App-Beta (Ver.1.1.6).apk
List<Map<String, dynamic>> list_link_add_type = [
  {'act': 1, 'type': 'Social Media'},
  {'act': 1, 'type': 'Business'},
  {'act': 1, 'type': 'Restaurants'},
  {'act': 1, 'type': 'Real Estate'},
  {'act': 1, 'type': 'Payments'},
  {'act': 1, 'type': 'Others'},
];
List<Map<String, dynamic>> list_link_add_type_sub = [
  {'act': 0, 'type': 'Social Media', 'name': 'Instagram', 'link_username': 'https://www.instagram.com/'},
  {'act': 0, 'type': 'Social Media', 'name': 'Snapchat', 'link_username': 'https://www.snapchat.com/add/'},
  {'act': 0, 'type': 'Social Media', 'name': 'Telegram', 'link_username': 'https://t.me/'},
  {'act': 0, 'type': 'Social Media', 'name': 'WhatsApp', 'link_username': 'https://wa.me/'}, // شماره تلفن به فرمت بین‌المللی بدون +
  {'act': 0, 'type': 'Social Media', 'name': 'Viber', 'link_username': 'viber://contact?number='}, // شماره تلفن
  {'act': 0, 'type': 'Social Media', 'name': 'WeChat', 'link_username': 'weixin://dl/officialaccounts/'}, // آیدی عمومی
  {'act': 0, 'type': 'Social Media', 'name': 'TikTok', 'link_username': 'https://www.tiktok.com/@'},
  {'act': 0, 'type': 'Social Media', 'name': 'YouTube', 'link_username': 'https://www.youtube.com/@'},
  {'act': 0, 'type': 'Social Media', 'name': 'LinkedIn', 'link_username': 'https://www.linkedin.com/in/'},
  {'act': 0, 'type': 'Social Media', 'name': 'X', 'link_username': 'https://x.com/'}, // برای دسترسی به پروفایل در X
  {'act': 0, 'type': 'Social Media', 'name': 'Qzone', 'link_username': 'https://user.qzone.qq.com/'},
  {'act': 0, 'type': 'Social Media', 'name': 'ClubHouse', 'link_username': 'https://www.clubhouse.com/@'},
  {'act': 0, 'type': 'Social Media', 'name': 'Pinterest', 'link_username': 'https://www.pinterest.com/'},
  {'act': 0, 'type': 'Social Media', 'name': 'Reddit', 'link_username': 'https://www.reddit.com/user/'},
  {'act': 0, 'type': 'Social Media', 'name': 'Weibo', 'link_username': 'https://weibo.com/u/'}, // آیدی کاربر در Weibo
  {'act': 0, 'type': 'Social Media', 'name': 'QQ', 'link_username': 'https://qm.qq.com/cgi-bin/qm/qr?k='}, // شماره یا کد QR
  {'act': 0, 'type': 'Social Media', 'name': 'Twitch', 'link_username': 'https://www.twitch.tv/'},
  {'act': 0, 'type': 'Social Media', 'name': 'Tumblr', 'link_username': 'https://www.tumblr.com/blog/view/'},
  {'act': 0, 'type': 'Social Media', 'name': 'Yelp', 'link_username': 'https://www.yelp.com/user_details?userid='},
  {'act': 0, 'type': 'Social Media', 'name': 'Facebook', 'link_username': 'https://www.facebook.com/'},
  {'act': 0, 'type': 'Business', 'name': 'Web Site', 'link_username': 'https://'},
  {'act': 0, 'type': 'Business', 'name': 'Funnel', 'link_username': 'https://'},
  {'act': 0, 'type': 'Business', 'name': 'Calendly', 'link_username': 'https://calendly.com/'},
  {'act': 0, 'type': 'Business', 'name': 'Shopify', 'link_username': 'https://yourshopname.myshopify.com/'},
  {'act': 0, 'type': 'Business', 'name': 'Amazon', 'link_username': 'https://www.amazon.com/shop/'}, // برای لینک فروشگاه یا صفحه شخصی
  {'act': 0, 'type': 'Business', 'name': 'Ebay', 'link_username': 'https://www.ebay.com/usr/'},
  {'act': 0, 'type': 'Business', 'name': 'Microsoft', 'link_username': 'https://account.microsoft.com/profile/'},
  {'act': 0, 'type': 'Business', 'name': 'Square', 'link_username': 'https://squareup.com/'},
  {'act': 0, 'type': 'Business', 'name': 'OpenTable', 'link_username': 'https://www.opentable.com/'},
  {'act': 0, 'type': 'Business', 'name': 'Exchange', 'link_username': 'https://'},
  {'act': 0, 'type': 'Real Estate', 'name': 'Zolo', 'link_username': 'https://www.zolo.ca/'},
  {'act': 0, 'type': 'Real Estate', 'name': 'realtor', 'link_username': 'https://www.realtor.ca/'},
  {'act': 0, 'type': 'Real Estate', 'name': 'remax', 'link_username': 'https://www.remax.ca/'},
  {'act': 0, 'type': 'Real Estate', 'name': 'zillow', 'link_username': 'https://www.zillow.com/'},
  {'act': 0, 'type': 'Real Estate', 'name': 'airbnb', 'link_username': 'https://www.airbnb.com/p/'},
  {'act': 0, 'type': 'Real Estate', 'name': 'Royal LePage', 'link_username': 'https://www.royallepage.ca/en/'},
  {'act': 0, 'type': 'Restaurants', 'name': 'Food Menu', 'link_username': 'https://'},
  {'act': 0, 'type': 'Payments', 'name': 'DG Pay', 'link_username': 'https://'},
  {'act': 0, 'type': 'Payments', 'name': 'Pay Pal', 'link_username': 'https://www.paypal.me/'},
  {'act': 0, 'type': 'Payments', 'name': 'Venmo', 'link_username': 'https://venmo.com/'},
  {'act': 0, 'type': 'Others', 'name': 'Google Reviews', 'link_username': 'https://search.google.com/local/writereview?placeid='},
  {'act': 0, 'type': 'Others', 'name': 'Uber_Eats', 'link_username': 'https://www.ubereats.com/'},
  {'act': 0, 'type': 'Others', 'name': 'DoorDash', 'link_username': 'https://www.doordash.com/store/'},
];


String link_qr = "";

void refresh_pic() {
  list_image_send_ftp = [];

  list_image_send_ftp.add({
    'file': "null",
    'newFileName': Null,
    'renamedFile': Null,
    'Type': "0",
    'sRemoteName': Null,
    'imageview': NetworkImage("https://$address_ip/assets/assets/images/25.png")
  });
  list_image_send_ftp.add({
    'file': "null",
    'newFileName': Null,
    'renamedFile': Null,
    'Type': "0",
    'sRemoteName': Null,
    'imageview': NetworkImage(
      "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Add_Profile.png",
    )
  });
}
