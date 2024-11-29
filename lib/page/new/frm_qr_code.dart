import 'package:digicapp/control/help.dart';
import 'package:digicapp/control/val/control_val.dart';
import 'package:digicapp/control/val/val_list.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';

import '../../../control/val/val_pic.dart';
import '../../../widget/btn_nav.dart';

class qr_code extends StatefulWidget {
  final String val_qr;
  final int type_frm_qr;
  const qr_code({Key? key, required this.val_qr, required this.type_frm_qr}) : super(key: key);

  @override
  State<qr_code> createState() => _new_cardState();
}

List<bool> visibliti_qr = [false, false];

class _new_cardState extends State<qr_code> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (list_image_send_ftp.isEmpty) {
    // }
    final assetImage = const AssetImage('assets/images/Black_3D_T.png');

    code_card = create_new_code();
    list_text_edite_val_card[7] = TextEditingController();
    // list_text_edite_val_card[7].text = list_card.first['card_address'].toString();
    // _controller.text = list_card.first['card_address'].toString();
    // try {
    //
    // } catch (e) {}
    if (widget.type_frm_qr == 1) {
      visibliti_qr = [true, false];
      size_panel = hight_screen-95 ;
    } else if (widget.type_frm_qr == 2) {
      visibliti_qr = [false, true];
      size_panel = hight_screen;
    }
  }

  double size_panel = 0;
  @override
  void dispose() {
    list_text_edite_val_card[7].dispose();

    // _currentTime?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  String code_card = "";
  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      // Use the dialogPickerColor as start and active color.
      color: selectedColor_qr,
      // Update the dialogPickerColor using the callback.
      onColorChanged: (Color color) => setState(() => selectedColor_qr = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
    ).showPickerDialog(
      context,
      // New in version 3.0.0 custom transitions support.
      transitionBuilder: (BuildContext context, Animation<double> a1, Animation<double> a2, Widget widget) {
        final double curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      constraints: const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
    );
  }

  XFile? _image;

  Future<void> _selectPhotoFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  Future<void> _selectPhotoFromCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 500,
      maxHeight: 500,
    );
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      drawerScrimColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Image.network(
              val_pic_png_network[15],
              height: 95,
              fit: BoxFit.fill,
              width: with_screen,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Text("View QR code",
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        color: Colors.black,
                        fontSize: font_size_18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      )),
                  SizedBox(width: 30,)
                ],
              ),
            ),
          ],
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image.network(
                  height: size_panel,
                  width: with_screen,
                  "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Digital_Card.png",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    height: 35,
                    width: 150,
                    "https://$address_ip/digic_pic/user/share/DIGICA_icons/Profile_Background/Profile_Digicapp.png",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Stack(

                  alignment: AlignmentDirectional.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Image.network(
                        height: 300,
                        width: 300,
                        "https://$address_ip/digic_pic/user/share/DIGICA_icons/qr/QR_Frame.png",
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network("https://$address_ip/assets/assets/images/25.png", width: 70, height: 70, fit: BoxFit.fitWidth);
                        },
                      ),
                    ),
                    Center(
                      child: StreamBuilder(
                        //Error number 2
                        stream: NumberCreator().stream,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.connectionState == ConnectionState.done) {
                            return const Text('done');
                          } else if (snapshot.hasError) {
                            return const Text('Error!');
                          } else {
                            return Container(
                              width: 240,
                              height: 240,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                                // color: Colors.grey,
                              ),
                              child: Center(
                                child: StreamBuilder(
                                    //Error number 2
                                    stream: NumberCreator().stream,
                                    builder: (context, snapshot) {
                                      // if (type_shape) {
                                      //   Shape_real = PrettyQrSmoothSymbol(
                                      //     color: selectedColor_qr,
                                      //     roundFactor: 1,
                                      //   );
                                      // } else {
                                      //   Shape_real = PrettyQrRoundedSymbol(
                                      //     color: selectedColor_qr,
                                      //     borderRadius: BorderRadius.all(Radius.circular(round_val_p4)),
                                      //   );
                                      // }

                                      return PrettyQrView.data(
                                        data: widget.val_qr,
                                        decoration: PrettyQrDecoration(
                                            // shape: Shape_real,
                                            // image: PrettyQrDecorationImage(
                                            //   fit: BoxFit.fill,
                                            //   padding: EdgeInsets.all(10),
                                            //  image: loadImageProviderFromUrl(pic_logo_qr),
                                            // ),
                                            ),
                                      );
                                    }),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: visibliti_qr[0],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10, top: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: btn_digica_1(
                                onPressed: () async {
                                  Share.share(
                                    link_qr,
                                    subject: "Digicapp.com",
                                  );
                                },
                                lbl: "Share")),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),


      ]),
    );
  }
}
