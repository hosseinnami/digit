import 'package:digicapp/control/val/control_val.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/t1.dart';

class check_email extends StatelessWidget {
  const check_email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawerScrimColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text("Activate Email",
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.displayLarge,
              color: Colors.black,
              fontSize: font_size_14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Text("Please enter the verification code sent to your email.",
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.displayLarge,
                color: Colors.black,
                fontSize: font_size_16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              )),
          const SizedBox(height: 20),
          FractionallySizedBox(
            widthFactor: 1,
            child: PinputExample(code_check: code_insert_verify),
          ),
        ],
      ),
    );
  }
}
