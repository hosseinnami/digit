
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:digicapp/page/activation/frm_active_view_qr.dart';
import 'package:digicapp/widget/dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

String type_divice = "";

String get_code = "";
String id_card = "";


class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (controller != null) {
      controller!.pauseCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 || MediaQuery.of(context).size.height < 400) ? 150.0 : 300.0;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(borderColor: Colors.red, borderRadius: 10, borderLength: 30, borderWidth: 10, cutOutSize: scanArea),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      get_code = scanData.code.toString();
      // وقتی کد QR شناسایی شد
      controller.dispose(); // متوقف کردن اسکن
      Get.off(qr_activation_view()); // جایگزینی صفحه با استفاده از GetX

    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
