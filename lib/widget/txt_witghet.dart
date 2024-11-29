import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../control/val/control_val.dart';

class text_fild_me_4 extends StatelessWidget {
  final ValueChanged<String>? onChanged_;
  final int max_;
  final String label_;
  final String hiden_text;
  final TextInputType keyboardType_;

  final bool act_lable;
  final bool act_icon;
  final TextEditingController txt_edit;
  const text_fild_me_4(
      {Key? key,
      this.onChanged_,
      required this.label_,
      required this.hiden_text,
      required this.keyboardType_,
      required this.act_icon,
      required this.txt_edit,
      required this.act_lable,
      required this.max_})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Visibility(
          //       visible: act_lable,
          //       child: Text(label_,
          //           style: GoogleFonts.roboto(
          //             textStyle: Theme.of(context).textTheme.displayLarge,
          //             color: Colors.white,
          //             fontSize: font_size_16,
          //             fontWeight: FontWeight.w400,
          //             fontStyle: FontStyle.normal,
          //           )),
          //     ),
          //     Visibility(
          //       visible: act_icon,
          //       child: Icon(
          //         Icons.star,
          //         color: Colors.yellow,
          //       ),
          //     ),
          //   ],
          // ),
          Card(
            color: Colors.grey.shade300,
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: TextField(
                controller: txt_edit,
                maxLength: max_,
                keyboardType: keyboardType_,
                onChanged: onChanged_,
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  color: Colors.black,
                  fontSize: font_size_16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  hintText: hiden_text,
                  counterText: '',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class text_fild_me_multi_line extends StatelessWidget {
  final ValueChanged<String>? onChanged_;
  final String label_;
  final String hiden_text;
  final TextInputType keyboardType_;
  final Icon icon_;
  final bool act_icon;
  final int line_;
  final TextEditingController txt_edit;
  const text_fild_me_multi_line(
      {Key? key,
      this.onChanged_,
      required this.label_,
      required this.hiden_text,
      required this.keyboardType_,
      required this.icon_,
      required this.act_icon,
      required this.line_,
      required this.txt_edit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label_,
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.displayLarge,
              color: Colors.white,
              fontSize: font_size_16,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
          ),
          Card(
            color: Colors.white10,
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              height: line_ * 40,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: TextField(
                controller: txt_edit,
                maxLines: 99,
                keyboardType: keyboardType_,
                onChanged: onChanged_,
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  color: Colors.white,
                  fontSize: font_size_16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
                decoration: InputDecoration(
                  hintText: hiden_text,
                  hintStyle: const TextStyle(color: Colors.white30),
                  labelStyle: const TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
