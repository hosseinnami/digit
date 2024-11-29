//
//
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:digicapp/control/help.dart';
import 'package:digicapp/control/select.dart';
import 'package:digicapp/control/update.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:digicapp/control/val/val_pic.dart';
import 'package:digicapp/page/activation/frm_active_view_qr.dart';
import 'package:digicapp/widget/btn_nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../widget/dialog.dart';

// class nfc_reader extends StatefulWidget {
//   @override
//   _NfcPageState createState() => _NfcPageState();
// }
//
// class _NfcPageState extends State<nfc_reader> {
//   String _nfcMessage = 'NFC URL will be shown here';
//   TextEditingController _urlController = TextEditingController();
//
//   Future<void> _readNfcTag() async {
//     try {
//       bool isAvailable = await NfcManager.instance.isAvailable();
//       if (!isAvailable) {
//         setState(() {
//           _nfcMessage = 'NFC is not available on this device';
//         });
//         return;
//       }
//
//       NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
//         var ndef = Ndef.from(tag);
//         if (ndef == null || !ndef.isWritable) {
//           setState(() {
//             _nfcMessage = 'Tag is not NDEF writable';
//           });
//           return;
//         }
//
//         NdefMessage message = ndef.cachedMessage!;
//         if (message.records.isNotEmpty) {
//           setState(() {
//             _nfcMessage = String.fromCharCodes(message.records.first.payload);
//           });
//           await update_card_url(id_card_nfc, extractLastPart(_nfcMessage));
//         }
//
//         NfcManager.instance.stopSession();
//       });
//     } catch (e) {
//       setState(() {
//         _nfcMessage = 'Failed to read NFC: $e';
//       });
//     }
//   }
//
//   Future<void> _writeNfcTag(String url) async {
//     try {
//       bool isAvailable = await NfcManager.instance.isAvailable();
//       if (!isAvailable) {
//         setState(() {
//           _nfcMessage = 'NFC is not available on this device';
//         });
//         return;
//       }
//
//       NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
//         var ndef = Ndef.from(tag);
//         if (ndef == null || !ndef.isWritable) {
//           setState(() {
//             _nfcMessage = 'Tag is not NDEF writable';
//           });
//           return;
//         }
//
//         NdefRecord record = NdefRecord.createUri(Uri.parse(url));
//         NdefMessage message = NdefMessage([record]);
//
//         await ndef.write(message);
//
//         setState(() {
//           _nfcMessage = 'NFC tag updated successfully';
//         });
//
//         NfcManager.instance.stopSession();
//       });
//     } catch (e) {
//       setState(() {
//         _nfcMessage = 'Failed to write NFC: $e';
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Stack(
//             alignment: AlignmentDirectional.bottomCenter,
//             children: [
//               Image.network(
//                 val_pic_png_network[15],
//                 height: 90,
//                 fit: BoxFit.fill,
//                 width: with_screen,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.pop(context);
//                           },
//                           child: const Icon(
//                             Icons.arrow_back,
//                             color: Colors.black,
//                             size: 30,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(" NFC Activation",
//                         style: GoogleFonts.roboto(
//                           textStyle: Theme.of(context).textTheme.displayLarge,
//                           color: Colors.black,
//                           fontSize: font_size_20,
//                           fontWeight: FontWeight.w600,
//                           fontStyle: FontStyle.normal,
//                         )),
//                     Container()
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//           Column(
//             children: [
//               Text(
//                 _nfcMessage,
//                 style: TextStyle(color: const Color.fromRGBO(245, 245, 247, 1)),
//               ),
//               Visibility(
//                 visible: true,
//                 child: SizedBox(
//                   height: 300,
//                   child: Image.asset(
//                     "assets/images/Searching_Icon.gif",
//                     height: 150,
//                     fit: BoxFit.fill,
//                     width: 300,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
//                     },
//                   ),
//                 ),
//               ),
//               Visibility(
//                 visible: false,
//                 child: Image.asset(
//                   "assets/images/Green_Tick.gif",
//                   height: 200,
//                   fit: BoxFit.fill,
//                   width: 200,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
//                   },
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: btn_digica_1(
//                 onPressed: () {
//                   _readNfcTag();
//                 },
//                 //  lbl: "Activation"
//                 //  lbl: "Searching"
//                 lbl: " Activated"),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//









class NfcReader extends StatefulWidget {
  @override
  _NfcPageState createState() => _NfcPageState();
}

class _NfcPageState extends State<NfcReader> {
  String _nfcMessage = 'Checking NFC...';
  bool _isSearching = true;

  @override
  void initState() {
    super.initState();
    _startNfcProcess();
  }

  Future<void> _startNfcProcess() async {
    try {
      bool isAvailable = await NfcManager.instance.isAvailable();
      if (!isAvailable) {
        setState(() {
          _nfcMessage = 'NFC is not available on this device.';
          _isSearching = false;
        });
        return;
      }

      // شروع جلسۀ NFC
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        var ndef = Ndef.from(tag);
        if (ndef == null) {
          setState(() {
            _nfcMessage = 'NFC tag is not supported.';
            _isSearching = false;
          });
          return;
        }

        NdefMessage? message = ndef.cachedMessage;
        if (message != null && message.records.isNotEmpty) {
          String payload = String.fromCharCodes(message.records.first.payload);

          setState(() {
            _nfcMessage = 'Successful operation!';
            _isSearching = false;
          });

          // بروزرسانی کارت NFC

          await select_tbl_card_qr_nfc(extractLastPart(payload));

        if(list_all_card.isEmpty)
          {
            await update_card_url(id_card_nfc, extractLastPart(payload));
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pushReplacementNamed(context, '/type_active');
            });
          }
        else {
          dialog_1(context, DialogType.warning, () {

          }, "Set NFC", "The NFC tag has already been used.", true,
              Colors.orangeAccent, "Close");
          setState(() {
            _nfcMessage = 'The NFC tag has already been used.';
            _isSearching = false;
          });
        }
          // هدایت به صفحه‌ی دیگر

        } else {
          setState(() {
            _nfcMessage = 'The NFC tag does not contain valid information.';
            _isSearching = false;
          });
        }

        NfcManager.instance.stopSession();
      });
    } catch (e) {
      setState(() {
        _nfcMessage = 'Error reading NFC: $e';
        _isSearching = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 247, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(" NFC Activation",
                        style: GoogleFonts.roboto(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        )),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(

              children: [
                Text(
                  _nfcMessage,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                if (_isSearching)
                  SizedBox(
                    height: 300,
                    child: Image.asset(
                      "assets/images/Searching_Icon.gif",
                      height: 150,
                      fit: BoxFit.fill,
                      width: 300,
                    ),
                  )
                else
                  Image.asset(
                    "assets/images/Green_Tick.gif",
                    height: 200,
                    fit: BoxFit.fill,
                    width: 200,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
