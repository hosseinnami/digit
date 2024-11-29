import 'package:flutter/material.dart';

class LoadingDialog {
  // تابعی برای نمایش دیالوگ لودینگ
  static Future<void> show(BuildContext context, Future<void> Function() asyncOperation) async {
    // نمایش دیالوگ
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/Loading.gif", // جایگزینی تصویر لودینگ
                  height: 150,
                  width: 150,
                ),
                SizedBox(height: 5),
                Text(
                  'Please Wait...',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );

    // اجرای عملیات async که به تابع داده شده
    await asyncOperation();

    // بستن دیالوگ پس از اتمام عملیات
    Navigator.of(context).pop();
  }
}
