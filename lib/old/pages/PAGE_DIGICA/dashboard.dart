import 'package:digicapp/control/val/control_val.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class dashbord_p extends StatelessWidget {
  const dashbord_p({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawerScrimColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text("DASHBOARD",
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.displayLarge,
              color: Colors.white,
              fontSize: font_size_14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            )),
        centerTitle: true,
      ),
    );
  }
}
