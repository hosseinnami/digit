import 'dart:async';
import 'dart:convert';

import 'package:digicapp/control/select.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../page/login/new_user.dart';
import 'db_base.dart';
import 'val/val_list.dart';

Future<void> insert_user(
    String name_user,
    String family_user,
    String email_user,
    String pass_user,
    String? mob_user,
    String? address_user,
    String? city_user,
    String? province_user,
    String? tel_user,
    String? zip_user,
    String? country_user,
    String? pic_user,
    String? datetime_add_user,
    String? biert_day_user,
    int? act_user,
    email_marketing) async {
  if (name_user.trim().isNotEmpty) {
    name_user = Uri.encodeComponent(name_user);
  } else {
    name_user = "0";
  }
  if (family_user.trim().isNotEmpty) {
    family_user = Uri.encodeComponent(family_user);
  } else {
    family_user = "0";
  }
  if (email_user.trim().isNotEmpty) {
    email_user = Uri.encodeComponent(email_user);
  } else {
    email_user = "0";
  }
  if (pass_user.trim().isNotEmpty) {
    pass_user = Uri.encodeComponent(pass_user);
  } else {
    pass_user = "0";
  }
  mob_user = mob_user?.trim().isNotEmpty == true ? Uri.encodeComponent(mob_user!) : "0";
  address_user = address_user?.trim().isNotEmpty == true ? Uri.encodeComponent(address_user!) : "0";
  city_user = city_user?.trim().isNotEmpty == true ? Uri.encodeComponent(city_user!) : "0";
  province_user = province_user?.trim().isNotEmpty == true ? Uri.encodeComponent(province_user!) : "0";
  tel_user = tel_user?.trim().isNotEmpty == true ? Uri.encodeComponent(tel_user!) : "0";
  zip_user = zip_user?.trim().isNotEmpty == true ? Uri.encodeComponent(zip_user!) : "0";
  country_user = country_user?.trim().isNotEmpty == true ? Uri.encodeComponent(country_user!) : "0";
  pic_user = pic_user?.trim().isNotEmpty == true ? Uri.encodeComponent(pic_user!) : "0";
  datetime_add_user = datetime_add_user?.trim().isNotEmpty == true ? Uri.encodeComponent(datetime_add_user!) : "0";
  biert_day_user = biert_day_user?.trim().isNotEmpty == true ? Uri.encodeComponent(biert_day_user!) : "0";
  act_user = act_user ?? 0;

  final url = Uri.parse(
      'https://$address_ip:$port_/insert/insert_tbl_user/$name_user/$family_user/$email_user/$pass_user/$mob_user/$address_user/$city_user/$province_user/$tel_user/$zip_user/$country_user/$pic_user/$datetime_add_user/$biert_day_user/$act_user/$email_marketing');
  print(url);
  final response = await http.get(url);
}

Future<void> insert_user_delete(
    String name_user,
    String family_user,
    String email_user,
    String pass_user,
    String? mob_user,
    String? address_user,
    String? city_user,
    String? province_user,
    String? tel_user,
    String? zip_user,
    String? country_user,
    String? pic_user,
    String? datetime_add_user,
    String? biert_day_user,
    int? act_user,
    email_marketing) async {
  if (name_user.trim().isNotEmpty) {
    name_user = Uri.encodeComponent(name_user);
  } else {
    name_user = "0";
  }
  if (family_user.trim().isNotEmpty) {
    family_user = Uri.encodeComponent(family_user);
  } else {
    family_user = "0";
  }
  if (email_user.trim().isNotEmpty) {
    email_user = Uri.encodeComponent(email_user);
  } else {
    email_user = "0";
  }
  if (pass_user.trim().isNotEmpty) {
    pass_user = Uri.encodeComponent(pass_user);
  } else {
    pass_user = "0";
  }
  mob_user = mob_user?.trim().isNotEmpty == true ? Uri.encodeComponent(mob_user!) : "0";
  address_user = address_user?.trim().isNotEmpty == true ? Uri.encodeComponent(address_user!) : "0";
  city_user = city_user?.trim().isNotEmpty == true ? Uri.encodeComponent(city_user!) : "0";
  province_user = province_user?.trim().isNotEmpty == true ? Uri.encodeComponent(province_user!) : "0";
  tel_user = tel_user?.trim().isNotEmpty == true ? Uri.encodeComponent(tel_user!) : "0";
  zip_user = zip_user?.trim().isNotEmpty == true ? Uri.encodeComponent(zip_user!) : "0";
  country_user = country_user?.trim().isNotEmpty == true ? Uri.encodeComponent(country_user!) : "0";
  pic_user = pic_user?.trim().isNotEmpty == true ? Uri.encodeComponent(pic_user!) : "0";
  datetime_add_user = datetime_add_user?.trim().isNotEmpty == true ? Uri.encodeComponent(datetime_add_user!) : "0";
  biert_day_user = biert_day_user?.trim().isNotEmpty == true ? Uri.encodeComponent(biert_day_user!) : "0";
  act_user = act_user ?? 0;

  final url = Uri.parse(
      'https://$address_ip:$port_/insert/insert_tbl_user_delete/$name_user/$family_user/$email_user/$pass_user/$mob_user/$address_user/$city_user/$province_user/$tel_user/$zip_user/$country_user/$pic_user/$datetime_add_user/$biert_day_user/$act_user/$email_marketing');
  print(url);
  final response = await http.get(url);
}

Future<void> upload_file(file, name, loc) async {
  name = Uri.encodeComponent(name);
  loc = Uri.encodeComponent("C:\\inetpub\\wwwroot\\digic_pic\\$loc");
  Uint8List? bbb;
  bbb = file;
  //print(bbb);
  String dd = "";
  for (int i = 0; i < file!.length; i++) {
    dd = "$dd,${file![i]}";
  }

  final url = Uri.parse('https://$address_ip:8080/upload/image/$dd/$name/$loc');

  final response = await http.get(url);
}

Future<void> insert_user_device_add(String type_uda, String code_uda, String datetime_add, int act_uda) async {
  if (type_uda.trim().isNotEmpty) {
    type_uda = Uri.encodeComponent(type_uda);
  } else {
    type_uda = "0";
  }
  if (code_uda.trim().isNotEmpty) {
    code_uda = Uri.encodeComponent(code_uda);
  } else {
    code_uda = "0";
  }
  if (datetime_add.trim().isNotEmpty) {
    datetime_add = Uri.encodeComponent(datetime_add);
  } else {
    datetime_add = "0";
  }

  final url = Uri.parse('https://$address_ip:$port_/insert/insert_tbl_user_device_add/$type_uda/$code_uda/$datetime_add/$act_uda');
  print(url);
  final response = await http.get(url);
}

Future<void> insertCard(
    cardTitle,
    cardFname,
    cardLname,
    cardCoName,
    cardJabTitle,
    cardMobNum,
    cardEmail,
    cardLat,
    cardLong,
    cardAddress,
    cardCaption,
    cardBkColor,
    cardQrColor,
    cardUrlQr,
    cardUrlPicLogo,
    cardUrlPicProfile,
    cardUrlPicBk,
    cardUrlPicQr,
    idUserCard,
    datetimeAdd,
    actCard,
    def_card,
    code_card,
    card_website,
    ppm_card,
    hpi_card,
    hdl_card) async {
  // Encode each parameter if not empty
  cardTitle = cardTitle.toString().trim().isNotEmpty ? Uri.encodeComponent(cardTitle.toString()) : "0";
  cardFname = cardFname.toString().trim().isNotEmpty ? Uri.encodeComponent(cardFname.toString()) : "0";
  cardLname = cardLname.toString().trim().isNotEmpty ? Uri.encodeComponent(cardLname.toString()) : "0";
  cardCoName = cardCoName.toString().trim().isNotEmpty ? Uri.encodeComponent(cardCoName.toString()) : "0";
  cardJabTitle = cardJabTitle.toString().trim().isNotEmpty ? Uri.encodeComponent(cardJabTitle.toString()) : "0";
  cardMobNum = cardMobNum.toString().trim().isNotEmpty ? Uri.encodeComponent(cardMobNum.toString()) : "0";
  cardEmail = cardEmail.toString().trim().isNotEmpty ? Uri.encodeComponent(cardEmail.toString()) : "0";
  cardLat = cardLat.toString().trim().isNotEmpty ? Uri.encodeComponent(cardLat.toString()) : "0";
  cardLong = cardLong.toString().trim().isNotEmpty ? Uri.encodeComponent(cardLong.toString()) : "0";
  cardAddress = cardAddress.toString().trim().isNotEmpty ? Uri.encodeComponent(cardAddress.toString()) : "0";
  cardCaption = cardCaption.toString().trim().isNotEmpty ? Uri.encodeComponent(cardCaption.toString()) : "0";
  cardBkColor = cardBkColor.toString().trim().isNotEmpty ? Uri.encodeComponent(cardBkColor.toString()) : "0";
  cardQrColor = cardQrColor.toString().trim().isNotEmpty ? Uri.encodeComponent(cardQrColor.toString()) : "0";
  cardUrlQr = cardUrlQr.toString().trim().isNotEmpty ? Uri.encodeComponent(cardUrlQr.toString()) : "0";
  cardUrlPicLogo = cardUrlPicLogo.toString().trim().isNotEmpty ? Uri.encodeComponent(cardUrlPicLogo.toString()) : "0";
  cardUrlPicProfile = cardUrlPicProfile.toString().trim().isNotEmpty ? Uri.encodeComponent(cardUrlPicProfile.toString()) : "0";
  cardUrlPicBk = cardUrlPicBk.toString().trim().isNotEmpty ? Uri.encodeComponent(cardUrlPicBk.toString()) : "0";
  cardUrlPicQr = cardUrlPicQr.toString().trim().isNotEmpty ? Uri.encodeComponent(cardUrlPicQr.toString()) : "0";
  idUserCard = idUserCard.toString().trim().isNotEmpty ? Uri.encodeComponent(idUserCard.toString()) : "0";
  datetimeAdd = datetimeAdd.toString().trim().isNotEmpty ? Uri.encodeComponent(datetimeAdd.toString()) : "0";
  card_website = card_website.toString().trim().isNotEmpty ? Uri.encodeComponent(card_website.toString()) : "0";
  def_card = def_card.toString().trim().isNotEmpty ? Uri.encodeComponent(def_card.toString()) : "0";
  // Construct the URL
  final url = Uri.parse('https://$address_ip:$port_/insert/insert_tbl_card/'
      '$cardTitle/'
      '$cardFname/'
      '$cardLname/'
      '$cardCoName/'
      '$cardJabTitle/'
      '$cardMobNum/'
      '$cardEmail/'
      '$cardLat/'
      '$cardLong/'
      '$cardAddress/'
      '$cardCaption/'
      '$cardBkColor/'
      '$cardQrColor/'
      '$cardUrlQr/'
      '$cardUrlPicLogo/'
      '$cardUrlPicProfile/'
      '$cardUrlPicBk/'
      '$cardUrlPicQr/'
      '$idUserCard/'
      '$datetimeAdd/'
      '$actCard/'
      '$def_card/$code_card/$card_website/$ppm_card/$hpi_card/$hdl_card');
  print("*****");
  print(url); // Optional: print the constructed URL
  final response = await http.get(url);
}

Future<void> insertContact(idCarduser, idCardFerend, nameContact, familyContact, coNameContact, jabTitleContact, mobContact, emailContact, lat, long,
    address, web_site, bio, url_logo, pic_url_ferend_) async {
  idCarduser = idCarduser.toString().trim().isNotEmpty ? Uri.encodeComponent(idCarduser.toString()) : "0";
  idCardFerend = idCardFerend.toString().trim().isNotEmpty ? Uri.encodeComponent(idCardFerend.toString()) : "0";
  nameContact = nameContact.toString().trim().isNotEmpty ? Uri.encodeComponent(nameContact.toString()) : "0";
  familyContact = familyContact.toString().trim().isNotEmpty ? Uri.encodeComponent(familyContact.toString()) : "0";
  coNameContact = coNameContact.toString().trim().isNotEmpty ? Uri.encodeComponent(coNameContact.toString()) : "0";
  jabTitleContact = jabTitleContact.toString().trim().isNotEmpty ? Uri.encodeComponent(jabTitleContact.toString()) : "0";
  mobContact = mobContact.toString().trim().isNotEmpty ? Uri.encodeComponent(mobContact.toString()) : "0";
  emailContact = emailContact.toString().trim().isNotEmpty ? Uri.encodeComponent(emailContact.toString()) : "0";
  web_site = web_site.toString().trim().isNotEmpty ? Uri.encodeComponent(web_site.toString()) : "0";
  bio = bio.toString().trim().isNotEmpty ? Uri.encodeComponent(bio.toString()) : "0";
  url_logo = url_logo.toString().trim().isNotEmpty ? Uri.encodeComponent(url_logo.toString()) : "0";
  lat = lat.toString().trim().isNotEmpty ? Uri.encodeComponent(lat.toString()) : "0";
  long = long.toString().trim().isNotEmpty ? Uri.encodeComponent(long.toString()) : "0";
  address = address.toString().trim().isNotEmpty ? Uri.encodeComponent(address.toString()) : "0";
  pic_url_ferend_ = pic_url_ferend_.toString().trim().isNotEmpty ? Uri.encodeComponent(pic_url_ferend_.toString()) : "0";

  final url = Uri.parse('https://$address_ip:$port_/insert/insert_tbl_contact/'
      '$user_id/'
      '$idCarduser/'
      '$idCardFerend/'
      '$nameContact/'
      '$familyContact/'
      '$coNameContact/'
      '$jabTitleContact/'
      '$mobContact/'
      '$emailContact/'
      '$pic_url_ferend_/'
      '$lat/$long/$address/$web_site/$bio/$url_logo');

  print(url); // Optional: print the constructed URL
  final response = await http.get(url);
}

Future<void> insert_link_card(id_user, id_card, name_logo, type_link_card, usarname_link_card, link_card, link_username, def_link_card) async {
  // Encode required fields
  if (name_logo.trim().isNotEmpty) {
    name_logo = Uri.encodeComponent(name_logo);
  } else {
    name_logo = "0";
  }
  if (type_link_card.trim().isNotEmpty) {
    type_link_card = Uri.encodeComponent(type_link_card);
  } else {
    type_link_card = "0";
  }

  // Encode optional fields
  usarname_link_card = usarname_link_card?.trim().isNotEmpty == true ? Uri.encodeComponent(usarname_link_card!) : "0";
  link_card = link_card?.trim().isNotEmpty == true ? Uri.encodeComponent(link_card!) : "0";
  link_username = link_username?.trim().isNotEmpty == true ? Uri.encodeComponent(link_username!) : "0";

  final url = Uri.parse(
    'https://$address_ip:$port_/insert/insert_tbl_link_card/$id_user/$id_card/$name_logo/$type_link_card/$usarname_link_card/$link_card/$link_username/$def_link_card/${DateTime.now()}',
  );
  print(url);
  final response = await http.get(url);
}

Future<void> insert_user_2(fname, lname, email, pass, mob, context) async {
  int email_marketing = 0;
  if (isChecked2) {
    email_marketing = 1;
  } else {
    email_marketing = 0;
  }
  final body = jsonEncode({
    'customer': {
      'first_name': '$fname',
      'last_name': '$lname',
      'email': '$email',
      'phone': '$mob',
      'verified_email': true,
      'addresses': [
        {
          'address1': '123 Oak St',
          'city': 'Ott45awa',
          'province': 'ON',
          'phone': '555-125412',
          'zip': '14523 ABC',
          'last_name': '$lname',
          'first_name': '$fname',
          'country': 'CA'
        }
      ],
      'password': '$pass',
      'password_confirmation': '$pass',
      'send_email_welcome': true
    }
  });

  final response = await http.post(Uri.parse('https://cdc4de-51.myshopify.com/admin/api/2024-04/customers.json'),
      headers: {
        'X-Shopify-Access-Token': token_3,
        'Content-Type': 'application/json',
      },
      body: body);
  print(response);
  if (response.statusCode == 201) {
    print('Customer created successfully');
    await insert_user(
        list_text_new_val_insert_user[0].text,
        list_text_new_val_insert_user[1].text,
        list_text_new_val_insert_user[2].text,
        list_text_new_val_insert_user[3].text,
        list_text_new_val_insert_user[5].text,
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        DateTime.now().toString(),
        "",
        1,
        email_marketing);
    await select_user_email(list_text_new_val_insert_user[2].text.toString().trim());
    await insert_user_device_add(list_user[0]['id_user'].toString(), deviceId.toString(), DateTime.now().toString(), 1);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("user is create"),
    ));
    // print(response.body);
  } else {
    print('Failed to create customer');
    print('Status code: ${response.request}');
    print('Status code: ${response.reasonPhrase}');
  }
}

Future<void> insert_user_3(fname, lname, email, pass, mob, context) async {
  final body = jsonEncode({
    'customer': {
      'first_name': '$fname',
      'last_name': '$lname',
      'email': '$email',
      'phone': '$mob',
      'verified_email': true,
      'addresses': [
        {
          'address1': '123 Oak St',
          'city': 'Ott45awa',
          'province': 'ON',
          'phone': '555-125412',
          'zip': '14523 ABC',
          'last_name': '$lname',
          'first_name': '$fname',
          'country': 'CA'
        }
      ],
      'password': '$pass',
      'password_confirmation': '$pass',
      'send_email_welcome': true
    }
  });

  final response = await http.post(Uri.parse('https://cdc4de-51.myshopify.com/admin/api/2024-04/customers.json'),
      headers: {
        'X-Shopify-Access-Token': token_3,
        'Content-Type': 'application/json',
      },
      body: body);
  print(response);
  if (response.statusCode == 201) {
    print('Customer created successfully');

    await select_user_email(list_text_new_val_insert_user[2].text.toString().trim());
    await insert_user_device_add(list_user[0]['id_user'].toString(), deviceId.toString(), DateTime.now().toString(), 1);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("user is create"),
    ));
    // print(response.body);
  } else {
    print('Failed to create customer');
    print('Status code: ${response.request}');
    print('Status code: ${response.reasonPhrase}');
  }
}
