import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../widget/card_widget.dart';
import '../../widget/dialog.dart';
import 'ftp_panel.dart';

class delete_file_ftp extends StatefulWidget {
  final String fileName;
  final String patch_;
  const delete_file_ftp({required this.fileName, required this.patch_});

  @override
  State<delete_file_ftp> createState() => _delete_file_ftpState();
}

class _delete_file_ftpState extends State<delete_file_ftp> {
  Future<void> _deleteFile() async {
    try {
      await ftp.connect();
      await ftp.deleteFile("${widget.patch_}/${widget.fileName}");
      print("File deleted successfully");
    } catch (e) {
      print("File deletion failed: $e");
    } finally {
      ftp.disconnect();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          dialog_2(context, DialogType.warning, () {
            _deleteFile();
            Navigator.of(context).pop();
          }, "حذف فایل", " آیا از حذف این فایل اطمینان دارید ؟", false, Colors.green.shade900, "انجام شود", Colors.red.shade900, "منصرف شدم", () {});
        },
        child: card_sade(
          w_: 30,
          h_: 30,
          color_: Colors.red,
          crop_: 4,
          child_: Center(
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ));
  }
}
