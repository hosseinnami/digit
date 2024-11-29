import 'dart:async';

import 'package:flutter/material.dart';

class AutoClosingDialog extends StatefulWidget {
  final int time__;
  final void Function() my;

  const AutoClosingDialog({Key? key, required this.time__, required this.my})
      : super(key: key);

  @override
  _AutoClosingDialogState createState() => _AutoClosingDialogState();
}

class _AutoClosingDialogState extends State<AutoClosingDialog> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: widget.time__), () {
      Navigator.of(context).pop();
      widget.my(); // Call the `my` function after the timer expires

    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        width: 45,
        height: 45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
