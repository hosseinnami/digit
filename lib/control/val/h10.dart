// // import 'package:digicapp/control/val/val_pic.dart';
// // import 'package:digicapp/widget/btn_nav.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:nfc_manager/nfc_manager.dart';
// //
// // import '../help.dart';
// // import '../update.dart';
// // import 'control_val.dart';
// //
// // class nfc_reader extends StatefulWidget {
// //   final String get_code;
// //   final String id_card;
// //   const nfc_reader({Key? key, required this.get_code, required this.id_card}) : super(key: key);
// //
// //   @override
// //   State<StatefulWidget> createState() => _NfcPageState();
// // }
// //
// // class _NfcPageState extends State<nfc_reader> {
// //   String _nfcMessage = 'NFC URL will be shown here';
// //   TextEditingController _urlController = TextEditingController();
// //
// //   Future<void> _readNfcTag() async {
// //     try {
// //       bool isAvailable = await NfcManager.instance.isAvailable();
// //       if (!isAvailable) {
// //         setState(() {
// //           _nfcMessage = 'NFC is not available on this device';
// //         });
// //         return;
// //       }
// //
// //       NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
// //         var ndef = Ndef.from(tag);
// //         if (ndef == null || !ndef.isWritable) {
// //           setState(() {
// //             _nfcMessage = 'Tag is not NDEF writable';
// //           });
// //           return;
// //         }
// //
// //         NdefMessage message = ndef.cachedMessage!;
// //         if (message.records.isNotEmpty) {
// //           setState(() {
// //             _nfcMessage = String.fromCharCodes(message.records.first.payload);
// //           });
// //         }
// //
// //         NfcManager.instance.stopSession();
// //       });
// //     } catch (e) {
// //       setState(() {
// //         _nfcMessage = 'Failed to read NFC: $e';
// //       });
// //     }
// //   }
// //
// //   Future<void> _writeNfcTag(String url) async {
// //     try {
// //       bool isAvailable = await NfcManager.instance.isAvailable();
// //       if (!isAvailable) {
// //         setState(() {
// //           _nfcMessage = 'NFC is not available on this device';
// //         });
// //         return;
// //       }
// //
// //       NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
// //         var ndef = Ndef.from(tag);
// //         if (ndef == null || !ndef.isWritable) {
// //           setState(() {
// //             _nfcMessage = 'Tag is not NDEF writable';
// //           });
// //           return;
// //         }
// //
// //         NdefRecord record = NdefRecord.createUri(Uri.parse(url));
// //         NdefMessage message = NdefMessage([record]);
// //
// //         await ndef.write(message);
// //
// //         setState(() {
// //           _nfcMessage = 'NFC tag updated successfully';
// //         });
// //
// //         NfcManager.instance.stopSession();
// //       });
// //     } catch (e) {
// //       setState(() {
// //         _nfcMessage = 'Failed to write NFC: $e';
// //       });
// //     }
// //   }
// //
// //   String extractLastPart(String url) {
// //     List<String> parts = url.split('/');
// //     return parts.last;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         mainAxisSize: MainAxisSize.max,
// //         children: [
// //           Stack(
// //             alignment: AlignmentDirectional.centerStart,
// //             children: [
// //               Image.network(
// //                 val_pic_png_network[15],
// //                 height: 60,
// //                 fit: BoxFit.fill,
// //                 width: with_screen,
// //               ),
// //               Row(
// //                 children: [
// //                   const SizedBox(
// //                     width: 25,
// //                   ),
// //                   GestureDetector(
// //                     onTap: () {
// //                       Navigator.pop(context);
// //                     },
// //                     child: const Icon(
// //                       Icons.arrow_back,
// //                       color: Colors.black,
// //                       size: 35,
// //                     ),
// //                   ),
// //                   const SizedBox(
// //                     width: 15,
// //                   ),
// //                   Text("NFC Reader/Writer",
// //                       style: GoogleFonts.roboto(
// //                         textStyle: Theme.of(context).textTheme.displayLarge,
// //                         color: Colors.black,
// //                         fontSize: font_size_16,
// //                         fontWeight: FontWeight.w400,
// //                         fontStyle: FontStyle.normal,
// //                       )),
// //                 ],
// //               )
// //             ],
// //           ),
// //           const SizedBox(
// //             height: 50,
// //           ),
// //
// //           SizedBox(
// //             height: 200,
// //             child: StreamBuilder(
// //               //Error number 2
// //               stream: NumberCreator().stream,
// //               builder: (context, snapshot) {
// //                 if (snapshot.connectionState == ConnectionState.waiting) {
// //                   return Center(child: CircularProgressIndicator());
// //                 } else if (snapshot.connectionState == ConnectionState.done) {
// //                   return Text('done');
// //                 } else if (snapshot.hasError) {
// //                   return Text('Error!');
// //                 } else {
// //                   return Column(
// //                     children: [
// //                       Text(_nfcMessage),
// //                       Text(_nfcMessage.toString().replaceAll("digicapp.com/registration/accessories/", "")),
// //                       Text(extractLastPart(_nfcMessage)),
// //                     ],
// //                   );
// //                 }
// //               },
// //             ),
// //           ),
// //
// //           SizedBox(height: 100),
// //           btn_digica_1(
// //               onPressed: () {
// //                 setState(() {
// //                   _readNfcTag;
// //                 });
// //               },
// //               lbl: "Read NFC Tag"),
// //           SizedBox(height: 20),
// //           SizedBox(
// //             width: with_screen,
// //             height: 50,
// //             child: Padding(
// //               padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 5, top: 5),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                       flex: 1,
// //                       child: btn_digica_1(
// //                           onPressed: () async {
// //                             Navigator.of(context);
// //                           },
// //                           lbl: "Discard")),
// //                   const SizedBox(
// //                     width: 10,
// //                   ),
// //                   Expanded(
// //                       flex: 1,
// //                       child: btn_digica_1(
// //                           onPressed: () async {
// //                             if (widget.get_code != extractLastPart(_nfcMessage)) {
// //                               update_card_url(widget.id_card, extractLastPart(_nfcMessage));
// //                               Navigator.pop(context);
// //                             }
// //                           },
// //                           lbl: "Save"))
// //                 ],
// //               ),
// //             ),
// //           ),
// //           // TextField(
// //           //   controller: _urlController,
// //           //   decoration: InputDecoration(
// //           //     border: OutlineInputBorder(),
// //           //     labelText: 'Enter URL to write to NFC Tag',
// //           //   ),
// //           // ),
// //           // SizedBox(height: 20),
// //           // ElevatedButton(
// //           //   onPressed: () => _writeNfcTag(_urlController.text),
// //           //   child: Text('Write NFC Tag'),
// //           // ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:digicapp/control/help.dart';
// import 'package:digicapp/control/update.dart';
// import 'package:digicapp/control/val/control_val.dart';
// import 'package:digicapp/control/val/val_pic.dart';
// import 'package:digicapp/page/activation/frm_active_view_qr.dart';
// import 'package:digicapp/widget/btn_nav.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:nfc_manager/nfc_manager.dart';
//
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
//           // TextField(
//           //   controller: _urlController,
//           //   decoration: InputDecoration(
//           //     border: OutlineInputBorder(),
//           //     labelText: 'Enter URL to write to NFC Tag',
//           //   ),
//           // ),
//           // SizedBox(height: 20),
//           // ElevatedButton(
//           //   onPressed: () => _writeNfcTag(_urlController.text),
//           //   child: Text('Write NFC Tag'),
//           // ),
//         ],
//       ),
//     );
//   }
// }
