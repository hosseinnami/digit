import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/widget/btn_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../frm_web_view.dart';

class frm_learn extends StatefulWidget {
  const frm_learn({Key? key}) : super(key: key);

  @override
  State<frm_learn> createState() => _frm_learnState();
}

class _frm_learnState extends State<frm_learn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page_navig = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawerScrimColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: with_screen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () async {
                  Get.to(const WebViewScreen(val: ["News", 'https://www.digica.app/blogs/news']));
                },
                child: Container(
                  width: with_screen - 50,
                  height: hight_screen - 150,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://$address_ip/digic_pic/user/share/Tutorials/Tutorial_01.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 700,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 25.0, right: 25),
              //     child: GridView.count(
              //       primary: false,
              //       mainAxisSpacing: 25,
              //       crossAxisSpacing: 25,
              //       scrollDirection: Axis.vertical,
              //       crossAxisCount: 2, // Number of columns in the grid
              //       children: [
              //         tutorial_panel(link: "https://$address_ip/digic_pic/user/share/Tutorials/Tutorial_02.png"),
              //         tutorial_panel(link: "https://$address_ip/digic_pic/user/share/Tutorials/Tutorial_03.png"),
              //         tutorial_panel(link: "https://$address_ip/digic_pic/user/share/Tutorials/Tutorial_04.png"),
              //         tutorial_panel(link: "https://$address_ip/digic_pic/user/share/Tutorials/Tutorial_05.png"),
              //         tutorial_panel(link: "https://$address_ip/digic_pic/user/share/Tutorials/Tutorial_06.png"),
              //         tutorial_panel(link: "https://$address_ip/digic_pic/user/share/Tutorials/Tutorial_07.png"),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navig(),
    );
  }
}

class tutorial_panel extends StatelessWidget {
  final String link;
  const tutorial_panel({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        image: DecorationImage(
          image: NetworkImage(
            link,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
