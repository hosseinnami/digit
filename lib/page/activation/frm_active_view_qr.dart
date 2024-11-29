import 'dart:async';

import 'package:digicapp/control/help.dart';
import 'package:digicapp/control/update.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/val_pic.dart';
import 'package:digicapp/page/card/page_my_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'frm_qr_registration.dart';

String get_code_nfc = "";
String id_card_nfc = "";

class qr_activation_view extends StatefulWidget {
  @override
  _NfcPageState createState() => _NfcPageState();
}

class _NfcPageState extends State<qr_activation_view> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    act_divice();
    time_act();
  }

  Future<void> act_divice() async {
     print(extractLastPart(get_code));
   await update_card_url(id_card_nfc, extractLastPart(get_code));
  }

  List<bool> view_pogress = [true, false, false];
  Future<void> time_act() async {
    await Future.delayed(const Duration(seconds: 5), () {
      //add count to stream
      setState(() {
        view_pogress = [false, true, false];
      });
    });
    await Future.delayed(const Duration(seconds: 2), () {
      //add count to stream
      setState(() {
        view_pogress = [false, false, true];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              //   Text(get_code),
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
                            Get.off(my_card());
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    Text(" NFC Activation",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: font_size_20,
                          fontWeight: FontWeight.w600,
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

          Column(
            children: [
              // Text(get_code),
              SizedBox(
                height: 100,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Visibility(
                    visible: view_pogress[0],
                    child: Image.asset(
                      "assets/images/Loading.gif",
                      height: 180,
                      fit: BoxFit.cover,
                      width: 180,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                      },
                    ),
                  ),
                  Visibility(
                    visible: view_pogress[1],
                    child: Image.network(
                      "https://$address_ip/digic_pic/user/share/DIGICA_icons/Loading_Static.png",
                      height: 185,
                      fit: BoxFit.cover,
                      width: 180,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                      },
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Visibility(
                    visible: view_pogress[0],
                    child: Image.asset(
                      "assets/images/Progress_Bar.gif",
                      height: 85,
                      fit: BoxFit.fill,
                      width: with_screen,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                      },
                    ),
                  ),
                  Visibility(
                    visible: view_pogress[1],
                    child: Image.network(
                      "https://$address_ip/digic_pic/user/share/DIGICA_icons/activation/Progress_Bar_Static.png",
                      height: 85,
                      fit: BoxFit.fill,
                      width: with_screen,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Visibility(
                        visible: view_pogress[2],
                        child: Image.network(
                          "https://$address_ip/digic_pic/user/share/DIGICA_icons/Loading_Static.png",
                          height: 185,
                          fit: BoxFit.cover,
                          width: 180,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Visibility(
                        visible: view_pogress[2],
                        child: Text("Your Device has been Activated Successfully!",
                            style: GoogleFonts.bonaNova(
                              textStyle: Theme.of(context).textTheme.displayLarge,
                              color: Colors.black,
                              fontSize: font_size_14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // TextField(
          //   controller: _urlController,
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: 'Enter URL to write to NFC Tag',
          //   ),
          // ),
          // SizedBox(height: 20),
          // ElevatedButton(
          //   onPressed: () => _writeNfcTag(_urlController.text),
          //   child: Text('Write NFC Tag'),
          // ),
        ],
      ),
    );
  }
}
