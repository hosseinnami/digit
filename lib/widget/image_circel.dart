import 'package:flutter/material.dart';

import '../control/help.dart';
import '../control/val/val_pic.dart';

List<Color> clr_my_app = [
  Colors.blue.shade800,
  Colors.blueGrey.shade700,
  Colors.blueGrey.shade500,
  Colors.red.shade900,
  Colors.blueGrey.shade100,
  Colors.grey.shade100,
];

class pic_circel extends StatelessWidget {
  final String link_pic;
  final double size_pic;
  const pic_circel({Key? key, required this.link_pic, required this.size_pic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(75.0)),
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
                clr_my_app[0],
                clr_my_app[3],
              ]),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  color: clr_my_app[0],
                  blurRadius: 5.0,
                ),
                BoxShadow(
                  offset: const Offset(0, 0),
                  color: clr_my_app[1],
                  blurRadius: 5.0,
                ),
                BoxShadow(
                  offset: const Offset(0, 0),
                  color: clr_my_app[2],
                  blurRadius: 5.0,
                ),
              ]),
          height: size_pic,
          width: size_pic,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(75.0),
          ),
        ),
        StreamBuilder(
            //Error number 2
            stream: NumberCreator().stream,
            builder: (context, snapshot) {
              return Image.network(
                link_pic,
                width: size_pic + 10,
                height: size_pic + 10,
                fit: BoxFit.fitHeight,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(val_pic_image_network[24], width: size_pic, height: size_pic, fit: BoxFit.contain);
                },
              );
            })
      ],
    );
  }
}
