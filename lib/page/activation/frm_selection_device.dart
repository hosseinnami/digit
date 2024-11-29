import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/h10.dart';
import 'package:digicapp/page/activation/frm_qr_registration.dart';
import 'package:digicapp/page/activation/nfc_reder.dart';
import 'package:digicapp/page/activation/tqr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../control/val/val_pic.dart';
import 'frm_active_view_qr.dart';

class select_device extends StatelessWidget {
  final get_code;
  final String id_card;
  const select_device({Key? key, this.get_code, required this.id_card}) : super(key: key);

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
                      Text("Device Selection",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            color: Colors.black,
                            fontSize: font_size_16,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal,
                          )),
                      SizedBox(
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
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                height: 600,
                child: GridView.count(
                    primary: false,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2, // Number of columns in the grid
                    children: [
                      GestureDetector(
                        onTap: () {
                          get_code_nfc = get_code;
                          id_card_nfc = id_card;
                          print(get_code_nfc);
                          print(id_card_nfc);

                      Get.to(QRViewExample());
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.network(
                                  "https://$address_ip/digic_pic/user/share/DIGICA_icons/Activation/Activation_Cards_icon.png",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Cards",
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
                      ),
                      GestureDetector(
                        onTap: () {
                          get_code_nfc = get_code;
                          id_card_nfc = id_card;
                          Get.to(QRViewExample());

                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.network(
                                  "https://$address_ip/digic_pic/user/share/DIGICA_icons/Activation/Activation_Business_Stands_icon.png",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Business Stands",
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
                      ),
                      GestureDetector(
                        onTap: () {
                          get_code_nfc = get_code;
                          id_card_nfc = id_card;
                          Get.to(NfcReader());
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.network(
                                  "https://$address_ip/digic_pic/user/share/DIGICA_icons/Activation/Activation_Tags.png",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Tags",
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
                      ),
                      GestureDetector(
                        onTap: () {
                          get_code_nfc = get_code;
                          id_card_nfc = id_card;
                          Get.to(QRViewExample());
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Image.network(
                                  "https://$address_ip/digic_pic/user/share/DIGICA_icons/Activation/Activation_Stickers.png",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("Stickers",
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
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
