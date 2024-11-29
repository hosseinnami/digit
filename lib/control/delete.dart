import 'dart:async';

import 'package:digicapp/control/val/control_val.dart';
import 'package:http/http.dart' as http;

import 'db_base.dart';

Future<void> delete_card(id_card) async {
  final response = await http.get(Uri.parse('https://$address_ip:$port_/delete/delete_card/$id_card'));
}

Future<void> delete_link_card(id_card) async {
  final response = await http.get(Uri.parse('https://$address_ip:$port_/delete/delete_link_card/$id_card'));
}

Future<void> delete_tbl_contact(id_contact) async {
  final response = await http.get(Uri.parse('https://$address_ip:$port_/delete/delete_tbl_contact/$id_contact'));
}

Future<void> delete_tbl_user_device_add() async {
  final response = await http.get(Uri.parse('https://$address_ip:$port_/delete/delete_tbl_user_device_add/$deviceId'));
}

Future<void> delete_tbl_contact_id_card(id_card) async {
  final response = await http.get(Uri.parse('https://$address_ip:$port_/delete/delete_tbl_contact_id_card/$id_card'));
}

Future<void> delete_tbl_user() async {
  final response = await http.get(Uri.parse('https://$address_ip:$port_/delete/delete_tbl_user/$user_id'));
}

Future<void> delete_tbl_user_device_add_id_user() async {
  final response = await http.get(Uri.parse('https://$address_ip:$port_/delete/delete_tbl_user_device_add_id_user/$user_id'));
}

Future<void> delete_tbl_user_device_add_id_user2(user_id) async {
  final response = await http.get(Uri.parse('https://$address_ip:$port_/delete/delete_tbl_user_device_add_id_user/$user_id'));
}

Future<void> delete_tbl_contact_id_user() async {
  final response = await http.get(Uri.parse('https://$address_ip:$port_/delete/delete_tbl_contact_id_user/$user_id'));
}

Future<void> delete_link_card_id_user() async {
  final response = await http.get(Uri.parse('https://$address_ip:$port_/delete/delete_link_card_id_user/$user_id'));
}
