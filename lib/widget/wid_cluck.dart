import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../control/val/val_pic.dart';

class my_cluck extends StatefulWidget {
  @override
  _MovingImageState createState() => _MovingImageState();
}

late DateTime _currentTime;
List get_time = ["", ""];
String pic_ = val_pic_image_network[22];
double redAngle = 0;
double minuteAngle = 0;
double secondAngle = 0;

class _MovingImageState extends State<my_cluck> {
  double _angle = 0.0;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = DateTime.now();
        redAngle = (2 * pi * (_currentTime.hour % 12 + _currentTime.minute / 60) / 12) - (pi / 2);
        minuteAngle = (2 * pi * _currentTime.minute / 60) - (pi / 2);
        //redAngle = (2 * pi * _currentTime.second / 10) - (pi / 2);

        get_time[0] = _currentTime.hour.toString();
        get_time[1] = _currentTime.minute.toString();

        if (get_time[0].length == 1) {
          get_time[0] = "0" + get_time[0];
        } else {
          get_time[0] = get_time[0];
        }
        if (get_time[1].length == 1) {
          get_time[1] = "0" + get_time[1];
        } else {
          get_time[1] = get_time[1];
        }

        if (_currentTime.hour >= 6 && _currentTime.hour < 18) {
          pic_ = val_pic_image_network[22];
        } else {
          pic_ = val_pic_image_network[15];
        }
      });
    });
  }

  @override
  void dispose() {
    // _currentTime?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _moveImage(Timer timer) {
    // Update the angle by a small amount to move the image along the circle
    setState(() {
      _angle += 0.090; // Adjust the speed of movement here
    });
  }

  int add_num = 80;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0, // Width of the container
      height: 200.0, // Height of the container
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Center(
            child: Container(
              child: Image.network(
                val_pic_image_network[23],
                fit: BoxFit.fill,
                width: 180,
                height: 180,
              ),
              // Diameter of the circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.transparent, width: 1.0),
              ),
            ),
          ),
          // Positioned(
          //   left: add_num + 50 * cos(minuteAngle),
          //   top: add_num + 50 * sin(minuteAngle),
          //   child: Icon(
          //     Icons.circle,
          //     color: Colors.grey,
          //     size: 10,
          //   ),
          // ),
          // Positioned(
          //   left: add_num + 50 * cos(secondAngle),
          //   top: add_num + 50 * sin(secondAngle),
          //   child: Icon(
          //     Icons.circle,
          //     color: Colors.amber,
          //     size: 10,
          //   ),
          // ),
          Positioned(
            left: add_num + 80 * cos(redAngle),
            top: add_num + 80 * sin(redAngle),
            child: Image.network(pic_, width: 40.0, height: 40.0),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${get_time[0]}:${get_time[1]}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "DIGICA",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
