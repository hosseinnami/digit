import 'package:digicapp/control/val/control_val.dart';
import 'package:http/http.dart' as http;

import 'db_base.dart';

Future<void> update_card_url(id_card, new_url) async {
  if (new_url.trim().isNotEmpty) {
    new_url = Uri.encodeComponent(new_url);
  } else {
    new_url = "0";
  }

  final url = Uri.parse('https://$address_ip:$port_/update/update_tbl_card_url/$id_card/$new_url');
  print(url);
  final response = await http.get(url);
}

Future<void> update_tbl_card_def_user() async {
  final url = Uri.parse('https://$address_ip:$port_/update/update_tbl_card_def_user/$user_id');
  print(url);
  final response = await http.get(url);
}

Future<void> updateCard(
    id_card,
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
    cardUrlPicLogo,
    cardUrlPicProfile,
    cardUrlPicBk,
    cardUrlPicQr,
    def_card,
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

  cardUrlPicLogo = cardUrlPicLogo.toString().trim().isNotEmpty ? Uri.encodeComponent(cardUrlPicLogo.toString()) : "0";
  cardUrlPicProfile = cardUrlPicProfile.toString().trim().isNotEmpty ? Uri.encodeComponent(cardUrlPicProfile.toString()) : "0";
  cardUrlPicBk = cardUrlPicBk.toString().trim().isNotEmpty ? Uri.encodeComponent(cardUrlPicBk.toString()) : "0";
  cardUrlPicQr = cardUrlPicQr.toString().trim().isNotEmpty ? Uri.encodeComponent(cardUrlPicQr.toString()) : "0";

  card_website = card_website.toString().trim().isNotEmpty ? Uri.encodeComponent(card_website.toString()) : "0";
  def_card = def_card.toString().trim().isNotEmpty ? Uri.encodeComponent(def_card.toString()) : "0";
  // Construct the URL
  final url = Uri.parse('https://$address_ip:$port_/update/update_tbl_card/'
      '$id_card/'
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
      '$cardUrlPicLogo/'
      '$cardUrlPicProfile/'
      '$cardUrlPicBk/'
      '$cardUrlPicQr/'
      '$def_card/$card_website/$ppm_card/$hpi_card/$hdl_card');
  print("*****");
  print(url); // Optional: print the constructed URL
  final response = await http.get(url);
}

Future<void> update_contact(id_contact, name_contact, family_contact, co_name_contact, jab_title_contact, mob_contact, email_contact, lat, long,
    adress, web_site_contact, bio_contact) async {
  // Encode each parameter if not empty
  id_contact = id_contact.toString().trim().isNotEmpty ? Uri.encodeComponent(id_contact.toString()) : "0";
  name_contact = name_contact.toString().trim().isNotEmpty ? Uri.encodeComponent(name_contact.toString()) : "0";
  family_contact = family_contact.toString().trim().isNotEmpty ? Uri.encodeComponent(family_contact.toString()) : "0";
  co_name_contact = co_name_contact.toString().trim().isNotEmpty ? Uri.encodeComponent(co_name_contact.toString()) : "0";
  jab_title_contact = jab_title_contact.toString().trim().isNotEmpty ? Uri.encodeComponent(jab_title_contact.toString()) : "0";
  mob_contact = mob_contact.toString().trim().isNotEmpty ? Uri.encodeComponent(mob_contact.toString()) : "0";
  email_contact = email_contact.toString().trim().isNotEmpty ? Uri.encodeComponent(email_contact.toString()) : "0";
  lat = lat.toString().trim().isNotEmpty ? Uri.encodeComponent(lat.toString()) : "0";
  long = long.toString().trim().isNotEmpty ? Uri.encodeComponent(long.toString()) : "0";
  adress = adress.toString().trim().isNotEmpty ? Uri.encodeComponent(adress.toString()) : "0";
  web_site_contact = web_site_contact.toString().trim().isNotEmpty ? Uri.encodeComponent(web_site_contact.toString()) : "0";
  bio_contact = bio_contact.toString().trim().isNotEmpty ? Uri.encodeComponent(bio_contact.toString()) : "0";

  // Construct the URL
  final url = Uri.parse(
      'https://$address_ip:$port_/update/update_tbl_contact/$id_contact/$name_contact/$family_contact/$co_name_contact/$jab_title_contact/$mob_contact/$email_contact/$lat/$long/$adress/$web_site_contact/$bio_contact');
  print("*****");
  print(url); // Optional: print the constructed URL
  final response = await http.get(url);
}

Future<void> update_tbl_contact_draft(id_card) async {
  final url = Uri.parse('https://$address_ip:$port_/update/update_tbl_contact_draft/$id_card');
  print("*****");
  print(url); // Optional: print the constructed URL
  final response = await http.get(url);
}

Future<void> update_tbl_contact_transfer(id_contact, val) async {
  final url = Uri.parse('https://$address_ip:$port_/update/update_tbl_contact_transfer/$id_contact/$val');
  print("*****");
  print(url); // Optional: print the constructed URL
  final response = await http.get(url);
}
