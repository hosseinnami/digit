import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../control/val/control_val.dart';

void dialog_1(final BuildContext context_, final DialogType dialogType_, final void Function()? btnOkOnPress_, final String heder_,
    final String footer_, final bool act_circel, final Color color_, final String txt_btn) {
  AwesomeDialog(
    btnOkColor: color_,
    btnOkText: txt_btn,
    dialogBackgroundColor: Colors.grey.shade200,
    context: context_,
    animType: AnimType.bottomSlide,
    dialogType: dialogType_,
    body: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(heder_,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: font_size_14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
        SizedBox(
          height: 10,
        ),
        Text(footer_,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: font_size_14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
        SizedBox(
          height: 20,
        ),
      ],
    ),
    btnOkOnPress: btnOkOnPress_,
  ).show();
}

void dialog_2(
  final BuildContext context_,
  final DialogType dialogType_,
  final void Function()? btnOkOnPress_,
  final String heder_,
  final String footer_,
  final bool act_circel,
  final Color color_ok,
  final String txt_btn_ok,
  final Color color_no,
  final String txt_btn_no,
  final void Function()? btnCancelOnPress_,
) {
  AwesomeDialog(
    btnOkColor: color_ok,
    btnOkText: txt_btn_ok,
    btnOkOnPress: btnOkOnPress_,
    btnCancelColor: color_no,
    btnCancelText: txt_btn_no,
    btnCancelOnPress: btnCancelOnPress_,
    dialogBackgroundColor: Colors.grey.shade200,
    context: context_,
    animType: AnimType.bottomSlide,
    dialogType: dialogType_,
    body: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(heder_,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: font_size_18,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
        SizedBox(
          height: 10,
        ),
        Text(footer_,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: font_size_14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
        SizedBox(
          height: 20,
        ),
        Visibility(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
          visible: act_circel,
        ),
      ],
    ),
  ).show();
}
