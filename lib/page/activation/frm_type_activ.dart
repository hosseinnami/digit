import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/h10.dart';
import 'package:digicapp/page/activation/frm_active_view_qr.dart';
import 'package:digicapp/page/activation/frm_qr_registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../control/val/val_pic.dart';

class type_active extends StatelessWidget {
  final get_code;
  final String id_card;
  const type_active({Key? key, this.get_code, required this.id_card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Image.network(
                  val_pic_png_network[15],
                  height: 90,
                  fit: BoxFit.fill,
                  width: with_screen,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Text("A C T I V A T I O N",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: Colors.black,
                            fontSize: font_size_16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                          )),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Step 1 :",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                  //  Get.to(QRViewExample());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.grey.shade200,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Center(
                          child: Image.network(
                            "https://$address_ip/digic_pic/user/share/DIGICA_icons/QR/Profile_QR.png",
                            width: 65,
                            height: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Active QR CODE",
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              color: Colors.grey.shade700,
                              fontSize: font_size_14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Step 2 :",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    get_code_nfc = get_code;
                    id_card_nfc = id_card;
                    // Get.to(nfc_reader());
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.grey.shade200,
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Center(
                          child: Image.network(
                            "https://$address_ip/digic_pic/user/share/DIGICA_icons/NFC.png",
                            width: 65,
                            height: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Active NFC",
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              color: Colors.grey.shade700,
                              fontSize: font_size_14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
