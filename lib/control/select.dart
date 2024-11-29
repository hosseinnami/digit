import 'dart:async';
import 'dart:convert';

import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:digicapp/control/val/val_list_shopify.dart';
import 'package:http/http.dart' as http;

import 'db_base.dart';

//String address_ip = '192.168.1.106';

Future<void> select_user(email, pass) async {
  if (email.toString().trim().isNotEmpty) {
    email = Uri.encodeComponent(email);
  } else {
    email = "0";
  }

  if (pass.toString().trim().isNotEmpty) {
    pass = Uri.encodeComponent(pass);
  } else {
    pass = "0";
  }
  list_user.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_user/$email/$pass'));
  print(response);
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_user = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }
  print(list_user);
}

Future<void> select_user_email(email) async {
  if (email.toString().trim().isNotEmpty) {
    email = Uri.encodeComponent(email);
  } else {
    email = "0";
  }

  list_user.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_user_email/$email'));
  print('https://$address_ip:$port_/select/select_user_email/$email');
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_user = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }
 }

Future<void> select_uda() async {
  list_user.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_uda/$deviceId'));
  print(response);
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_user = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }
 }

Future<void> select_tbl_card() async {
  list_card.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_tbl_card/$user_id'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_card = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }

}

Future<void> select_tbl_card_id_card(id_card) async {
  list_card_select.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_tbl_card_id_card2/$id_card'));
  print(response);
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_card_select = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }
 }

Future<void> select_tbl_link_card(code_card) async {
  list_card_link_share.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_tbl_link_card/$code_card'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_card_link_share = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }
 }

Future<void> select_tbl_pass_app() async {
  list_tbl_pass_app.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/tbl_pass_app'));
  print(response);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_tbl_pass_app = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }
 // print(list_tbl_pass_app);
}

Future<void> select_tbl_card_user_id_titr(title) async {
  list_card_select.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_tbl_card_user_id_titr/$user_id/$title'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_card_select = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }

}

Future<void> select_tbl_card_user_id_titr_edit(title) async {
  list_card_select_edit.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_tbl_card_user_id_titr/$user_id/$title'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_card_select_edit = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }
 }

Future<void> select_tbl_contact_card(id_card_user) async {
  list_contact_card.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_tbl_contact_card/$user_id/$id_card_user'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_contact_card = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }
 }

Future<void> select_contact_id_contact(id_contact) async {
  list_contact_select.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_contact_id_contact/$id_contact'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_contact_select = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }
 }

List<Customer> listUserShopify = [];

Future<void> selectShopify() async {
  list_user_sopify.clear();
  final response = await http.get(
    Uri.parse('https://cdc4de-51.myshopify.com/admin/api/2024-04/customers.json'),
    headers: {
      'X-Shopify-Access-Token': token_3,
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final List<dynamic> customersJson = jsonData['customers'];
    list_user_sopify = List.from(customersJson);
  } else {
    throw Exception('Failed to load data');
  }
 }

Future<bool> checkImageUrl1(String url) async {
  try {
    final response = await http.head(Uri.parse(url));
    print("ok");
    return response.statusCode == 200;
  } catch (e) {
    print("no");
    return false; // در صورت بروز خطا، لینک نامعتبر است
  }
}

Future<void> select_tbl_card_qr_nfc(nfc) async {
  list_all_card.clear();
  final response = await http.get(Uri.parse('https://$address_ip:$port_/select/select_tbl_card_qr_nfc/$nfc'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as List<dynamic>;
    list_all_card = List.from(jsonData);
  } else {
    throw Exception('Failed to load data');
  }

}
