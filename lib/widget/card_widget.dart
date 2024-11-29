import 'package:digicapp/page/card/widghet_creat_list_card.dart';
import 'package:flutter/material.dart';

class card_sade extends StatefulWidget {
  final Widget? child_;
  final double w_;
  final double h_;
  final Color color_;
  final double crop_;
  const card_sade({Key? key, this.child_, required this.w_, required this.h_, required this.color_, required this.crop_}) : super(key: key);

  @override
  State<card_sade> createState() => _card_sadeState();
}

class _card_sadeState extends State<card_sade> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color_,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.crop_)),
      child: Container(height: widget.h_, width: widget.w_, margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6), child: widget.child_),
    );
  }
}

class card_sade2 extends StatefulWidget {
  final Widget? child_;
  final double w_;
  final double h_;
  final Color color_;
  final double crop_;
  const card_sade2({Key? key, this.child_, required this.w_, required this.h_, required this.color_, required this.crop_}) : super(key: key);

  @override
  State<card_sade2> createState() => _card_sadeState2();
}

class _card_sadeState2 extends State<card_sade2> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color_,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.crop_)),
      child: Container(height: widget.h_, width: widget.w_, margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0), child: widget.child_),
    );
  }
}

class card_sade4 extends StatefulWidget {
  final Widget? child_;
  final double w_;
  final double h_;
  final Color color_;
  final double crop_;
  const card_sade4({Key? key, this.child_, required this.w_, required this.h_, required this.color_, required this.crop_}) : super(key: key);

  @override
  State<card_sade4> createState() => _card_sadeState4();
}

class _card_sadeState4 extends State<card_sade4> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color_,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.crop_)),
      child: Container(height: widget.h_, width: widget.w_, margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10), child: widget.child_),
    );
  }
}

class card_sade_color extends StatefulWidget {
  final Widget? child_;
  final double w_;
  final double h_;
  final Color color_;
  final double crop_;
  final List<Color> clr_;

  const card_sade_color({
    Key? key,
    this.child_,
    required this.w_,
    required this.h_,
    required this.color_,
    required this.crop_,
    required this.clr_,
  }) : super(key: key);

  @override
  State<card_sade_color> createState() => _card_sade_color();
}

class _card_sade_color extends State<card_sade_color> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      color: widget.color_,
      elevation: 50,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.crop_)),
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: widget.clr_),
          ),
          height: widget.h_,
          width: widget.w_,
          margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
          child: widget.child_),
    );
  }
}

class card_sade_border extends StatelessWidget {
  final Widget? child_;
  final double w_;
  final double h_;
  final Color color_;
  final double crop_;
  final Color color_border;
  const card_sade_border(
      {Key? key, this.child_, required this.w_, required this.h_, required this.color_, required this.crop_, required this.color_border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color_,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(crop_), side: BorderSide(width: 2, color: color_border)),
      child: Container(height: h_, width: w_, margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6), child: child_),
    );
  }
}

class card_sade_border3 extends StatelessWidget {
  final Widget? child_;
  final double w_;
  final double h_;
  final Color color_;
  final double crop_;
  final Color color_border;
  const card_sade_border3(
      {Key? key, this.child_, required this.w_, required this.h_, required this.color_, required this.crop_, required this.color_border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color_,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(crop_), side: BorderSide(width: 2, color: color_border)),
      child: Container(height: h_, width: w_, margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0), child: child_),
    );
  }
}

class card_sade_border2 extends StatelessWidget {
  final Widget? child_;
  final double w_;
  final double h_;
  final double white_border;
  final Color color_;
  final double crop_;
  final Color color_border;
  const card_sade_border2(
      {Key? key,
      this.child_,
      required this.w_,
      required this.h_,
      required this.color_,
      required this.crop_,
      required this.color_border,
      required this.white_border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color_,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(crop_), side: BorderSide(width: white_border, color: color_border)),
      child: Container(height: h_, width: w_, margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4), child: child_),
    );
  }
}
class card_show_withget extends StatefulWidget {
  final Widget widget_;
  const card_show_withget({super.key, required this.widget_});

  @override
  State<card_show_withget> createState() => _card_show_withgetState();
}

class _card_show_withgetState extends State<card_show_withget> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: no_card,
      child: widget.widget_,
    );
  }
}
