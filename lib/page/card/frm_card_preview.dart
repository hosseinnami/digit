import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/widget/btn_nav.dart';
import 'package:digicapp/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../control/val/val_list.dart';
import '../new/frm_new_card.dart';
//form cotact profile
class card_preview extends StatefulWidget {
  final List name_card;
  const card_preview({Key? key, required this.name_card}) : super(key: key);

  @override
  State<card_preview> createState() => _my_card_meState();
}

List<Widget> lnk_share_priview = [];
List<Widget> lnk_share_priview2 = [];

class _my_card_meState extends State<card_preview> {
  void genarate_list_link_share() {
    lnk_share_priview = [];
    print(list_link_add_ofter.length);
    for (int i = 0; i < list_link_add_ofter.length; i++) {
      lnk_share_priview.add(GestureDetector(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Image.network(
                link_logo_add_link(list_link_add_ofter[i]['name_logo'].toString()).replaceAll(" ", "_"),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                },
              ),
            ),
            Text(list_link_add_ofter[i]['name_logo'].toString(),
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.displayLarge,
                  color: Colors.grey.shade700,
                  fontSize: font_size_14,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ))
          ],
        ),
      ));
    }
  }

  void genarate_list_link_share2() {
    lnk_share_priview2 = [];
    print(list_link_add_ofter.length);

    for (int i = 0; i < list_link_add_ofter.length; i++) {
      if (i < 5) {
        lnk_share_priview2.add(GestureDetector(
          onTap: () {},
          child: Image.network(
            height: 55,
            width: 55,
            link_logo_add_link(list_link_add_ofter[i]['name_logo'].toString()).replaceAll(" ", "_"),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
            },
          ),
        ));
      }
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // دسترسی به ویجت‌های موروثی مانند Theme.of(context) در اینجا انجام شود
    genarate_list_link_share();
    genarate_list_link_share2();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // create_list_card();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Stack(
                    children: [
                      card_sade(
                        w_: with_screen,
                        h_: 200,
                        color_: Colors.white,
                        crop_: 15,
                        child_: Image.network(
                          height: 190,
                          width: with_screen,
                          "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Digital_Card.png",
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.network(
                              height: 25,
                              width: 120,
                              "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Digicapp.png",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0, top: 5),
                            child: Text("DIGITAL CARD",
                                style: GoogleFonts.roboto(
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  color: Colors.black,
                                  fontSize: font_size_10,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 135.0),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.network(
                            height: 200,
                            width: 200,
                            "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Frame.png",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                            },
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(85.0),
                            child: Container(
                              width: 165,
                              height: 165,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(135.0)),
                                image: DecorationImage(
                                  image: list_image_send_ftp[1]['imageview'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 130.0, left: 130),
                            child: Image.network(
                              height: 75,
                              width: 75,
                              "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Frame.png",
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 130.0, left: 130),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(35.0),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(35.0)),
                                  image: DecorationImage(
                                    image: list_image_send_ftp[0]['imageview'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.name_card[2],
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      color: Colors.black,
                      fontSize: font_size_18,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )),
                SizedBox(
                  width: 8,
                ),
                Text(widget.name_card[3],
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      color: Colors.black,
                      fontSize: font_size_18,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                    )),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.name_card[1],
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      color: Colors.black,
                      fontSize: font_size_14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: lnk_share_priview2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.name_card[4],
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      color: Colors.black,
                      fontSize: font_size_14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.name_card[5],
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      color: Colors.black,
                      fontSize: font_size_14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.name_card[6],
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      color: Colors.black,
                      fontSize: font_size_14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    )),
              ],
            ),
            SizedBox(
              height: 450,
              width: with_screen - 20,
              child: GridView.count(
                  primary: false,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3, // Number of columns in the grid
                  children: lnk_share_priview),
            ),
            btn_digica_1(onPressed: () {}, lbl: "Save Contact")
          ],
        ),
      ),
    );
  }
}
